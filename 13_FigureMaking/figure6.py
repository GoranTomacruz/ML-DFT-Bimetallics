import os

import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker
import scipy.stats as stats

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

# read data file
fig_arr = pd.read_csv('Figure6.csv', skiprows=2).values

#legend = fig_arr[0,:]
#fig_arr = fig_arr[1,:]
print(fig_arr)

fig_arr_mono = fig_arr[:,:2]
fig_arr_Cu = fig_arr[:,2:4]
fig_arr_Pt = fig_arr[:,4:]

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)

x = 0
while x <= len(fig_arr_mono[:,1]) - 1:
    print(fig_arr_mono)
    print(x)
    if math.isnan(fig_arr_mono[x,1]):
        fig_arr_mono = np.delete(fig_arr_mono, x, 0)
    else:
        x = x + 1

while x <= len(fig_arr_Cu[:,1]) - 1:
    print(fig_arr_Cu)
    print(x)
    if math.isnan(fig_arr_Cu[x,1]):
        fig_arr_Cu = np.delete(fig_arr_Cu, x, 0)
    else:
        x = x + 1

while x <= len(fig_arr_Pt[:,1]) - 1:
    print(fig_arr_Pt)
    print(x)
    if math.isnan(fig_arr_Pt[x,1]):
        fig_arr_Pt = np.delete(fig_arr_Pt, x, 0)
    else:
        x = x + 1

a1, b1 = np.polyfit(fig_arr_mono[:, 0], fig_arr_mono[:, 1], 1)
a2, b2 = np.polyfit(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1], 1)
a3, b3 = np.polyfit(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1], 1)

slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_mono[:, 0], fig_arr_mono[:, 1])
r2_1 = r_value**2
slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1])
r2_2 = r_value**2
slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1])
r2_3 = r_value**2

# plot data
plt.plot(fig_arr_mono[:, 0], fig_arr_mono[:, 1], color='#ed0d47', marker='o', mfc='#ed0d47', mec='#ed0d47', mew=1.5, linewidth=0, label='Monometallic TMs')
plt.plot(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1], color='#032c7a', marker='^', mfc='#032c7a', mec='#032c7a', mew=1.5, linewidth=0, label='Cu alloys')
plt.plot(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1], color='#047354', marker='s', mfc='#047354', mec='#047354', mew=1.5, linewidth=0, label='Pt alloys')

# plot best fit lines
plt.plot(fig_arr_mono[:, 0], a1*fig_arr_mono[:, 0]+b1, color='#ed0d47') 
plt.plot(fig_arr_Cu[:, 0], a2*fig_arr_Cu[:, 0]+b2, color='#032c7a') 
plt.plot(fig_arr_Pt[:, 0], a3*fig_arr_Pt[:, 0]+b3, color='#047354') 

# plot equation texts
plt.text(6.7, 4.5, 'y = ' + '{:.4f}'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color='#ed0d47')
plt.text(8, 0.5, 'y = ' + '{:.4f}'.format(a2) + 'x' + ' + {:.4f}'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color='#032c7a')
plt.text(3, 3, 'y = ' +  '{:.4f}'.format(a3) + 'x' + ' + {:.4f}'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color='#047354')




# plot style
plt.xlabel('Valence Electrons')
plt.xlim(2, 13)
plt.xticks(np.arange(2, 14, 1))
plt.ylabel('Adsorption Energy [kJ/mol]')
plt.ylim(0, 6)
plt.yticks(np.arange(0, 7, 1))

# minor ticks
plt.minorticks_on()
ax = plt.gca()
ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.5))

#legend
ax.legend(frameon=False)

plt.savefig('figure6.png', bbox_inches='tight', dpi=1000)

# output plot
plt.show()