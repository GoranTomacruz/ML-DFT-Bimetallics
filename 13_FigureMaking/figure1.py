import os

import math
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.gridspec as grid_spec


#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

# read data file
fig_arr = pd.read_csv('figure1.csv', skiprows=1).values

#legend = fig_arr[0,:]
#fig_arr = fig_arr[1,:]
#print(fig_arr)

#making a dictionary of arrays
array_names=['Sc','Ti','V','Cr','Co','Cu','Zn']
array_list={}
for q in range(len(array_names)):
    print(q)
    array_key = 'fig_arr_'+array_names[q]
    array_list[array_key]=fig_arr[:,2*q:(2*q+2)]
    x = 0

    while x <= len(array_list[array_key]) - 1:
        if math.isnan(array_list[array_key][x,1]):
            array_list[array_key] = np.delete(array_list[array_key], x, 0)
        else:
            x = x + 1
    
# initialize parameters
#plt.figure(figsize=(3.5*4/3, 3.5))

colors = ['#0000ff', '#3300cc', '#660099', '#990066', '#cc0033', '#ff0000', '#00ff00']

gs = grid_spec.GridSpec(len(array_names),1)
fig = plt.figure(figsize=(16,9))

#plt.figure()
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)

q = 0

ax_objs = []
for q in range(len(array_names)):
    array_key = 'fig_arr_'+array_names[q]

    # creating new axes object
    print(gs[len(array_names)-q-1:len(array_names)-q, 0:])
    ax_objs.append(fig.add_subplot(gs[len(array_names)-q-1:len(array_names)-q, 0:]))

    # setting uniform x and y lims -> OKAY
    ax_objs[-1].set_xlim(-10,10)
    if len(array_names)-q-1 == 0:
        ax_objs[-1].set_ylim(0,150)
    elif len(array_names)-q-1 == 1:
        ax_objs[-1].set_ylim(0,80)
    elif len(array_names)-q-1 == 2:
        ax_objs[-1].set_ylim(-50,50) #true overlapping, should include negatives
    else:
        ax_objs[-1].set_ylim(0,50)
                            
    # plotting the distribution
    ax_objs[-1].plot(array_list[array_key][:,0], array_list[array_key][:,1],color=colors[q],lw=1)

    # filling the space beneath the distribution
    ax_objs[-1].fill_between(array_list[array_key][:,0], array_list[array_key][:,1],color=colors[q])


    # remove borders, axis ticks, and labels
    ax_objs[-1].set_yticklabels([])

    spines = ["bottom"]
    for s in spines:
        ax_objs[-1].spines[s].set_visible(False)

    #if q == len(array_names)-1:
    if q == 0:
        ax_objs[-1].set_xlabel("E-E$\mathregular{_{F}}$ (eV)", fontsize=16,fontweight="bold")  
    elif q == math.ceil(len(array_names)/3):
        ax_objs[-1].set_ylabel("Density of States (arbitrary units)", fontsize=16,fontweight="bold")
        ax_objs[-1].set_xticklabels([])
    else:
        ax_objs[-1].set_xticklabels([])

    # make background transparent -> OKAY
    rect = ax_objs[-1].patch
    rect.set_alpha(0)

    #spines = ["top","right","left","bottom"]
    #for s in spines:
    #    ax_objs[-1].spines[s].set_visible(False)

    adj_name = array_names[q].replace(" ","\n")

    if len(array_names)-q-1 == 0:
        #ax_objs[-1].text(9.5,150/20,adj_name,fontweight="bold",fontsize=14,ha="right")
        ax_objs[-1].text(9.5,50/20,adj_name,fontweight="bold",fontsize=14,ha="right")
    elif len(array_names)-q-1 == 1:
        #ax_objs[-1].text(9.5,80/20,adj_name,fontweight="bold",fontsize=14,ha="right")
        ax_objs[-1].text(9.5,50/20,adj_name,fontweight="bold",fontsize=14,ha="right")
    elif len(array_names)-q-1 == 2:
        ax_objs[-1].text(9.5,50/20,adj_name,fontweight="bold",fontsize=14,ha="right")
    else:
        ax_objs[-1].text(9.5,50/20,adj_name,fontweight="bold",fontsize=14,ha="right")
    

gs.update(hspace=-0.005)

plt.tight_layout()
plt.show()
