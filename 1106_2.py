import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('countries.csv')

df['density'] = df['population'] / df['area']

df_density = df.sort_values('density', ascending=False)

df_density.plot(kind='bar',
                x='country',
                y='density',
                title='density of countries')
plt.show()

