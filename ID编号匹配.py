import pandas as pd
import numpy as np
#依据diff_emotion_reg_p01进行被试筛选（父母报告的情绪调节，DESR，只有第四个时间点的数据）
#去除空值后剩余6147个被试
df1 = pd.read_excel(r'E:\Fudan_Luoqiang_ADHD_Project\20220923_ABCD数据库信息\数据分析\数据分析\abcd_cbcls01.xlsx')
df1
print(df1)

df1_b = df1.iloc[0:6147]
print(df1_b)
import numpy as np
people_list = np.array(df1_b['SubjectID']).tolist()
print(people_list)
df1_1 = df1.iloc[6147:12158]
print(df1_1)
df1_2 = df1.iloc[12158:18211]
print(df1_2)

df1_1['ID2'] = df1_b['SubjectID'].astype(str).apply(lambda x: df1_b['ID'] if any(s in x for s in people_list) else 0)
print(df1_1)

df1_2['ID2'] = df1_b['SubjectID'].astype(str).apply(lambda x: df1_b['ID']  if any(s in x for s in people_list) else 0)
print(df1_2)
