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
fig_arr = pd.read_csv('Figure3.csv', skiprows=1).values

#legend = fig_arr[0,:]
#fig_arr = fig_arr[1,:]
print(fig_arr)

fig_arr_3d = fig_arr[:,:2]
fig_arr_4d = fig_arr[:,2:4]
fig_arr_5d = fig_arr[:,4:]

#print(fig_arr_3d)
#print(fig_arr_4d)
#print(fig_arr_5d)

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)

x = 0
while x <= len(fig_arr_3d[:,1]) - 1:
    print(fig_arr_3d)
    print(x)
    if math.isnan(fig_arr_3d[x,1]):
        fig_arr_3d = np.delete(fig_arr_3d, x, 0)
    else:
        x = x + 1

while x <= len(fig_arr_4d[:,1]) - 1:
    print(fig_arr_4d)
    print(x)
    if math.isnan(fig_arr_4d[x,1]):
        fig_arr_4d = np.delete(fig_arr_4d, x, 0)
    else:
        x = x + 1

while x <= len(fig_arr_5d[:,1]) - 1:
    print(fig_arr_5d)
    print(x)
    if math.isnan(fig_arr_5d[x,1]):
        fig_arr_5d = np.delete(fig_arr_5d, x, 0)
    else:
        x = x + 1


# plot data
plt.plot(fig_arr_3d[:, 0], fig_arr_3d[:, 1], color='#ed0d47', marker='o', mfc='#ed0d47', mec='#ed0d47', mew=1.5, label='3d')
plt.plot(fig_arr_4d[:, 0], fig_arr_4d[:, 1], color='#032c7a', marker='^', mfc='#032c7a', mec='#032c7a', mew=1.5, label='4d')
plt.plot(fig_arr_5d[:, 0], fig_arr_5d[:, 1], color='#047354', marker='s', mfc='#047354', mec='#047354', mew=1.5, label='5d')

# plot style
plt.xlabel('Valence Electrons')
plt.xlim(2, 13)
plt.xticks(np.arange(2, 14, 1))
plt.ylabel('Sublimation Energy [kJ/mol]')
plt.ylim(0, 1000)
plt.yticks(np.arange(0, 1001, 100))

# minor ticks
plt.minorticks_on()
ax = plt.gca()
ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
ax.yaxis.set_minor_locator(ticker.MultipleLocator(100))

#legend
ax.legend(frameon=False)

# output plot
plt.savefig('figure3.png', bbox_inches='tight', dpi=1000)

plt.show()

