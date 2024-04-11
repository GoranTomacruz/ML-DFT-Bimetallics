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
regression = 'GPR'

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
        if "S2-" in file[0:3] and regression in file and "shap-values" in file and adsorbate in file and "appended" not in file and "summary" not in file:
            finalfiles_imp.append(file)
            file_idx = int(file[file.find('_')+1:find_nth(file,'_',2)])
            finalfiles_imp_idx.append(file_idx)
        elif "S2-" in file[0:3] and regression in file and "-y_" in file and adsorbate in file and "appended" not in file and "summary" not in file:
            finalfiles_test.append(file)
            #file_idx = int(file[file.find('_')+1:find_nth(file,'_',2)])
            file_idx = int(file[find_nth(file,'_',2)+1:find_nth(file,'_',3)]) #GPR
            finalfiles_test_idx.append(file_idx)

    finalfiles_imp = [x for _, x in sorted(zip(finalfiles_imp_idx, finalfiles_imp))]  
    finalfiles_imp_idx.sort()
    finalfiles_test = [x for _, x in sorted(zip(finalfiles_test_idx, finalfiles_test))]  
    finalfiles_test_idx.sort()

    keys = np.loadtxt(key_search[j],delimiter=',',skiprows=1,dtype='U32')
    sample = pd.read_csv(finalfiles_test[0])
    surf_matrix = np.empty((len(sample),2),dtype='U32')
    iteration_list = []
    surf_list = []
    Pt_list = []
    Ag_list = []
    Cu_list = []
    Co_list = []
    Pd_list = []

    for count, file in enumerate(finalfiles_test):
        k = 0
        file_data = np.loadtxt(file,delimiter=",",skiprows=1)
        file_data_2 = np.loadtxt(finalfiles_imp[count],delimiter=",")
        Pt_count = 0
        Ag_count = 0
        Cu_count = 0
        Co_count = 0
        Pd_count = 0
        key_surfaces = []
        for k in range(len(file_data)):
            l = 0
            for l in range(len(keys)):
                if file_data[k,0] == float(keys[l,1]):
                    surf_matrix[k,0] = keys[l,0]
                    surf_matrix[k,1] = keys[l,2]
                    if 'Pt' in keys[l,0]:
                        Pt_count = Pt_count + 1
                        key_surfaces.append(keys[l,0])
                    if 'Ag' in keys[l,0]:
                        Ag_count = Ag_count + 1
                        key_surfaces.append(keys[l,0])
                    if 'Cu' in keys[l,0]:
                        Cu_count = Cu_count + 1
                        key_surfaces.append(keys[l,0])
                    if 'Co' in keys[l,0]:
                        Co_count = Co_count + 1
                        key_surfaces.append(keys[l,0])
                    if 'Pd' in keys[l,0]:
                        Pd_count = Pd_count + 1
                        key_surfaces.append(keys[l,0])

        iteration_list.append(str(count))
        surf_list.append('-'.join(key_surfaces))
        Pt_list.append(str(Pt_count))
        Ag_list.append(str(Ag_count))
        Cu_list.append(str(Cu_count))
        Co_list.append(str(Co_count))
        Pd_list.append(str(Pd_count))


        #print(surf_matrix)
        file_data = np.hstack((file_data,surf_matrix))
        file_data_2 = np.hstack((file_data_2,surf_matrix))
        csv_header = ','.join(feature_lists[j]) + ',Surface,Site'

        np.savetxt("S2-" + regression + "-test-appended_" + str(count) + "_" + adsorbate + ".csv", file_data, delimiter=',', header='Test Y, Predicted Y, Surface, Site', comments='', fmt='%s,%s,%s,%s')
        np.savetxt("S2-" + regression + "-shap-values-appended_" + str(count) + "_" + adsorbate + ".csv", file_data_2, delimiter=',', header=csv_header, comments='', fmt='%s')
        print(count)

    iteration_array = np.c_[iteration_list]
    surf_array = np.c_[surf_list]
    Pt_array = np.c_[Pt_list]
    Ag_array = np.c_[Ag_list]
    Cu_array = np.c_[Cu_list]
    Co_array = np.c_[Co_list]
    Pd_array = np.c_[Pd_list]

    file_data_3 = np.hstack((iteration_array,surf_array,Pt_array,Ag_array,Cu_array,Co_array,Pd_array))
    csv_header_2 = 'Random Seed,Key Surfaces,Pt-count,Ag-count,Cu-count,Co-count,Pd-count'
    np.savetxt("S2-" + regression + "-iteration_summary_" + adsorbate + ".csv", file_data_3, delimiter=',', header=csv_header_2, comments='', fmt='%s')

    print(adsorbate + " is done.")

    j = j + 1


#Workbook.close()