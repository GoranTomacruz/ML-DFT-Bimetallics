import os

import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker
from matplotlib.ticker import StrMethodFormatter

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

# read data file
fig_arr = pd.read_csv('Figure8f_.csv', skiprows=0).values

#legend = fig_arr[0,:]
#fig_arr = fig_arr[1,:]
print(fig_arr)

fig_arr_names = fig_arr[:,0]
fig_arr_mean = fig_arr[:,1]
#fig_arr_stdev = fig_arr[:,2]

print(fig_arr_names)

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)

x = 0

fig_colors = {"DOS": "#700460",
                    "GCN": "#032c7a", 
                    "LC": "#acd96e",
                    "MV": "#a12d5d",
                    "WF": "#a12d5d",
                    "EN": "#ed0d47",
                    "EA": "#ed0d47",
                    "DBF": "#16c285",
                    "DBC": "#ee6a3b",
                    "IE": "#ee6a3b",
                    "VE": "#ee6a3b",
                    "SE": "#fbbf53",
                    "DBW": "#fbbf53",
                    "EAC": "#055359",
                    }

i = 0
final_colors = [None]*len(fig_arr_names)

for x in fig_arr_names:
    final_colors[i] = fig_colors.get(x)
    i = i + 1

print(final_colors)

# plot data
#plt.barh(fig_arr_names,width=fig_arr_mean, xerr=fig_arr_stdev, align='center', color=final_colors, edgecolor='black', linewidth=0.8)

plt.barh(fig_arr_names,width=fig_arr_mean, align='center', color=final_colors, edgecolor='black', linewidth=0.8)
#plt.errorbar(fig_arr_mean,fig_arr_names,xerr=fig_arr_stdev,capsize=3, ecolor='black', linestyle='')

# plot style
#plt.xlabel('Importances (R$^2$ Drop)')
plt.xlabel('Effect on Model Output (eV)')
plt.xlim(0, 1)
#plt.xticks(np.arange(0, 2, 10))
plt.ylabel('Features')

# minor ticks
plt.minorticks_on()
ax = plt.gca()
ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.1))
ax.yaxis.set_minor_locator(ticker.MultipleLocator(1))


#legend
ax.legend(frameon=False)

# output plot
plt.savefig('figure8f_.png', format="png", bbox_inches='tight', dpi=1000)


plt.show()


