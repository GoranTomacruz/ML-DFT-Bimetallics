
# importing package 
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

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)
  
# create data 
x = np.arange(3)
y1 = [0.356, 0.178, 0.351] #RFR a
y2 = [0.552950687, 0.168957154, 0.584478577] #RFR b
y3 = [0.492320129, 0.1956346, 0.338722716] #RFR c
y4 = [0.361, 0.179, 0.375] #GPR a
y5=  [0.363783347, 0.156022635, 0.35004042] #GPR b
y6 = [0.435, 0.221, 0.429] #ANN a
y7 = [0.45755861, 0.186742118, 0.421180275] #ANN b
y8 = [0.429264349, 0.176232821, 0.357316087] #ANN c
width = 0.1
  
# plot data in grouped manner of bar type 
plt.bar(x-0.4, y1, width, color='#ed0d47', edgecolor='black') 
plt.bar(x-0.3, y2, width, color='#f2557e', edgecolor='black') 
plt.bar(x-0.2, y3, width, color='#f79eb5', edgecolor='black') 
plt.bar(x-0.1, y4, width, color='#032c7a', edgecolor='black') 
plt.bar(x, y5, width, color='#4e6ba1', edgecolor='black') 
plt.bar(x+0.1, y6, width, color='#047354', edgecolor='black') 
plt.bar(x+0.2, y7, width, color='#4f9d87', edgecolor='black') 
plt.bar(x+0.3, y8, width, color='#9ac7ba', edgecolor='black') 

plt.xticks(x, ['C', 'H', 'O']) 
plt.xlabel("Adsorbates") 
plt.ylabel("RMSE [ev]") 
plt.legend(["RFR [a]", "RFR [b]", "RFR [c]", "GPR [a]", "GPR [b]", "ANN [a]", "ANN [b]", "ANN [c]"], bbox_to_anchor=(1.04, 1), loc="upper left") 
plt.savefig('supp7.png', format="png", bbox_inches='tight', dpi=1000)

plt.show() 
