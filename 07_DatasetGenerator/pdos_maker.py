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


#------------------- SUM PDOS



ads = pd.read_csv('./ads_extracted_COMBINED_nomono_clean_v2.csv',delimiter=",")
ads_data = ads.values

print("Writing sumpdos files...")


today = '2022July17'

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
qerunfiles = []
# filter to get only the output files
for file in onlyfiles:
    if ".txt" in file and "symbols" in file[0:7]:
        qerunfiles.append(file)

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
        "#SBATCH --nodes=1         ##CHANGE" + "\n" + \
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
        
        alloy_v2 = B + '6' + A + '6'
        alloy_v3 = A + '6' + B + '6'

        ads_alloy = ads[(ads['surface'] == alloy_v2) | (ads['surface'] == alloy_v3)]
        ads_alloy = ads_alloy.drop_duplicates(subset=['site'])

        with pd.option_context('display.max_rows', None,):
            print(ads_alloy)


        for i in range(len(ads_alloy)):
            #print(ads_alloy.iloc[i,1], ads_alloy.iloc[i,3], ads_alloy.iloc[i,5], ads_alloy.iloc[i,6]) 
            #print(ads_alloy.iloc[i,5][0])
            #print(ads_alloy.iloc[i,6][0])
            site_revise = ads_alloy.iloc[i,3].replace('|','-')

            if "-tilt" in site_revise:
                site_revise = site_revise.replace("-tilt","")

            job += 'STR="'
            #print(len(ads_alloy.iloc[i,6]))

            atom_list = ast.literal_eval(ads_alloy.iloc[i,5])
            index_list = ast.literal_eval(ads_alloy.iloc[i,6])


            for j in range(len(index_list)):
                job += \
                alloy + '.pdos.out.pdos_atm#' + str(index_list[j]) + '\\\\(' + atom_list[j] + '\\\\)*\\(d\\) '
            job += '"\n' + \
            'STR="`sumpdos.x ${STR} > ' + alloy + '_' + site_revise + '_\\(d\\).dat`"' + '\n' + \
            "echo $STR" + "\n\n" 

        job += "sleep 10\n\n"

    qe_str = "qe_run_" + today + "_" + count + ".sumpdos.csh"
    g = open(folder + '/' + qe_str, "w+")
    g.write(job)
    g.close()


#insert code here

print("Done. Woo.")
