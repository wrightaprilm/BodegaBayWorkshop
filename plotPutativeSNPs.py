import pandas as pd
import matplotlib.pyplot as plt


plt.style.use('ggplot')
data = pd.read_csv('putativeSNPs', header=None)
myplot = data.plot(kind='bar', legend=False, figsize=(24,6))
plt.savefig('putativeSNPcounts.png', bbox_inches='tight', dpi=300)
