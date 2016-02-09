import pandas as pd
import matplotlib.pyplot as plt

plt.style.use('ggplot')

data = pd.read_csv('counts', header=None)
data.columns = ['Name','Counts']
print(data.loc[:,'Name'])
plt = data.plot(kind='bar', legend=False, figsize=(24,6))

plt.savefig('readCounts.png', bbox_inches='tight', dpi=300)
