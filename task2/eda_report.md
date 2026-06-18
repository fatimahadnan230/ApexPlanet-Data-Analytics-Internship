# Task 2: Exploratory Data Analysis & Business Intelligence Report

## 1. Descriptive Statistics & Univariate Insights
* **Transaction Distribution:** The dataset comprises 1,000 processed rows across regional retail nodes.
* **Volume Distribution:** Patna leads the company in order volume with **135 orders**, closely followed by Kolkata (**133**) and Mumbai (**131**). 
* **Data Quality Note:** 13 records containing missing geographic entries were successfully isolated and classified under the `Unknown` dimension.

## 2. Business Intelligence via SQL Queries

### Q1: Top 5 Products by Revenue
| Rank | Product | Category | Total Revenue ($) |
| :--- | :--- | :--- | :--- |
| 1 | Laptop | Electronics | $25,443,008.51 |
| 2 | Mobile | Electronics | $25,335,573.19 |
| 3 | Book | Education | $25,031,689.40 |
| 4 | Rice | Grocery | $22,231,711.28 |
| 5 | Chair | Furniture | $21,521,561.48 |

### Q2: Order Volume and Revenue by Regional City Hubs
| City | Total Orders | Total Revenue ($) |
| :--- | :--- | :--- |
| Patna | 135 | $19,285,966.89 |
| Kolkata | 133 | $18,884,349.57 |
| Bengaluru | 122 | $18,773,574.32 |
| Mumbai | 131 | $18,757,050.17 |
| Hyderabad | 125 | $17,166,766.87 |
| Delhi | 125 | $16,097,079.00 |
| Pune | 99 | $14,513,175.90 |
| Gaya | 117 | $14,380,859.39 |
| Unknown | 13 | $1,540,617.54 |

### Q3: Average Order Value (AOV) by Age Group
| Age Group Bracket | Average Order Value (AOV) |
| :--- | :--- |
| Youth (<25) | $144,391.05 |
| Senior (61+) | $144,268.34 |
| Middle Aged (41-60) | $139,202.25 |
| Young Adult (25-40) | $135,945.56 |

### Q4: Product Category Share Split by Gender
* **Female Segment Winner:** Electronics ($22.62M revenue across 915 units sold).
* **Male Segment Winner:** Electronics ($28.15M revenue across 1,063 units sold).
* Education and Grocery trade places as the secondary volume drivers across both gender cohorts.

### Q5: Top 3 High-Value VIP Customers
1. **Customer_254** (`CUST2062`) — Lifetime Value: **$493,677.50**
2. **Customer_200** (`CUST4706`) — Lifetime Value: **$492,174.10**
3. **Customer_36** (`CUST1711`) — Lifetime Value: **$490,866.40**

### Q6: Temporal Chronological Sales Trends
* **Peak Revenue Month:** March 2025 generated **$13,059,899.94**.
* **Steady Operations:** Monthly baseline revenue consistently holds between $9.1M and $12.9M across 2025.
* **Data Boundary Note:** January 2026 data shows a sharp decline ($809,389.99) due to a partial recording window at the end of the collection sequence.

## 3. Multivariate Analytics & Core Correlations
* High-ticket electronic dimensions (Laptops/Mobiles) skew the gross revenue metrics higher compared to volume-heavy grocery lines.
* Average Order Value remains incredibly uniform across age distributions, indicating consistent buying behavior across all consumer age segments.
