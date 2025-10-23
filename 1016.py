import pandas as pd

excel_df = pd.read_excel('countries.xlsx')
print(excel_df.isnull().sum())