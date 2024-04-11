import numpy as np
import pandas as pd
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter
import matplotlib
import matplotlib.pyplot as plt
from scipy.signal import peak_widths
from scipy.signal import find_peaks
from scipy import stats
from matplotlib.ticker import MultipleLocator  

sym = ''
errors = [] 
d = []
counter = 1

files = ['Bi_C-adsorption energy vs electronic descriptor psi.csv', 'Bi_H-adsorption energy vs electronic descriptor psi.csv', 'Bi_O-adsorption energy vs electronic descriptor psi.csv']
material = 'bimetallic alloys'
atom = ['C', 'H', 'O']
i = 0

matplotlib.rc('font', family='Lato')

#print(matplotlib.matplotlib_fname())

for file in files:
    p = 0
    z = 0
    ads = pd.read_csv(file,delimiter=",")
    cols = list(ads.columns)
    #print(cols)
    cols.remove(' Surface')
    
    col_name = []

    for col in cols:
        col_zscore = col + '_zscore'
        col_name.append(col_zscore)
        ads[col_zscore] = (ads[col] - ads[col].mean()) / ads[col].std(ddof=0)

    THRESHOLD = 2.5

    j = 0 
    
    non_outliers = ads[~((np.abs(ads[col_name[1]]) > THRESHOLD))]
    outliers = ads[((np.abs(ads[col_name[1]]) > THRESHOLD))]

    fig, ax = plt.subplots(figsize=(8,6))
    ax.scatter(non_outliers[cols[0]], non_outliers[cols[1]], color='#440154')
    ax.scatter(outliers[cols[0]], outliers[cols[1]], color='#4AC16D')

    ax.set_ylabel("Adsorption Energy (eV)", fontsize=12)
    ax.set_title("Electronic descriptor \u03C8 vs {}-Adsorption Energy for {}".format(atom[i], material), fontsize=16)
    ax.set_xlabel("Electronic descriptor \u03C8", fontsize=12)
    
    
    for tick in ax.get_xticklabels():
        tick.set_fontsize(11)
    for tick in ax.get_yticklabels():
        tick.set_fontsize(11)
    
    z = np.polyfit(non_outliers[cols[0]], non_outliers[cols[1]], 1)
    p = np.poly1d(z)  
    z = plt.plot(np.linspace(0,80,100), p(np.linspace(0,80,100)), color='#365C8D')
    p_str = str(p).lstrip()
    print(p_str)
    '''
    for i, txt in enumerate(outliers[' Surface']):
        print(txt)
        print(outliers.iloc[i,0])
        print(outliers.iloc[i,1])
        #ax.annotate(txt, (outliers.iloc[i,0], outliers.iloc[i,1]), xytext=(outliers.iloc[i,0] - 6.5, outliers.iloc[i,1] + 0.05))
    '''
    #calculating r^2
    NMSE = np.sum(np.power(non_outliers[cols[1]] - p(non_outliers[cols[0]]),2)) / np.sum(np.power(non_outliers[cols[1]]  - np.mean(non_outliers[cols[1]]),2))
    R2 = 1 - NMSE

    plt.xlim([0,80])
    if "-" in str(p[1]):
        label = "%s; R\u00b2 = %.2f" % (p_str,R2)  
    else:
        label = "%s; R\u00b2 = %.2f" % (p_str,R2)

    
    #print(label)

    ax.xaxis.set_minor_locator(MultipleLocator(5))     
    ax.yaxis.set_minor_locator(MultipleLocator(0.25))  
    ax.legend(z,[label])

    plt.show()

    i = i + 1