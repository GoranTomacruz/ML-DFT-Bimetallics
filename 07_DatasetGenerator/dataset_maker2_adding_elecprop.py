import ase
from ase import Atoms
from ase import io
from ase.io import espresso
import numpy as np
import pandas as pd
import os
from os import listdir
from os import mkdir
from os.path import isfile, join
import csv
import sys
import shutil
import os
import xlsxwriter
import ast
from PyAstronomy import pyasl
import math

def get_AB(name,marker):
    if '12' not in name:
        A = name[0:name.find(str(marker))]
        B = name[name.find(str(marker))+1:find_nth(name,str(marker),2)]
    return A, B

def find_nth(string,substring,n):
    if n == 1:
        return string.find(substring)
    else:
        return string.find(substring, find_nth(string, substring, n - 1) + 1)

filename_a = 'ads_extracted_energies_mono_COMBINED_withS.csv'
filename_b = 'ADS_EXTRACTED_MONO_COMBINED_CLEAN_WITH_ELECPROP_withS.csv'
filename_c = 'ADS_EXTRACTED_MONO_COMBINED_CLEAN_WITH_ELECPROP_AND_WF_withS.csv'

#adsorbate dataframe
ads = pd.read_csv(filename_a,delimiter=",")
#print(ads)
ads_data = ads.values

samples = len(ads_data)
name = ""
site = ""


dbc = float("nan")
dbw = float("nan")
dbf = float("nan")
dbc_list = []
dbw_list = []
dbf_list = []
dos_list = []
empty_list = []

dbd = pd.read_csv('./summary_dos_pdos_3.csv',delimiter=",")
#print(ads)
dbd_data = dbd.values
electron_options = len(dbd_data)

i = 0
j = 0

while i < samples:
    j = 0
    print(name)
    dbc = float("nan")
    dbw = float("nan")
    dbf = float("nan")
    dos = float("nan")
    name = ads_data[i,1]
    site = ads_data[i,3]
    if "6" in name:
        name = name.replace("6","2")
        [A,B] = get_AB(name,"2")
        name2 = B + "2" + A  + "2"
    else:
        name2 = name
        name = name[:-2]

    if "-tilt" in site: #not counting tilt so we treat them equally
        site = site.replace("-tilt","")

    while j < electron_options:
        if name == dbd_data[j,0] and site == dbd_data[j,4]:
            dbc = dbd_data[j,1]
            dbw = dbd_data[j,2]
            dbf = dbd_data[j,3]
            dos = dbd_data[j,5]
            print(dbc)
        elif name2 == dbd_data[j,0] and site == dbd_data[j,4]:
            dbc = dbd_data[j,1]
            dbw = dbd_data[j,2]
            dbf = dbd_data[j,3]
            dos = dbd_data[j,5]
            print(dbc)
        j = j + 1


    if np.isnan(dbc) == True:
        #dbc = 999999
        #dbw = 999999
        #dbf = 999999
        #dos = 999999
        #j = j + 1
        
        if name not in empty_list:
            empty_list.append(name)

    
    dbc_list.append(dbc)
    dbw_list.append(dbw)
    dbf_list.append(dbf)
    dos_list.append(dos)

    #print(i)
    
    i = i + 1

nan_count = np.count_nonzero(~np.isnan(dbc_list))
#print(nan_count)

ads['d-Band_Center'] = dbc_list
ads['d-Band_Width'] = dbw_list
ads['d-Band_Filling'] = dbf_list
ads['DOS at Fermi Energy'] = dos_list

#with pd.option_context('display.max_rows', None,):
#    print(ads)

print('Filled samples: {} out of {} - {}%.'.format(nan_count,samples,nan_count/samples*100))

#ads.to_csv(filename_b, encoding='utf-8', index=False)

ads_refined = ads.dropna().reset_index(drop=True)

#with pd.option_context('display.max_rows', None,):
#    print(ads_refined)

ads_refined.to_csv(filename_b, encoding='utf-8', index=False)
ads_refined_data = ads_refined.values



#print(ads_refined)

print("Empty Alloys Count: {}".format(len(empty_list)))

print(empty_list)

samples = nan_count

#print(samples)

#WF

wf = float("nan")
wf_list = []
empty_list = []

wfa = pd.read_csv('./wf_total.csv',delimiter=",")
#print(ads)
wfa_data = wfa.values
wf_options = len(wfa_data)

i = 0
j = 0

while i < samples:
    j = 0
    wf = float("nan")
    name = ads_refined_data[i,1]
    #print(name)
    if "6" in name:
        name = name.replace("6","2")
        [A,B] = get_AB(name,"2")
        name2 = B + "2" + A  + "2"
    else:
        name2 = name
        name = name[:-2]

    while j < wf_options:
        if name == wfa_data[j,0]:
            wf = wfa_data[j,1]
            #print('match')
        elif name2 == wfa_data[j,0]:
            wf = wfa_data[j,1]
            #print('match')
        j = j + 1
    
    if np.isnan(wf) == True:
        #wf = 999999
        #j = j + 1
        if name not in empty_list:
            empty_list.append(name)

    wf_list.append(wf)

    #print(i)
    
    i = i + 1

nan_count = np.count_nonzero(~np.isnan(wf_list))

#print(wf_list)
#print(nan_count)

ads_refined['Work Function'] = wf_list

print(ads)

print('Filled samples: {} out of {} - {}%.'.format(nan_count,samples,nan_count/samples*100))

ads_refined.to_csv(filename_c, encoding='utf-8', index=False)

ads_refined_2 = ads_refined.dropna().reset_index(drop=True)

print(ads_refined_2)

print("Empty Alloys Count: {}".format(len(empty_list)))

print(empty_list)


    
print("Done. Woo.")

