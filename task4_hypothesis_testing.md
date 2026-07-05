# Hypothesis Testing Report: Electronics Gateway Performance Analysis

**Date:** July 2026

**Subject:** Statistical Validation of the Electronics Category as an Acquisition Gateway

**Data Source:** Audited Sales Ledger ($N = 1000$)


---


## Executive Summary

This report evaluates the strategic validity of utilizing the **Electronics** product category as the primary customer acquisition channel ("Gateway Category"). 

We conduct a formal two-sample hypothesis test on proportion differences to determine if customers acquired through Electronics exhibit a statistically significant higher **Repeat Purchase Rate (RPR)** compared to all other product categories combined.


---


## 1. Hypothesis Formulation

Let $p_1$ represent the true population repeat purchase rate for customers acquired through the **Electronics** category.

Let $p_2$ represent the true population repeat purchase rate for customers acquired through **all other** categories (Education, Furniture, Fashion, Grocery).


We establish the null and alternative hypotheses at a significance level of $\alpha = 0.05$:

* **Null Hypothesis ($H_0$):** There is no difference in the repeat purchase rates between the two groups. Any observed difference is due to random sampling variance.

  $$H_0: p_1 - p_2 = 0$$

* **Alternative Hypothesis ($H_1$):** Customers initiated via the Electronics category show a statistically superior repeat purchase rate compared to other categories.

  $$H_1: p_1 - p_2 > 0$$


*Note: This is structured as a one-tailed, two-sample Z-test for independent proportions.*


---


## 2. Sample Data and Summary Statistics

From the audited database of 1,000 transaction records, we extract the following metrics:


### Group 1: Electronics First-Touch

* Sample Size ($n_1$): $354$

* Repeat Buyers ($x_1$): $104$

* Sample Proportion ($\hat{p}_1$):

  $$\hat{p}_1 = \frac{104}{354} \approx 0.2938 \quad (29.38\%)$$


### Group 2: Non-Electronics (Others) First-Touch

* Sample Size ($n_2$): $646$

* Repeat Buyers ($x_2$): $145$

* Sample Proportion ($\hat{p}_2$):

  $$\hat{p}_2 = \frac{145}{646} \approx 0.2245 \quad (22.45\%)$$


---


## 3. Mathematical Calculations


### Step 3.1: Pooled Proportion ($\hat{p}$)

Under the assumption of $H_0$ that $p_1 = p_2$, the pooled proportion estimate is calculated as:

$$\hat{p} = \frac{x_1 + x_2}{n_1 + n_2} = \frac{104 + 145}{354 + 646} = \frac{249}{1000} = 0.249$$

$$\hat{q} = 1 - \hat{p} = 1 - 0.249 = 0.751$$


### Step 3.2: Standard Error ($SE$)

The standard error of the difference between the two proportions is:

$$SE = \sqrt{\hat{p} \hat{q} \left( \frac{1}{n_1} + \frac{1}{n_2} \right)}$$

Substituting our values:

$$SE = \sqrt{0.249 \times 0.751 \left( \frac{1}{354} + \frac{1}{646} \right)}$$

$$SE = \sqrt{0.1870 \times \left( 0.002825 + 0.001548 \right)}$$

$$SE = \sqrt{0.1870 \times 0.004373} = \sqrt{0.000818} \approx 0.0286$$


### Step 3.3: Z-Score Test Statistic

The Z-score measures the deviation of the observed difference from the null hypothesis in units of standard error:

$$Z = \frac{(\hat{p}_1 - \hat{p}_2) - 0}{SE}$$

$$Z = \frac{0.2938 - 0.2245}{0.0286} = \frac{0.0693}{0.0286} \approx 2.423$$


### Step 3.4: Probability ($p$-value) and Confidence Interval

* **$p$-value:** For a one-tailed test with $Z = 2.423$:

  $$P(Z \ge 2.423) \approx 0.0077$$

* **$95\%$ Confidence Interval ($CI$) for the Difference ($p_1 - p_2$):**

  $$CI = (\hat{p}_1 - \hat{p}_2) \pm Z_{\alpha/2} \times \sqrt{\frac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \frac{\hat{p}_2(1-\hat{p}_2)}{n_2}}$$

  Where $Z_{\alpha/2} = 1.96$:

  $$CI \approx 0.0693 \pm 1.96 \times (0.0289) \implies [0.0127, 0.1259]$$


---


## 4. Business Conclusions & Strategic Recommendations

* **Statistical Verdict:** The calculated $p$-value ($0.0077$) is strictly less than the significance threshold ($\alpha = 0.05$). The test statistic ($Z = 2.423$) exceeds the critical value of $1.645$. Therefore, we **reject the Null Hypothesis ($H_0$)** in favor of the Alternative Hypothesis ($H_1$).

* **Core Finding:** Customers acquired via Electronics exhibit a statistically superior repeat purchase rate compared to other entry points. The true increase in retention rate is estimated with $95\%$ confidence to fall between $1.27\%$ and $12.59\%$.

* **Strategic Playbook Recommendation:** Leadership should prioritize customer acquisition budgets toward the Electronics category. Additionally, cross-selling and bundling campaigns for high-margin, low-retention items (e.g., Fashion, Grocery) should be programmatically introduced post-checkout to capture immediate margins from this high-retention cohort.


---


## Appendix: Replication Code

```python
import numpy as np
import scipy.stats as stats
from statsmodels.stats.proportion import proportions_ztest

# Sample dimensions and positive responses
x_elec, n_elec = 104, 354
x_oth, n_oth = 145, 646

counts = np.array([x_elec, x_oth])
nobs = np.array([n_elec, n_oth])

# Proportions Z-Test (One-Tailed)
z_stat, p_val = proportions_ztest(counts, nobs, alternative='larger')

# 95% Confidence Interval Calculation
p1 = x_elec / n_elec
p2 = x_oth / n_oth
diff = p1 - p2
se_ci = np.sqrt((p1 * (1 - p1) / n_elec) + (p2 * (1 - p2) / n_oth))
moe = 1.96 * se_ci
ci_lower = diff - moe
ci_upper = diff + moe

print("=== APEXPLANET HYPOTHESIS TESTING REPORT ===")
print(f"Electronics RPR: {p1*100:.2f}%")
print(f"Other Categories RPR: {p2*100:.2f}%")
print(f"Difference: {diff*100:.2f}%")
print(f"Z-Statistic: {z_stat:.4f}")
print(f"P-Value (One-Tailed): {p_val:.4f}")
print(f"95% CI: [{ci_lower:.4f}, {ci_upper:.4f}]")
