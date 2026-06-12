import pandas as pd
import numpy as np 

# Load the raw Excel dataset
file_name = "ApexPlanet_DataAnalytics_Dataset.xlsx" 
df = pd.read_excel(file_name)

# Data Cleaning & Transformation
df.drop_duplicates(inplace=True)

# 1. Standardize text dimensions
text_columns = ['Gender', 'City', 'Product', 'Category']
for col in text_columns:
  if col in df.columns:
    df[col] = df[col].astype(str).str.strip().str.title()

# 2. Handle missing data fields safely
df['Age'] = df['Age'].fillna(df['Age'].median())
df['City'] = df['City'].fillna('Unknown')
df['Order_Date'] = pd.to_datetime(df['Order_Date'], errors='coerce')

# 3. Feature Engineering
def build_age_groups(age):
    if age < 25: return 'Youth (<25)'
    elif age <= 40: return 'Young Adult (25-40)'
    elif age <= 60: return 'Middle Aged (41-60)'
    else: return 'Senior (61+)'

df['Age_Group'] = df['Age'].apply(build_age_groups)

# 4. Export final file
df.to_csv("clean_sales.csv", index=False)
