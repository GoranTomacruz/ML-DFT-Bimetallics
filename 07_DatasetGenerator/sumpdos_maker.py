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


def get_AB(name,marker,finalfiles):

    switch = 99

    A = name[0:name.find(str(marker))]
    B = name[name.find(str(marker))+1:find_nth(name,str(marker),2)]

    option1 = "_" + A + "2" + B + "2" + ".txt"
    option2 = "_" + B + "2" + A + "2" + ".txt"

    #print(finalfiles)
    #print(name)

    if option1 in finalfiles:
        file = option1
        switch = 0
    else:
        file = option2
        switch = 1

    return A, B, switch

def find_nth(string,substring,n):
    if n == 1:
        return string.find(substring)
    else:
        return string.find(substring, find_nth(string, substring, n - 1) + 1)

#------------------- SUM PDOS IF BI

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
blacklist = {'Al', 'Bi', 'Ga', 'In', 'Pb', 'Sn', 'Tl', 'C', 'H', 'O', 'N', 'S'}
# filter to get only the output files
for file in onlyfiles:
    if "_" in file[0] and any([x not in file for x in blacklist]):
        finalfiles.append(file)

ads = pd.read_csv('./ads_extracted_COMBINED_nomono_clean_v2.csv',delimiter=",")
ads_data = ads.values

print("Writing sumpdos files...")


today = '2022July17'

# IF BI
onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
qerunfiles = []
# filter to get only the output files
for file in onlyfiles:
    if ".txt" in file and "symbols" in file[0:7]:
        qerunfiles.append(file)

qerunfiles.remove('symbols_2022June23_00.txt')

'''#IF MONO
qerunfiles = ['symbols_2022June23_00.txt']
'''

qerunfiles = sorted(qerunfiles)
#print(qerunfiles)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
file_list = []
job = ""


for file in qerunfiles:
    count = file[-6:-4]
    folder = './' + today + '_' + count
    #print(folder)
    mkdir(folder)
    job = ""
    job += \
        "#!/bin/bash" + "\n" + \
        "#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
        "#SBATCH --job-name=SP-" + count + "##CHANGE" + "\n" + \
        "#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
        "#SBATCH --mem-per-cpu=4G" + "\n" + \
        "#SBATCH --out=" + today + "files." + count + ".out     ##CHANGE" + "\n" + \
        "#SBATCH --error=" + today + "files." + count + ".err     ##CHANGE" + "\n" + \
        "#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE" + "\n" + \
        "#SBATCH --mail-type=ALL" + "\n" + \
        "#SBATCH --requeue" + "\n" + "\n" \
        'echo "SLURM_JOBID="$SLURM_JOBID' + "\n" + \
        'echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST' + "\n" + \
        'echo "SLURM_NNODES"=$SLURM_NNODES' + "\n" + \
        'echo "SLURMTMPDIR="$SLURMTMPDIR' + "\n" + \
        'echo "working directory = "$SLURM_SUBMIT_DIR' + "\n" + "\n" + \
        "module load openblas/0.3.9" + "\n" + \
        "module load fftw/3.3.8" + "\n" + \
        "module load anaconda/3-2021.11" + "\n" + "\n" + \
        "ulimit -s unlimited" + "\n" + "\n" + \
        "export OMP_NUM_THREADS=1" + "\n" + "\n" + \
        "##cd to working directory" + "\n"

    file_list = []
    #print("\n" + file)
    f = open(file, "r")
    file_list = f.read().splitlines() 
    for alloy in file_list:
        print(alloy)
        ads_alloy = []
        alloy = alloy[:-3] 
        [A,B,switch] = get_AB(alloy,'2',finalfiles)
        
        #IF BI
        alloy_v2 = B + '6' + A + '6'
        alloy_v3 = A + '6' + B + '6'

        ads_alloy = ads[(ads['surface'] == alloy_v2) | (ads['surface'] == alloy_v3)]
        #ads_alloy = ads_alloy.drop_duplicates(subset=['site']) IF SITE
        ads_alloy = ads_alloy.drop_duplicates(subset=['ads+neighbors_site']) # IF NEIGHBORS
        

        #IF MONO
        '''
        alloy_v2 = alloy + '12' 

        ads_alloy = ads[(ads['surface'] == alloy_v2)]
        ads_alloy = ads_alloy.drop_duplicates(subset=['ads+neighbors_site'])
        '''

        #with pd.option_context('display.max_rows', None,):
        #    print(ads_alloy)


        for i in range(len(ads_alloy)):
 
            ''' FOR SITE     
            site_revise = ads_alloy.iloc[i,12].replace('|','-')

            if "-tilt" in site_revise:
                site_revise = site_revise.replace("-tilt","")
            '''

            job += 'STR="'
            #print(len(ads_alloy.iloc[i,6]))

            ''' #SITE-MUST EDIT
            atom_list = ast.literal_eval(ads_alloy.iloc[i,15])
            index_list = ast.literal_eval(ads_alloy.iloc[i,16])
            '''

            #NEIGHBORS
            atom_list = ast.literal_eval(ads_alloy.iloc[i,17])
            index_list = ast.literal_eval(ads_alloy.iloc[i,18])

            for j in range(len(index_list)):
                job += \
                alloy + '.pdos.out.pdos_atm#' + str(index_list[j]) + '\\\\(' + atom_list[j] + '\\\\)*\\(d\\) '
            ''' # SITE
            job += '"\n' + \
            'STR="`sumpdos.x ${STR} > ' + alloy + '_' + site_revise + '_\\(d\\).dat`"' + '\n' + \
            "echo $STR" + "\n\n" 
            '''

            #NEIGHBORS
            job += '"\n' + \
            'STR="`sumpdos.x ${STR} > ' + alloy + '_two-layers_\\(d\\).dat`"' + '\n' + \
            "echo $STR" + "\n\n"

        job += "sleep 10\n\n"

    qe_str = "qe_run_" + today + "_" + count + ".sumpdos.csh"
    g = open(folder + '/' + qe_str, "w+")
    g.write(job)
    g.close()



#------------------- SUM PDOS IF MONO
'''  

print("Writing sumpdos files...")
ads = pd.read_csv('./ads_extracted_energies_mono_combined.csv',delimiter=",")
ads_data = ads.values


today = '2022July14'

'''
#nlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
#qerunfiles = []
# filter to get only the output files
#for file in onlyfiles:
#   if ".txt" in file and "symbols" in file[0:7]:
#       qerunfiles.append(file)
'''
qerunfiles = ['symbols_2022June23_00.txt']
#print(qerunfiles)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
file_list = []
job = ""

for file in qerunfiles:
    count = file[-6:-4]
    folder = './' + today + '_' + count
    #print(folder)
    mkdir(folder)
    job = ""
    job += \
        "#!/bin/bash" + "\n" + \
        "#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
        "#SBATCH --job-name=SP-" + count + "##CHANGE" + "\n" + \
        "#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
        "#SBATCH --mem-per-cpu=4G" + "\n" + \
        "#SBATCH --out=" + today + "files." + count + ".out     ##CHANGE" + "\n" + \
        "#SBATCH --error=" + today + "files." + count + ".err     ##CHANGE" + "\n" + \
        "#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE" + "\n" + \
        "#SBATCH --mail-type=ALL" + "\n" + \
        "#SBATCH --requeue" + "\n" + "\n" \
        'echo "SLURM_JOBID="$SLURM_JOBID' + "\n" + \
        'echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST' + "\n" + \
        'echo "SLURM_NNODES"=$SLURM_NNODES' + "\n" + \
        'echo "SLURMTMPDIR="$SLURMTMPDIR' + "\n" + \
        'echo "working directory = "$SLURM_SUBMIT_DIR' + "\n" + "\n" + \
        "module load openblas/0.3.9" + "\n" + \
        "module load fftw/3.3.8" + "\n" + \
        "module load anaconda/3-2021.11" + "\n" + "\n" + \
        "ulimit -s unlimited" + "\n" + "\n" + \
        "export OMP_NUM_THREADS=1" + "\n" + "\n" + \
        "##cd to working directory" + "\n"

    file_list = []
    #print("\n" + file)
    f = open(file, "r")
    file_list = f.read().splitlines() 
    for metal in file_list:
        print(metal)
        ads_metal = []
        metal = metal[:-3] 
        
        metal_v2 = metal + '12' 

        ads_metal = ads[(ads['surface'] == metal_v2)]
        ads_metal = ads_metal.drop_duplicates(subset=['surface','site'])

        print(ads_metal)


        for i in range(len(ads_metal)):
            #print(ads_metal.iloc[i,1], ads_metal.iloc[i,3], ads_metal.iloc[i,5], ads_metal.iloc[i,6]) 
            #print(ads_metal.iloc[i,5][0])
            #print(ads_metal.iloc[i,6][0])
            site_revise = ads_metal.iloc[i,3].replace('|','-')

            if "-tilt" in site_revise:
                site_revise = site_revise.replace("-tilt","")

            job += 'STR="'


            atom_list = ast.literal_eval(ads_metal.iloc[i,5])
            index_list = ast.literal_eval(ads_metal.iloc[i,6])

            for j in range(len(index_list)):
                job += \
                metal + '.pdos.out.pdos_atm#' + str(index_list[j]) + '\\\\(' + atom_list[j] + '\\\\)*\\(d\\) '
            job += '"\n' + \
            'STR="`sumpdos.x ${STR} > ' + metal + '_' + site_revise + '_\\(d\\).dat`"' + '\n' + \
            "echo $STR" + "\n\n" 

        job += "sleep 10\n\n"

    qe_str = "qe_run_" + today + "_" + count + ".sumpdos.csh"
    g = open(folder + '/' + qe_str, "w+")
    g.write(job)
    g.close()

#insert code here
    
'''

#insert code here

print("Done. Woo.")
