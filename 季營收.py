
import requests
import pandas as pd
import numpy as np
import openpyxl
import xlsxwriter

def financial_statement(year, season, type='綜合損益彙總表'):

    if year >= 1000:
        year -= 1911

    if type == '綜合損益彙總表':
        url = 'https://mops.twse.com.tw/mops/web/ajax_t163sb04'
    elif type == '資產負債彙總表':
        url = 'https://mops.twse.com.tw/mops/web/ajax_t163sb05'
    elif type == '營益分析彙總表':
        url = 'https://mops.twse.com.tw/mops/web/ajax_t163sb06'
    else:
        print('type does not match')

    r = requests.post(url, {
        'encodeURIComponent':1,
        'step':1,
        'firstin':1,
        'off':1,
        'TYPEK':'sii',
        'year':str(year),
        'season':str(season),
    })

    r.encoding = 'utf8'
    dfs = pd.read_html(r.text, header=None)
    
    if type == '綜合損益彙總表':
        return pd.concat(dfs[1:], axis=0, sort=False)\
             .set_index(['公司代號'])
    elif type == '資產負債彙總表':
       return pd.concat(dfs[1:], axis=0, sort=False)\
             .set_index(['公司代號'])
    elif type == '營益分析彙總表':
        print(dfs[0][0:])
        dfs=dfs[0]
        dfs.columns=dfs.loc[0,]
        dfs=dfs[1:]
        dfs=dfs[~dfs['公司代號'].isin(['公司代號'])]
        dfs.set_index(['公司代號'])
        return dfs
    else:
        print('type does not match')

             
year=2020
season=4

df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=df

season=3
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=2
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

year=2019
season=4

df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=3
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=2
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

year=2018
season=4

df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=3
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=2
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

year=2017
season=4

df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=3
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=2
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

year=2016
season=4

df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=3
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=2
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

year=2021
season=1
df=financial_statement(year,season,'營益分析彙總表')
df.columns=['公司代號','公司名稱','營業收入','毛利率','營業利益率','稅前純益率','稅後純益率']
df['季度']=str(year)+"-"+str(season)
table=table.append(df)

table.to_excel('營益分析彙總表.xlsx',index=False)




