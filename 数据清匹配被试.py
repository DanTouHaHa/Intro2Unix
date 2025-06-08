import pandas as pd
import numpy as np
#依据被试较少的数据进行被试匹配。
df1 = pd.read_excel(r'C:\Users\侯文捷\Desktop\LZL\Number.xlsx')
df1
print(df1)

#allparticipants
df2 = pd.read_excel(r'C:\Users\侯文捷\Desktop\LZL\allparticipants_20ROI_FA.xlsx')
df2
print(df2)

#根据df1的MRINumber匹配被试
import numpy as np
people_list = np.array(df1['MRINumber']).tolist()
print(people_list)

df2['包含'] = df2['MRINumber'].astype(str).apply(lambda x: 1 if any(s in x for s in people_list) else 0)
print(df2)

#删除’包含‘等于0的行
df2 = df2.drop(df2[df2['包含'] == 0].index)
print(df2)

df2.to_excel('allparticipants_20ROI_FA_匹配完被试.xlsx', index=False)



