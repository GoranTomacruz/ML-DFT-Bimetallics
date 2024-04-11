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

    feature_imp_matrix = np.empty((len(features),2))
    feature_matrix = np.empty((len(features),1),dtype='U32')

    for i in range(shap_values.shape[1]):
        feature_imp_matrix[i][0] = np.mean(np.abs(shap_values[:, i]))
        feature_imp_matrix[i][1] = np.std(np.abs(shap_values[:, i]))
        feature_matrix[i][0] = features[i]

    feature_imp_matrix = np.hstack((feature_imp_matrix,feature_matrix))

    imp_df = pd.DataFrame(feature_imp_matrix, columns = ['Importances', 'STD', 'Columns'])

    return imp_df

adsorbates = ['C', 'H', 'O']
regression = 'ANN'

#workbook = xlsxwriter.Workbook(regression + "_regression_results_v9.4_STAGE-2-FINAL-decoded.xlsx")

feature_lists = [['LC','MV','EA','SE','DBC','DBF','DOS','CN','GCN'],['LC','MV','EN','SE','DBC','DBF','DOS','CN','GCN'],['LC','EN','DBW','DBF','DOS','WF','CN','GCN','VE']]
j = 0
for adsorbate in adsorbates:
    print("Doing " + adsorbate + "...")

    onlyfiles = []
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    finalfiles_imp = []
    finalfiles_imp_idx = []
    # filter to get only the output files
    for file in onlyfiles:
        if "S2-" in file[0:3] and regression in file and "shap-values" in file and adsorbate in file:
            finalfiles_imp.append(file)
            file_idx = int(file[file.find('_')+1:find_nth(file,'_',2)])
            finalfiles_imp_idx.append(file_idx)

    finalfiles_imp = [x for _, x in sorted(zip(finalfiles_imp_idx, finalfiles_imp))]  
    finalfiles_imp_idx.sort()
    #print(finalfiles_imp)
    #print(finalfiles_imp_idx)
    #print(adsorbate)
    #print(feature_lists[j])

    #shap_values = np.loadtxt(finalfiles_imp[i],delimiter=',')

    print(finalfiles_imp)
    print(finalfiles_imp_idx)
    

    
    imp_matrix = np.empty((1,len(feature_lists[j])))
    std_matrix = np.empty((1,len(feature_lists[j])))
    imp_matrix_stats = np.empty((2,len(feature_lists[j])))


    
    for count, file in enumerate(finalfiles_imp):
        shap_values = np.loadtxt(file,delimiter=',')
        file_data = feature_importances_shap_values(shap_values, feature_lists[j])
        count2 = 0
        for count2, feature in enumerate(feature_lists[j]):
            data_idx = file_data.index[file_data['Columns'] == feature]
            imp_matrix[count][count2] = float(file_data.loc[data_idx,'Importances']) 
            std_matrix[count][count2] = float(file_data.loc[data_idx,'STD']) 
    
    #print(imp_matrix)

    csv_header = ','.join(feature_lists[j])

    #print(csv_header)
    #print(type(csv_header))

    np.savetxt(regression + "-SHAP-Importance-Matrix-" + adsorbate + ".csv", imp_matrix, delimiter=',', header=csv_header, comments='')

    imp_matrix_stats[0][:] = np.mean(imp_matrix,axis=0)
    imp_matrix_stats[1][:] = np.sqrt(np.sum(np.square(std_matrix),axis=0))/np.sqrt(1)

    imp_matrix_stats = imp_matrix_stats.transpose()

    header_array = np.c_[feature_lists[j]]

    imp_matrix_stats = np.hstack((header_array,imp_matrix_stats))

    #print(imp_matrix_stats)

    np.savetxt(regression + "-SHAP-Importance-Stats-" + adsorbate + ".csv", imp_matrix_stats, delimiter=',', fmt='%s,%s,%s', header='Feature, Mean (eV), STDEV (eV)', comments='')

    print(adsorbate + " is done.")

    j = j + 1


#Workbook.close()