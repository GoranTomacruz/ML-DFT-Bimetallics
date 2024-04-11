import os

import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

# read data file
fig_arr = pd.read_csv('figure2_o.csv', skiprows=0).values

#legend = fig_arr[0,:]
#fig_arr = fig_arr[1,:]
print(fig_arr)

x = fig_arr[:,0]
y = fig_arr[:,1]

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)


# plot data
plt.plot(x, y, color='black', marker='.', markersize=8, linewidth=0)

# plot style
plt.xlabel('Valence Electrons')
plt.xlim(2, 13)
plt.xticks(np.arange(2, 14, 1))
plt.ylabel('Adsorption Energy [eV]')
plt.ylim(-4,4)
plt.yticks(np.arange(-4, 5, 1))

# minor ticks
plt.minorticks_on()
ax = plt.gca()
ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.5))

#legend
ax.legend(frameon=False)

# output plot
plt.savefig('figure2_o.png', bbox_inches='tight', dpi=1000)

plt.show()


