import pandas as pd
data = pd.read_csv(r'C:\Users\侯文捷\Desktop\LZL\ROI_FA_jhuicbmtracts_bnunew.csv',sep=',',header='infer')
data

subject_ID = data.pop('ID') 
data

subject_ID = subject_ID.str[0:5]
data.insert(0,'subject_ID',subject_ID)
data

data.to_excel('IDnew_ROI_FA_jhuicbmtracts_bnunew.xlsx', index=False) 
