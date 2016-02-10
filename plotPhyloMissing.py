import pandas as pd
import matplotlib.pyplot as plt
import sys


name = sys.argv[1]
plt.style.use('ggplot')
data = pd.read_csv(name)
myplot = data.plot(kind='bar', legend=False, figsize=(24,6))
namestring = name + '.png'
plt.savefig(namestring, bbox_inches='tight', dpi=300)
