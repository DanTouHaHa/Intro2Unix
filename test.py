import pandas as pd
data = pd.read_csv('C:\Users\侯文捷\Desktop\LZL\data.csv')
line=data.readlines()
line.reverse()
for i in line:
    i=i.replace('\n','')
    i=i.replace(' ','')
    a=i.split(",")
    a.reverse()
    print(";".join(a))

import pandas as pd
filename = 'data.csv'
df = pd.read_csv(filename)
print(df)

#20221208
#LZL
#CSV格式清洗与转换
#data.CSV文件需要和该代码在同一文件夹下
f=open("data.csv")
line=f.readlines()
line.reverse()
for i in line:
    i=i.replace('\n','')
    i=i.replace(' ','')
    a=i.split(",")
    a.reverse()
    print(";".join(a))