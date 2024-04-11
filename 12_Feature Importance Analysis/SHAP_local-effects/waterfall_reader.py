import os
from os import listdir
from os import mkdir
from os.path import isfile, join
import csv
import sys
import shutil
import os
import xlsxwriter
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker
import matplotlib.colors as colors
import shap
from shap.plots import colors
import matplotlib.cm as cm
from matplotlib.colors import LinearSegmentedColormap

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

def find_nth(string,substring,n):
    if n == 1:
        return string.find(substring)
    else:
        return string.find(substring, find_nth(string, substring, n - 1) + 1)

def feature_importances_shap_values(shap_values, features):
    
    '''
    Prints the feature importances based on SHAP values in an ordered way
    shap_values -> The SHAP values calculated from a shap.Explainer object
    features -> The name of the features, on the order presented to the explainer
    '''

    # Calculates the feature importance (mean absolute shap value) for each feature

    feature_imp_matrix = np.empty((len(features),1))
    feature_matrix = np.empty((len(features),1),dtype='U32')

    for i in range(shap_values.shape[1]):
        feature_imp_matrix[i][0] = np.mean(np.abs(shap_values[:, i]))
        feature_matrix[i][0] = features[i]

    feature_imp_matrix = np.hstack((feature_imp_matrix,feature_matrix))

    imp_df = pd.DataFrame(feature_imp_matrix, columns = ['Importances', 'Columns'])

    return imp_df

adsorbates = ['C', 'H', 'O']
regression = 'GPR'
cmap = plt.cm.plasma
#workbook = xlsxwriter.Workbook(regression + "_regression_results_v9.4_STAGE-2-FINAL-decoded.xlsx")

feature_lists = [['LC','MV','EA','SE','DBC','DBF','DOS','EAC','GCN'],['LC','MV','EN','SE','DBC','DBF','DOS','EAC','GCN'],['LC','EN','DBW','DBF','DOS','WF','EAC','GCN','VE']]
feature_lists_2 = [['Lattice Constant','Molar Volume','Electron Affinity','Sublimation Energy','d-Band Center','d-Band Filling','Density of States at Fermi Energy','Ensemble Atom Count','Generalized Coordination Number'],['Lattice Constant','Molar Volume','Electronegativity','Sublimation Energy','d-Band Center','d-Band Filling','Density of States at Fermi Energy','Ensemble Atom Count','Generalized Coordination Number'],['Lattice Constant','Electronegativity','d-Band Width','d-Band Filling','Density of States at Fermi Energy','Work Function','Ensemble Atom Count','Generalized Coordination Number','Valence Electrons']]
#feature_lists_adjusted = [['MV', 'LC', 'GCN', 'DOS', 'EA', 'DBF', 'DBC', 'SE', 'EAC'], ['MV', 'GCN', 'DOS', 'DBF', 'LC', 'SE', 'EN', 'DBC', 'EAC'], ['GCN', 'DOS', 'LC', 'DBF', 'DBW', 'WF', 'EN', 'EAC', 'VE']]
#feature_lists_adjusted_2 = [['Molar Volume', 'Lattice Constant', 'Generalized Coordination Number', 'Density of States at Fermi Energy', 'Electron Affinity', 'd-Band Filling', 'd-Band Center', 'Sublimation Energy', 'Ensemble Atom Count'], ['Molar Volume', 'Generalized Coordination Number', 'Density of States at Fermi Energy', 'd-Band Filling', 'Lattice Constant', 'Sublimation Energy', 'Electronegativity', 'd-Band Center', 'Ensemble Atom Count'], ['Generalized Coordination Number', 'Density of States at Fermi Energy', 'Lattice Constant', 'd-Band Filling', 'd-Band Width', 'Work Function', 'Electronegativity', 'Ensemble Atom Count', 'Valence Electrons']]

#FILE READER
feature_values = ['S2-GPR-shap-data_test-X_18_C.csv', 'S2-GPR-shap-data_test-X_18_H.csv', 'S2-GPR-shap-data_test-X_18_O.csv']
trial_string = 'trial-0'

j = 0
for adsorbate in adsorbates:
    print("Doing " + adsorbate + "...")

    onlyfiles = []
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    finalfiles_shap_values = []
    finalfiles_test_x = []
    finalfiles_test_y = []
    # filter to get only the output files
    for file in onlyfiles:
        if "S2-" in file[0:3] and regression in file and "shap-values_" in file and adsorbate in file and trial_string in file:
            finalfiles_shap_values.append(file)
        elif regression in file and "test" in file and adsorbate in file:
            finalfiles_test_x.append(file)
        elif regression in file and "y_" in file and adsorbate in file:
            finalfiles_test_y.append(file)
    
    # initialize parameters
    #plt.figure(figsize=(3.5*4/3, 3.5))
    plt.rcParams['font.family'] = 'Roboto Condensed'
    plt.rcParams['font.size'] = 14
    #plt.rcParams['legend.title_fontsize'] = 12
    #plt.rc('legend', fontsize=12)
    
    for k in range(len(finalfiles_shap_values)):
        shap_values_df = pd.read_csv(finalfiles_shap_values[k],delimiter=',',names=feature_lists[k])
        test_df = pd.read_csv(finalfiles_test_y[k],delimiter=',')
        shap_values_df['Predicted Y'] = test_df['Predicted Y']

        shap_values_array = np.loadtxt(finalfiles_shap_values[k], delimiter=',')
        feature_values_array = np.loadtxt(finalfiles_test_x[k],skiprows=1, delimiter=',')
        #my_cmap = plt.get_cmap('viridis')
        plt.figure()
        plt.yticks(fontsize=14,color='black',fontproperties="Roboto Condensed")
        plt.xticks(fontsize=14,color='black',fontproperties="Roboto Condensed")
        plt.xlabel('SHAP value(impact on model output)',fontsize=14,fontproperties="Roboto Condensed")
        plt.minorticks_on()
        ax = plt.gca()
        ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.5))
        colors = ['#032c7a', '#ed0d47'] # first color is black, last is red
        my_cmap = LinearSegmentedColormap.from_list("Custom", colors, N=256)
        shap.summary_plot(shap_values_array, cmap=my_cmap, feature_names = feature_lists[j], features=feature_values_array, plot_size=(3.5*4/3, 3.5), show=False)
        plt.savefig('SHAP Waterfall_' + regression + '-' + adsorbate + '.png',dpi = 1000,bbox_inches='tight')

    print(adsorbate + " is done.")

    j = j + 1

