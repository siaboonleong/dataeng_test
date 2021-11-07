import pandas as pd

df=pd.read_csv('C:/data/dataset1.csv')
df1=pd.read_csv('C:/data/dataset2.csv')
result = pd.concat([df,df1])
result[['first_Name','last_Name']] = result.name.str.split(" ", 1, expand=True)
result['price'] = result['price'].astype(str)
result['price'] = result['price'].str.lstrip('0')
result.dropna(subset=['name'], inplace=True)
result['price'] = result['price'].astype(float)
result['above_100'] = result['price']>100
result.to_csv("C:/data//output.csv", index=False)

