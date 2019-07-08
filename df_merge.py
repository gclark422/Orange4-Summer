# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_sas('D:\Data\Summer_Data\loan_info.sas7bdat', encoding="utf-8")
df2 = pd.read_sas('D:\Data\extra_info_m\extra_info_m.sas7bdat')
df2_2 = pd.read_sas('D:\Data\extra_info_m\extra_info_m.sas7bdat', encoding = 'utf-8')
df.copy = df
df2.copy = df2
df.head(6)
df2.head(6)

'''
install = df['installment'].values
plt.plot(install)
plt.show()
plt.savefig('loan.jpg')
'''

df2['url'][0]

df2['new_url'] = df2['url'].str.decode('utf-8')
df2['new_url'][0]
df2['new_id'] = df2['new_url'].str.split('=').str[1]
df2['new_id'][0]
df2['id_number'] = df2['new_id'].astype(float)
df.copy['id_number'] = df.copy['id'].astype(float)


df3 = pd.merge(df, df2, how='inner', on= ['id_number','id_number'])
df3.head(10)

df3.to_csv(r'C:\Users\ysun49\Documents\Summer_Practicum\df_merge.csv')