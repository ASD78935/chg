from typing import FrozenSet
import matplotlib.pyplot as plt

years = [1950, 1960, 1970, 1980, 1990, 2000, 2010]
gdp   = [67, 80, 257, 1686, 6596, 11865, 22105]
increase = [50, 35, 860, 1200, 5300, 3500, 11000]

plt.figure(figsize=(4,3))
plt.plot(years, gdp, color='r', linestyle='--',marker='^')
plt.plot(years, increase, 'g-o',label="lncrease Value")


plt.title("GDP per Years")
plt.xlabel("Years")
plt.xlabel("GDP")
plt.xticks(fontsize=7,rotation=45)
plt.yticks(fontsize=7)
plt.grid(True)
plt.legend(fontsize=7, loc='upper center')
plt.savefig('gdp.jpg', dpi=1000)
plt.show()