import csv
from datetime import datetime
import pandas as pd
#抓取資料
import urllib.request as req
f = pd.read_excel( "上市公司列表.xlsx" )
with open('index.csv' , 'w' , newline='' ) as csv_file:
    for i in range(0,953):
        #print( f.loc[i,'代號'] )
        url = "https://concords.moneydj.com/z/zc/zcl/zcl_" + str( f.loc[i,'代號'] ) + ".djhtm"
        ##建立request物件，附加request headers的資訊
        request = req.Request( url , headers = {
            "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36"
        })
        with req.urlopen( url ) as response:
            data=response.read().decode( "utf-8" , errors= 'ignore' )
        #解析原始碼
        import bs4
        root = bs4.BeautifulSoup( data , "html.parser")

        title1=root.find_all( "td" , class_="t3n0")
        title2=root.find_all( "td" , attrs = { "class" : ["t3n1","t3r1"] } )

        writer = csv.writer(csv_file)
        if i==0:
            writer.writerow( [ "代號" , "名稱" , "日期" , "外資" , "投信" , "自營商","更新時間" ] )
        for j in range(1,6):
            writer.writerow( [ str(f.loc[i,'代號']) , f.loc[i,'名稱'] , title1[j].text , title2[0+(j-1)*10].text , title2[1+(j-1)*10].text , title2[2+(j-1)*10].text ,datetime.today() ] )


        title1.clear()
        title2.clear()



