<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>BA Calculator (MVP)</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <main class="container">
    <header>
      <h1>BA Calculator</h1>
      <p class="sub">Break-even & target-profit in seconds.</p>
    </header>

    <section class="card grid">
      <div class="pane">
        <h2>Inputs</h2>

        <label>
          Price per unit
          <input id="price" type="number" inputmode="decimal" step="0.01" min="0" value="25" />
        </label>

        <label>
          Variable cost per unit
          <input id="varCost" type="number" inputmode="decimal" step="0.01" min="0" value="10" />
        </label>

        <label>
          Total fixed costs (period)
          <input id="fixed" type="number" inputmode="decimal" step="0.01" min="0" value="5000" />
        </label>

        <div class="row">
          <label>
            Target profit (after-tax) — optional
            <input id="targetAfterTax" type="number" inputmode="decimal" step="0.01" min="0" />
          </label>
          <label>
            Tax rate (%) — optional
            <input id="taxRate" type="number" inputmode="decimal" step="0.01" min="0" max="100" />
          </label>
        </div>

        <label>
          Actual/Planned Sales $ — optional (for Margin of Safety)
          <input id="actualSales" type="number" inputmode="decimal" step="0.01" min="0" />
        </label>

        <div id="error" class="error" role="alert" hidden></div>
      </div>

      <div class="pane">
        <h2>Results</h2>
        <div class="kv">
          <div><span>Contribution Margin / Unit</span><strong id="cmUnit">—</strong></div>
          <div><span>CM Ratio</span><strong id="cmRatio">—</strong></div>
        </div>

        <h3>Break-Even</h3>
        <div class="kv">
          <div><span>Units</span><strong id="beUnits">—</strong></div>
          <div><span>Sales $</span><strong id="beSales">—</strong></div>
        </div>

        <h3>Target Profit</h3>
        <div class="kv">
          <div><span>Target Units</span><strong id="targetUnits">—</strong></div>
          <div><span>Target Sales $</span><strong id="targetSales">—</strong></div>
        </div>

        <h3>Margin of Safety</h3>
        <div class="kv">
          <div><span>MoS ($)</span><strong id="mosDollar">—</strong></div>
          <div><span>MoS (%)</span><strong id="mosPercent">—</strong></div>
        </div>

        <button id="copyBtn" class="btn">Copy results</button>
        <div id="copied" class="copied" hidden>Copied ✔</div>
      </div>
    </section>

    <footer>
      <small>v1.0 — MVP. No data stored.</small>
    </footer>
  </main>

  <script src="app.js"></script>
</body>
</html>
