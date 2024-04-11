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
import sys
import shutil
import os
import ast
import math


today = '2022July11'

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
# filter to get only the output files
for file in onlyfiles:
    if ".txt" in file and "_" not in file[0]:
        finalfiles.append(file)

finalfiles = sorted(finalfiles)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
file_list = []
job = ""

for file in finalfiles:
    count = file[-6:-4]
    folder = './' + today + '_' + count
    print(folder)
    mkdir(folder)

    job = ""
    h_job = ""
    i_job = ""
    j_job = ""
    k_job = ""
    job += \
        "#!/bin/bash" + "\n" + \
        "#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
        "#SBATCH --job-name=PPm-" + count + "##CHANGE" + "\n" + \
        "#SBATCH --nodes=1         ##CHANGE" + "\n" + \
        "#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
        "#SBATCH --mem-per-cpu=4G" + "\n" + \
        "#SBATCH --out=" + today + "files." + count + ".out     ##CHANGE" + "\n" + \
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
    print("\n" + file)
    f = open(file, "r")
    file_list = f.read().splitlines() 
    for element in file_list:
        h_job = ""
        i_job = ""
        j_job = ""
        k_job = ""


        sym = element[:-3]

        job += "pp.x      -i " + sym + "-pp.in > " + sym + "-pp.out &&\n"
        job += "dos.x     -i " + sym + "-dos.in > " + sym + "-dos.out &&\n"
        job += "average.x -i " + sym + "-wf.ave.in > " + sym + "-wf.ave.out &&\n"
        job += "mv avg.dat " + sym + "-avg.dat &&\n"
        job += "projwfc.x -i " + sym + "-pdos.in > " + sym + "-pdos.out &&\n"
        job += "sleep 10\n\n"

        #pp making
        h_job += \
        "&INPUTPP\n" + \
        "prefix = '" + sym + "750_beef',\n" + \
        "outdir = './" + sym + "750',\n" + \
        "filplot = '" + sym + "-wf.dat',\n" + \
        "plot_num = 11\n" + \
        "/" + "\n" 

        pp_str = sym + "-pp.in"
        h = open(folder + '/' + pp_str, "w+")
        h.write(h_job)
        h.close()

        #dos making
        i_job += \
        "&DOS\n" + \
        "prefix = '" + sym + "750_beef',\n" + \
        "outdir = './" + sym + "750',\n" + \
        "degauss = 0.001,\n" + \
        "DeltaE = 0.001,\n" + \
        "fildos = '" + sym + ".dos.out',\n" + \
        "/" + "\n" 
        
        dos_str = sym + "-dos.in"
        i = open(folder + '/' + dos_str, "w+")
        i.write(i_job)
        i.close()
        
        #pdos making
        j_job += \
        "&PROJWFC\n" + \
        "prefix = '" + sym + "750_beef',\n" + \
        "outdir = './" + sym + "750',\n" + \
        "degauss = 0.001,\n" + \
        "DeltaE = 0.001,\n" + \
        "filpdos = '" + sym + ".pdos.out',\n" + \
        "filproj = '" + sym + ".proj.out',\n" + \
        "/" + "\n" 
        
        pdos_str = sym + "-pdos.in"
        j = open(folder + '/' + pdos_str, "w+")
        j.write(j_job)
        j.close()

        #ave.in making
        k_job += \
        "1\n" + \
        sym + "-wf.dat\n" + \
        "1.0\n" + \
        "300\n" + \
        "3\n" + \
        "3.0000\n" + \
        "/" + "\n" 

        ave_str = sym + "-wf.ave.in"
        k = open(folder + '/' + ave_str, "w+")
        k.write(k_job)
        k.close()

    qe_str = "qe_run_" + today + "_" + count + ".post.csh"
    g = open(folder + '/' + qe_str, "w+")
    g.write(job)
    g.close()
    

print("\nDone.")

