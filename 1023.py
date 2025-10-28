import pandas as pd
import numpy as np
data = {
    'Name': ['kim', 'park', 'lee', 'choi'],
    'kor': [90, 90, 70, 60],
    'eng': [60, 70, 80, 90],
    'math': [70, 80, 90, 60]
}
df = pd.DataFrame(data)
df['Total'] = df['kor'] + df['eng'] + df['math']
df['Average'] = df['Total'] / 3
df.loc[df['Average'] >= 75, 'Result'] = 'Fail'
df.loc[df['Average'] < 75, 'Result'] = 'Pass'
df
