import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# VS code 상에서 그래프 상에 한글을 표기하기 위한 폰트 설정 방법
plt.rc('font', family='Malgun Gothic')

df = pd.read_csv('apt_national.csv', encoding='euc-kr')

# print(df.shape)
# print(df.info())
# print(df.head(10))


seoul_df = df[df['지역명'] == '서울']
seoul_df_2024_60_under_df = seoul_df[seoul_df['연도'] == 2024 & 
                             (seoul_df['규모구분']=='전용면적 60제곱미터 이하')]

seoul_df_2024_60_under_df.reset_index(inplace=True ,drop=True)
seoul_df_2024_60_under_df['분양가격']= pd.to_numeric(seoul_df_2024_60_under_df['분양가격(제곱미터)'])

print(seoul_df_2024_60_under_df.head(12))

# title ('2024년도 서울지역 월별 아파트 분양 가격 동향(60제곱미터 이하))