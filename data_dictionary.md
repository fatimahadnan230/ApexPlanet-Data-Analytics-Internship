# Data Dictionary - ApexPlanet Sales Dataset

| Column Name | Data Type | Description | Business Relevance | Example Value |
| :--- | :--- | :--- | :--- | :--- |
| `Order_ID` | String | Unique tracking number for each transaction | Prevents double-counting sales records | `ORD100002` |
| `Order_Date` | Date | The date when the order was placed | Tracks seasonal spikes, monthly growth, and trends | `2025-02-25` |
| `Customer_ID` | String | Unique identifier assigned to each customer | Tracks purchasing frequency and retention rates | `CUST5529` |
| `Customer_Name` | String | Full name of the customer | Useful for customer-specific support or CRM tagging | `Customer_227` |
| `Age` | Integer | Age of the customer | Vital demographic feature for targeting specific age buckets | `30` |
| `Gender` | String | Gender identity of the buyer | Used for gender-based marketing and product curation | `Female` |
| `City` | String | Location city where the order originated | Helps identify geographic market performance | `Bengaluru` |
| `Product` | String | Specific item purchased | Tracks inventory movement and top-selling products | `Rice` |
| `Category` | String | Broader classification of the product | High-level tracking of department performance | `Grocery` |
| `Quantity` | Integer | Total units bought in the order | Necessary to calculate volume metrics and wholesale demand | `7` |
| `Unit_Price` | Float | Price per single unit of the product | Tracks pricing consistency and margin analytics | `2829.77` |
| `Total_Sales` | Float | Final monetary value of the order (`Quantity * Unit_Price`) | Key financial metric calculating total gross revenue | `19808.39` |
