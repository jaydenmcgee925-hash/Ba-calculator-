(function () {
  const $ = (id) => document.getElementById(id);
  const fmtMoney = (n) =>
    isFinite(n) ? `$${Number(n).toLocaleString(undefined,{minimumFractionDigits:2, maximumFractionDigits:2})}` : "—";
  const fmtUnits = (n) =>
    isFinite(n) ? `${Number(n).toLocaleString(undefined,{maximumFractionDigits:2})}` : "—";
  const fmtPct = (n) =>
    isFinite(n) ? `${(n*100).toLocaleString(undefined,{maximumFractionDigits:2})}%` : "—";

  const inputs = ["price","varCost","fixed","targetAfterTax","taxRate","actualSales"].map($);
  const out = {
    cmUnit: $("cmUnit"),
    cmRatio: $("cmRatio"),
    beUnits: $("beUnits"),
    beSales: $("beSales"),
    targetUnits: $("targetUnits"),
    targetSales: $("targetSales"),
    mosDollar: $("mosDollar"),
    mosPercent: $("mosPercent"),
  };
  const err = $("error");
  const copyBtn = $("copyBtn");
  const copied = $("copied");

  function val(n) {
    const v = parseFloat(n.value);
    return isFinite(v) ? v : 0;
  }

  function compute() {
    copied.hidden = true;
    err.hidden = true;
    err.textContent = "";

    const price = val($("price"));
    const varCost = val($("varCost"));
    const fixed = val($("fixed"));
    const targetAfterTax = $("targetAfterTax").value === "" ? null : val($("targetAfterTax"));
    const taxRateInput = $("taxRate").value === "" ? null : val($("taxRate"));
    const actualSalesInput = $("actualSales").value === "" ? null : val($("actualSales"));

    // Validation
    if (price < 0 || varCost < 0 || fixed < 0) {
      return showError("Inputs cannot be negative.");
    }
    if (taxRateInput !== null && (taxRateInput < 0 || taxRateInput >= 100)) {
      return showError("Tax rate must be between 0% and 99.99%.");
    }

    const cmUnit = price - varCost;
    if (cmUnit <= 0) {
      out.cmUnit.textContent = fmtMoney(cmUnit);
      out.cmRatio.textContent = "—";
      out.beUnits.textContent = "—";
      out.beSales.textContent = "—";
      out.targetUnits.textContent = "—";
      out.targetSales.textContent = "—";
      out.mosDollar.textContent = "—";
      out.mosPercent.textContent = "—";
      return showError("Price must exceed variable cost to compute break-even.");
    }

    const cmRatio = price > 0 ? cmUnit / price : NaN;

    const beUnits = fixed / cmUnit;
    const beSales = cmRatio > 0 ? fixed / cmRatio : NaN;

    // Target profit
    let targetUnits = NaN, targetSales = NaN;
    if (targetAfterTax !== null && targetAfterTax >= 0) {
      const taxRate = taxRateInput !== null ? taxRateInput / 100 : 0;
      const targetPreTax = (1 - taxRate) > 0 ? targetAfterTax / (1 - taxRate) : NaN;
      targetUnits = (fixed + targetPreTax) / cmUnit;
      targetSales = (fixed + targetPreTax) / cmRatio;
    } else {
      // default to break-even if no target
      targetUnits = beUnits;
      targetSales = beSales;
    }

    // Margin of Safety
    let mosDollar = NaN, mosPercent = NaN;
    if (actualSalesInput !== null && actualSalesInput >= 0 && isFinite(beSales)) {
      mosDollar = actualSalesInput - beSales;
      mosPercent = actualSalesInput > 0 ? mosDollar / actualSalesInput : NaN;
    }

    // write outputs
    out.cmUnit.textContent = fmtMoney(cmUnit);
    out.cmRatio.textContent = fmtPct(cmRatio);
    out.beUnits.textContent = fmtUnits(beUnits);
    out.beSales.textContent = fmtMoney(beSales);
    out.targetUnits.textContent = fmtUnits(targetUnits);
    out.targetSales.textContent = fmtMoney(targetSales);
    out.mosDollar.textContent = isFinite(mosDollar) ? fmtMoney(mosDollar) : "—";
    out.mosPercent.textContent = isFinite(mosPercent) ? fmtPct(mosPercent) : "—";
  }

  function showError(message) {
    err.textContent = message;
    err.hidden = false;
  }

  // Recalculate on any input change
  inputs.forEach((el) => {
    el.addEventListener("input", compute);
    el.addEventListener("change", compute);
  });

  // Copy results
  copyBtn.addEventListener("click", async () => {
    const text = [
      `CM/unit: ${$("cmUnit").textContent}`,
      `CM ratio: ${$("cmRatio").textContent}`,
      `BE units: ${$("beUnits").textContent}`,
      `BE sales: ${$("beSales").textContent}`,
      `Target units: ${$("targetUnits").textContent}`,
      `Target sales: ${$("targetSales").textContent}`,
      `Margin of Safety ($): ${$("mosDollar").textContent}`,
      `Margin of Safety (%): ${$("mosPercent").textContent}`,
    ].join("\n");

    try {
      await navigator.clipboard.writeText(text);
      copied.hidden = false;
      setTimeout(() => (copied.hidden = true), 2000);
    } catch {
      // Fallback
      const ta = document.createElement("textarea");
      ta.value = text; document.body.appendChild(ta);
      ta.select(); document.execCommand("copy");
      document.body.removeChild(ta);
      copied.hidden = false;
      setTimeout(() => (copied.hidden = true), 2000);
    }
  });

  // initial compute
  compute();
})();
