
import requests
from io import StringIO
import pandas as pd
import numpy as np
import time
import json
import datetime
import openpyxl
import xlsxwriter

# 網址
def save_file(sheet_name,data):
    writer=pd.ExcelWriter('new_excel.xlsx',mode='a',date_format='YYYY-MM-DD')
    data.to_excel(writer,sheet_name=sheet_name)
    writer.close()

def daterange(d1, d2):
    return (d1 + datetime.timedelta(days=i) for i in range((d2 - d1).days + 1))


def Initialize(target):
    today=datetime.datetime.now()
    half_year_ago=today-datetime.timedelta(days=365)

    period1=datetime.datetime.timestamp(today)
    period2=datetime.datetime.timestamp(half_year_ago)
    period1=int(period1)
    period2=int(period2)


    site = "https://query1.finance.yahoo.com/v8/finance/chart/"+str(target)+".TW?period1="+str(period2)+"&period2="+str(period1)+"&interval=1d&events=history&=hP2rOschxO0"
    #print(site)
    # 利用 requests 來跟遠端 server 索取資料
    response = requests.get(site)
    
    data = json.loads(response.text)
    #print(data)
    #print(data)
    ind=[]
    #print(data)
    if(data['chart']['result']==None):
        return
    for iter in (data['chart']['result'][0]['timestamp']):
        ind.append(datetime.date.fromtimestamp(iter))
    df = pd.DataFrame(data['chart']['result'][0]['indicators']['quote'][0], index=ind)
    
    df['date']=df.index
    df['代號']=target
    df.reset_index(level=0, inplace=True)
    df=df[['代號','date','open','close','low','high','volume']]
    #f=df.round(2)
    #print(df.head(5))
    return df
    
       

def Update(last_Update,list):
    today=datetime.date.today()

    
    
    
    for date in daterange(last_Update.date(),today):
        print(date)

        UPdate=date.strftime("%Y%m%d")


    
        url='https://www.twse.com.tw/exchangeReport/MI_INDEX?response=csv&date=' +UPdate + '&type=ALL'
        print(url)

        r = requests.post(url)

    # 整理資料，變成表格
        df = pd.read_csv(StringIO(r.text.replace("=", "")), 
            header=["證券代號" in l for l in r.text.split("\n")].index(True)-1,index_col=0)

    # 整理一些字串：
        df = df.apply(lambda s: pd.to_numeric(s.astype(str).str.replace(",", "").replace("+", "1").replace("-", "-1"), errors='coerce'))
    
        ind=date.strftime("%Y-%m-%d")

        for i in range(1):
            target=str(list.loc[i,'代號'])
        
            table=pd.read_excel("new_excel.xlsx",usecols="A:F",index_col=0,sheet_name=target)


            table.loc[ind,'low']=df.loc[target,'最低價']
            table.loc[ind,'high']=df.loc[target,'最高價']
            table.loc[ind,'open']=df.loc[target,'開盤價']
            table.loc[ind,'close']=df.loc[target,'收盤價']
            table.loc[ind,'volume']=df.loc[target,'成交股數']

            table.index = pd.to_datetime(table.index).strftime('%Y-%m-%d')
            save_file(str(target),table)
    

        
            
        
    # 顯示出來
    



list=pd.read_excel("上市公司列表.xlsx",usecols="A")
list['代號']=list['代號'].fillna('null')
list=list[~list['代號'].isin(['null'])]



for i in range(0,1):
  
   
    page=int(i/100)+1
    

    '''
    if(i%100==0):
        fn = file_name+'.xlsx'
        wb = openpyxl.Workbook()
        writer=pd.ExcelWriter(fn,engine='xlsxwriter',options={'in_memory': True})
   ''' 
    
    target=list.loc[i,'代號']
    file_name=str(target)+".csv"
    print("Curent target:",target)
    
    if(True ):
        if(i==0):
            df=Initialize(target)
        else:
            df=df.append(Initialize(target))
        print(df)
        #df.to_excel(writer,sheet_name=str(target))
        #
        print("Finish")
    else:
        print("Update")
        
        #Update(target)
        print("Finish")
    #if(i%100==99):
         #writer.close()
    time.sleep(0.5)

#writer.close()
df.to_csv("股價.csv",index=False)


