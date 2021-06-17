import requests
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup
import datetime

def money_ticket():

    def get_money_ticket5d(target,date1,date2):
        URL_5d="https://concords.moneydj.com/z/zc/zcn/zcn.djhtm?a="+target+"&c="+date1+"&d="+date2
   
        response=requests.get(URL_5d)
        soup=BeautifulSoup(response.text,"html.parser")
        #print(soup.prettify())
        text=soup.findAll("td",class_="t3n1")
        date=soup.findAll("td",class_="t3n0")
        day=[]
        ticket=[]
        
        money=[]
        money_usage=[]
        for i in range(len(text)):
            if(i%14==4):
                money.append(text[i].text)
            if(i%14==6):
                money_usage.append(text[i].text)
            if(i%14==11):
                ticket.append(text[i].text)
        for i in range(len(date)):
            date[i]=date[i].text
        del date[0]
        df={'date':date,'target':target,'money':money,'money_usage':money_usage,'ticket':ticket}
        #return df
        return pd.DataFrame(data=df)
    '''
    table=pd.read_excel("融資融券.xlsx",usecols="A:G")
   
    table['代號']=table['代號'].fillna('null')
    table=table[~table['代號'].isin(['null'])]
    
    print(table['代號'])
    today=datetime.date.today()

    for i in range(len(table)):
    
        if(not table.iloc[i]['更新日期']==today):
            table.loc[i,'代號']=int(table.loc[i,'代號'])
             
            print(table.iloc[i]['代號'])
            back=get_money_ticket5d(str(table.iloc[i]['代號']))
            back1=get_money_ticket20d(str(table.iloc[i]['代號']))
            table.loc[i,'5日融資']=back[0]
            table.loc[i,'5日融券']=back[1]
            table.loc[i,'20日融資']=back1[0]
            table.loc[i,'20日融券']=back1[1]
            table.loc[i,'更新日期']=today
        if(i%100==0):    
            table.to_excel("融資融券.xlsx",index=False)
        table.loc[i,'更新日期']=today
    table.to_excel("融資融券.xlsx",index=False)
    '''
    list=pd.read_excel("上市公司列表.xlsx",usecols="A")
    list['代號']=list['代號'].fillna('null')
    list=list[~list['代號'].isin(['null'])]
    table=get_money_ticket5d(str(list.loc[0,'代號']),"2021-3-3","2021-6-4")
    for i in range(1,len(list)):
        target=str(list.loc[i,'代號'])
        print(target)
        
        table=table.append(get_money_ticket5d(str(list.loc[i,'代號']),"2021-3-3","2021-6-4"))
        print(table)
    table.to_excel("融資融券.xlsx",index=False)
    
money_ticket()



