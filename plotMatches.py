import pandas as pd
import matplotlib.pyplot as plt

plt.style.use('ggplot')

data = pd.read_csv('matchInfo')
myplot = data.plot(kind='bar', legend=False, figsize=(24,6))
plt.savefig('SNPmatches.png', bbox_inches='tight', dpi=300)
