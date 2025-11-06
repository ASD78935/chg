import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


data = {
    'Class': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
    'Name': ['s1', 's2', 's3', 's4', 's5', 's6', 's7'],
    'Age': [25, 28, 22, 21, 23, 25, 26],
    'Score': np.array([95, 80, 75, 80, 90, 85, 70])
}

df = pd.DataFrame(data)
df.plot(kind='bar', x='Name', y=['Score','Age'],
       title='Kim Hyun Gyu Score and Age of Names',
        color = ['g','r'])
 #  figsize=(8,5),  color = 'g', fontsize=8
plt.show()
# plt.savefig('score.jpg', dpi=1000)