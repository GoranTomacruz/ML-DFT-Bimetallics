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
regression = 'ANN'

#workbook = xlsxwriter.Workbook(regression + "_regression_results_v9.4_STAGE-2-FINAL-decoded.xlsx")

feature_lists = [['lattice_constant_alloy', 'molar_volume_alloy', 'EN_alloy', 'EA_alloy', 'Sublimation Energy', 'd-Band_Center', 'd-Band_Width', 'DOS at Fermi Energy', 'CN', 'GCN', 'Valence Electrons'],['lattice_constant_alloy', 'molar_volume_alloy', 'EN_alloy', 'IE_alloy', 'EA_alloy', 'Sublimation Energy', 'd-Band_Center', 'd-Band_Width', 'DOS at Fermi Energy', 'CN', 'GCN'],['lattice_constant_alloy', 'EN_alloy', 'EA_alloy', 'Sublimation Energy', 'd-Band_Width', 'DOS at Fermi Energy', 'Work Function', 'CN', 'GCN', 'Valence Electrons']]
key_search = ['updated_v9_ml_data_c_key_search.csv','updated_v9_ml_data_h_key_search.csv','updated_v9_ml_data_o_key_search.csv']
j = 0
for adsorbate in adsorbates:
    print("Doing " + adsorbate + "...")

    onlyfiles = []
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    finalfiles_imp = []
    finalfiles_imp_idx = []
    finalfiles_test = []
    finalfiles_test_idx = []
    # filter to get only the output files
    for file in onlyfiles:
        if "S2-" in file[0:3] and regression in file and "shap-values" in file and adsorbate in file:
            finalfiles_imp.append(file)
            file_idx = int(file[file.find('_')+1:find_nth(file,'_',2)])
            finalfiles_imp_idx.append(file_idx)
        elif "S2-" in file[0:3] and regression in file and "-y_" in file and adsorbate in file:
            finalfiles_test.append(file)
            file_idx = int(file[file.find('_')+1:find_nth(file,'_',2)])
            #file_idx = int(file[find_nth(file,'_',2)+1:find_nth(file,'_',3)]) #GPR
            finalfiles_test_idx.append(file_idx)

    finalfiles_imp = [x for _, x in sorted(zip(finalfiles_imp_idx, finalfiles_imp))]  
    finalfiles_imp_idx.sort()
    finalfiles_test = [x for _, x in sorted(zip(finalfiles_test_idx, finalfiles_test))]  
    finalfiles_test_idx.sort()
    #print(finalfiles_imp)
    #print(finalfiles_imp_idx)
    #print(adsorbate)
    #print(feature_lists[j])

    #shap_values = np.loadtxt(finalfiles_imp[i],delimiter=',')

    keys = np.loadtxt(key_search[j],delimiter=',',skiprows=1)

    
    imp_matrix = np.empty((50,len(feature_lists[j])))
    imp_matrix_stats = np.empty((2,len(feature_lists[j])))


    
    for count, file in enumerate(finalfiles_imp):
        shap_values = np.loadtxt(file,delimiter=',')
        file_data = feature_importances_shap_values(shap_values, feature_lists[j])
        count2 = 0
        for count2, feature in enumerate(feature_lists[j]):
            data_idx = file_data.index[file_data['Columns'] == feature]
            imp_matrix[count][count2] = float(file_data.loc[data_idx,'Importances']) 
    
    #print(imp_matrix)

    csv_header = ','.join(feature_lists[j])

    #print(csv_header)
    #print(type(csv_header))

    np.savetxt(regression + "-SHAP-Importance-Matrix-" + adsorbate + ".csv", imp_matrix, delimiter=',', header=csv_header, comments='')

    imp_matrix_stats[0][:] = np.mean(imp_matrix,axis=0)
    imp_matrix_stats[1][:] = np.std(imp_matrix,axis=0)

    #print(imp_matrix_stats)

    imp_matrix_stats = imp_matrix_stats.transpose()

    header_array = np.c_[feature_lists[j]]

    imp_matrix_stats = np.hstack((header_array,imp_matrix_stats))

    #print(imp_matrix_stats)

    np.savetxt(regression + "-SHAP-Importance-Stats-" + adsorbate + ".csv", imp_matrix_stats, delimiter=',', fmt='%s,%s,%s', header='Feature, Mean (eV), STDEV (eV)', comments='')

    print(adsorbate + " is done.")

    j = j + 1


#Workbook.close()