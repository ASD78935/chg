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
df.to_excel('name.xlsx', index=False)
 