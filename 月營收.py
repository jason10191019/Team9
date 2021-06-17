import requests
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup
import datetime

def money_ticket():

    def get_money_ticket5d(target):
        URL_5d="https://concords.moneydj.com/z/zc/zch/zch_"+target+".djhtm"
   
        response=requests.get(URL_5d)
        soup=BeautifulSoup(response.text,"html.parser")
        #print(soup.prettify())
        text=soup.findAll("td",class_=["t3n1","t3r1"])
        date=soup.findAll("td",class_="t3n0")
        day=[]
        Earn=[]
        MoM=[]
        LastYear=[]
        YoY=[]
        AllYear=[]
        AllYoY=[]
        for i in range(len(text)):
            if(i%6==0):
               Earn.append(text[i].text)
            if(i%6==1):
                MoM.append(text[i].text)
            if(i%6==2):
                LastYear.append(text[i].text)
            if(i%6==3):
                YoY.append(text[i].text)
            if(i%6==4):
                AllYear.append(text[i].text)
            if(i%6==5):
                AllYoY.append(text[i].text)
        for i in range(len(date)):
            date[i]=date[i].text
        del date[0]
        del date[0]
        df={'date':date,'target':target,'Earn':Earn,' MoM':MoM,' LastYear': LastYear,'YoY':YoY,'AllYear':AllYear,' AllYoY': AllYoY}
        #return df
        return pd.DataFrame(data=df)
   
    list=pd.read_excel("上市公司列表.xlsx",usecols="A")
    list['代號']=list['代號'].fillna('null')
    list=list[~list['代號'].isin(['null'])]
    table=get_money_ticket5d(str(list.loc[0,'代號']))
    #print(table)
    
    for i in range(1,len(list)):
        target=str(list.loc[i,'代號'])
        print(target)
        
        table=table.append(get_money_ticket5d(str(list.loc[i,'代號'])))
        print(table)
    table.to_excel("融資融券.xlsx",index=False)
    
money_ticket()



