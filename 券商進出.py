import requests
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup
import datetime



def Get_Inten(target):
    Intensive={}
    url = "https://concords.moneydj.com/z/zc/zco/zco_"+target+"_1.djhtm"
    response=requests.get(url)
    soup=BeautifulSoup(response.text,"html.parser")
    text=soup.findAll("td",class_="t3n1",colspan="4")
    if(len(text)==4):
        Intensive["1b"]=text[0].text
        Intensive["1s"]=text[1].text
    else:
        Intensive["1b"]=np.nan
        Intensive["1s"]=np.nan
     
    url = "https://concords.moneydj.com/z/zc/zco/zco_"+target+"_2.djhtm"
    response=requests.get(url)
    soup=BeautifulSoup(response.text,"html.parser")
    text=soup.findAll("td",class_="t3n1",colspan="4")
    if(len(text)==4):
        Intensive["5b"]=text[0].text
        Intensive["5s"]=text[1].text
    else:
        Intensive["5b"]=np.nan
        Intensive["5s"]=np.nan
   
    url = "https://concords.moneydj.com/z/zc/zco/zco_"+target+"_4.djhtm"
    response=requests.get(url)
    soup=BeautifulSoup(response.text,"html.parser")
    text=soup.findAll("td",class_="t3n1",colspan="4")
    if(len(text)==4):
        Intensive["20b"]=text[0].text
        Intensive["20s"]=text[1].text
    else:
        Intensive["20b"]=np.nan
        Intensive["20s"]=np.nan


    url = "https://concords.moneydj.com/z/zc/zco/zco_"+target+"_6.djhtm"
    response=requests.get(url)
    soup=BeautifulSoup(response.text,"html.parser")
    text=soup.findAll("td",class_="t3n1",colspan="4")
    if(len(text)==4):
        Intensive["60b"]=text[0].text
        Intensive["60s"]=text[1].text
    else:
        Intensive["60b"]=np.nan
        Intensive["60s"]=np.nan 
    #print(text)
    
    url = "https://concords.moneydj.com/z/zc/zco/zco_"+target+"_8.djhtm"
    response=requests.get(url)
    soup=BeautifulSoup(response.text,"html.parser")
    text=soup.findAll("td",class_="t3n1",colspan="4")
    if(len(text)==4):
        Intensive["240b"]=text[0].text
        Intensive["240s"]=text[1].text
    else:
        Intensive["240b"]=np.nan
        Intensive["240s"]=np.nan
    
    return Intensive


table=pd.read_excel("籌碼集中度.xlsx",usecols="A:M")
table.to_excel("籌碼集中度copy.xlsx",index=False)
table['代號']=table['代號'].fillna('null')
table=table[~table['代號'].isin(['null'])]
today=datetime.date.today()


for i in range (len(table)):
    print(table.loc[i,"代號"])
    if(table.loc[i,'更新日期'] != today):
        table.loc[i,'代號']=int(table.loc[i,'代號'])
        table.loc[i,'代號']=str(table.loc[i,'代號'])
        Inten=Get_Inten(table.loc[i,'代號'])
        table.loc[i,"1日買進"]=Inten["1b"];
        table.loc[i,"1日賣出"]=Inten["1s"];
        table.loc[i,"5日買進"]=Inten["5b"];
        table.loc[i,"5日賣出"]=Inten["5s"];
        table.loc[i,"20日買進"]=Inten["20b"];
        table.loc[i,"20日賣出"]=Inten["20s"];
        table.loc[i,"60日買進"]=Inten["60b"];
        table.loc[i,"60日賣出"]=Inten["60s"];
        table.loc[i,"240日買進"]=Inten["240b"];
        table.loc[i,"240日賣出"]=Inten["240s"];
    table.loc[i,"更新日期"]=today;
    if(i%100==0):
        table.to_excel("籌碼集中度.xlsx",index=False)
table.to_excel("籌碼集中度.xlsx",index=False)



