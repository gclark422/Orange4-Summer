# -*- coding: utf-8 -*-
"""
Yao Sun

Merging SAS datasets

"""

import pandas as pd

#read SAS files into pandas dataframes
df = pd.read_sas('D:\Data\Summer_Data\loan_info.sas7bdat')
df2 = pd.read_sas('D:\Data\extra_info_m\extra_info_m.sas7bdat')
#preview first 6 rows of each dataframe
df.head(6)
df2.head(6)

#decode url from byte type to string, store it in 'url'
df2['url'] = df2['url'].str.decode('utf-8')
df2['url'][0]
#split url by '=' and extract the second item, which is id, and store it into df2_id
df2['df2_id'] = df2['url'].str.split('=').str[1]
df2['df2_id'][0]
#covert df2_id and id into float type in order to match with each other
df2['df2_id'] = df2['df2_id'].astype(float)
df['df1_id'] = df['id'].astype(float)
#inner join df and df2, on 'df1_id' and 'df2_id'
df3 = pd.merge(df, df2, how='inner', left_on = 'df1_id', right_on = 'df2_id')
df3.head(10)

#covert other byte type variables into string type
df3['grade'] = df3['grade'].str.decode('utf-8')
df3['sub_grade'] =  df3['sub_grade'].str.decode('utf-8')
df3['term']=df3['term'].str.decode('utf-8')
df3['application_type'] =  df3['application_type'].str.decode('utf-8')
df3['initial_list_status'] = df3['initial_list_status'].str.decode('utf-8')
df3['addr_state'] = df3['addr_state'].str.decode('utf-8')
df3['zip_code'] = df3['zip_code'].str.decode('utf-8')
df3['title'] = df3['title'].str.decode('utf-8')
df3['purpose'] = df3['purpose'].str.decode('utf-8')
df3['desc'] = df3['desc'].str.decode('utf-8')
df3['pymnt_plan'] = df3['pymnt_plan'].str.decode('utf-8')
df3['loan_status']=df3['loan_status'].str.decode('utf-8')
df3['verification_status'] = df3['verification_status'].str.decode('utf-8')
df3['home_ownership']=df3['home_ownership'].str.decode('utf-8')
df3['emp_length']=df3['emp_length'].str.decode('utf-8')
df3['emp_title']=df3['emp_title'].str.decode('utf-8')


#export df3 to a csv file
df3.to_csv(r'C:\Users\ysun49\Documents\Summer_Practicum\df_merge_update.csv')
