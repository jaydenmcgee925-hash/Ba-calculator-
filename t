# BA Calculator (MVP)

A single-screen calculator for break-even and target-profit analysis.

## What it does
- Contribution margin (per unit & ratio)
- Break-even units & sales dollars
- Units/sales $ for target profit (pre/post-tax)
- Margin of Safety (if you enter actual/planned sales)

## Inputs
- Price per unit
- Variable cost per unit
- Total fixed costs (per period)
- Optional: Target profit (after-tax), Tax rate
- Optional: Actual/Planned Sales $ (to show Margin of Safety)

## Run
Just open `index.html` in your browser. No build step.

## Formulas
- CM/unit = Price − VarCost  
- CM ratio = CM/unit ÷ Price  
- BE units = FixedCosts ÷ CM/unit  
- BE sales $ = FixedCosts ÷ CM ratio  
- If tax rate given: TargetProfit_preTax = TargetProfit_afterTax ÷ (1 − taxRate)  
- Target units = (FixedCosts + TargetProfit_preTax) ÷ CM/unit  
- Margin of Safety ($) = Actual Sales − BE sales  
- MoS % = MoS $ ÷ Actual Sales

## Notes
If CM/unit ≤ 0, the app will show an error (Price must exceed variable cost).
