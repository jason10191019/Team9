import requests
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup
import datetime

url="https://isin.twse.com.tw/isin/class_main.jsp?owncode=&stockname=&isincode=&market=1&issuetype=1&industry_code=&Page=1&chklike=Y"
response=requests.get(url)
soup=BeautifulSoup(response.text,"html.parser")
text=soup.find_all("td")

number=[]
name=[]
market=[]
type_=[]
today=datetime.date.today()

for i in range (len(text)):
    if(i<10):
        continue
    if(i%10==2):
        number.append(int(text[i].text))
    if(i%10==3):
        name.append(text[i].text)
    if(i%10==4):
        market.append(text[i].text)
    if(i%10==6):
        type_.append(text[i].text)
d={'代號':number,'名稱':name,'市場別':market,'產業類別':type_,'更新日期':today}
table=pd.DataFrame(data=d)
table.to_excel("上市公司列表.xlsx",index=False)
