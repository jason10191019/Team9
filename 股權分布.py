import requests
from io import StringIO
import pandas as pd
import numpy as np
import time
import json
import datetime
import openpyxl
import xlsxwriter



list=pd.read_excel("上市公司列表.xlsx",usecols="A")
list['代號']=list['代號'].fillna('null')
list=list[~list['代號'].isin(['null'])]

table=pd.read_excel("股權分布.xlsx",usecols="A:F")
table.columns=[['更新日期','代號','持股分級','人數','股數','佔集保庫存比例']]

print(table.head(5))
table['代號']=[table['代號'].replace(" ","")]
table['代號']=[table['代號'].replace("代號","")]
list['代號']=list['代號'].astype('object')
print(table.loc[0,'代號'])
print(list.loc[0,'代號'])
print(table.loc[0,'代號'].isin([list['代號'].astype('object')]))
print([list['代號']])
print(table['代號'])
table['代號']=table[~table['代號'].isin(list['代號'])]
print(table)
#table.to_csv("股權分布new.csv")