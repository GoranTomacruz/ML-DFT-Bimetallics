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



#------------------- PYTHON RUN FILES

print("Writing python run files...")


today = '2022July10'

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
pythonrunfiles1 = []
pythonrunfiles2 = []
# filter to get only the output files
for file in onlyfiles:
	if ".txt" in file and "bulk_symbols" in file[0:12]:
		pythonrunfiles1.append(file)
	elif ".txt" in file and "surf_symbols" in file[0:12]:
		pythonrunfiles2.append(file)

pythonrunfiles1 = sorted(pythonrunfiles1)
pythonrunfiles2 = sorted(pythonrunfiles2)
#print(pythonrunfiles)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
file_list = []
job = ""

for file in pythonrunfiles1:
	count = file[-6:-4]
	folder = './' + today + '_bulk_' + count
	#print(folder)
	mkdir(folder)
	job = ""
	job += \
		"#!/bin/bash" + "\n" + \
		"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
		"#SBATCH --job-name=SEb" + count + "##CHANGE" + "\n" + \
		"#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
		"#SBATCH --mem-per-cpu=4G" + "\n" + \
		"#SBATCH --out=" + today + "files." + count + ".bulk.out     ##CHANGE" + "\n" + \
		"#SBATCH --out=" + today + "files." + count + ".bulk.err     ##CHANGE" + "\n" + \
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
		"##cd to working directory" + "\n" + \
		"srun final_energy_taker_bulk.py" + "\n" + \
		"sleep 10\n\n"

	'''
	'''
	python_str = "python_run_" + today + "_" + count + ".bulk.csh"
	g = open(folder + '/' + python_str, "w+")
	g.write(job)
	g.close()

	shutil.copy('final_energy_taker_bulk.py', folder + '/final_energy_taker_bulk.py')

for file in pythonrunfiles2:
	count = file[-6:-4]
	folder = './' + today + '_' + count + '_wf'
	#print(folder)
	mkdir(folder)
	job = ""
	job += \
		"#!/bin/bash" + "\n" + \
		"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
		"#SBATCH --job-name=WF" + count + "##CHANGE" + "\n" + \
		"#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
		"#SBATCH --mem-per-cpu=4G" + "\n" + \
		"#SBATCH --out=" + today + "files." + count + ".out     ##CHANGE" + "\n" + \
		"#SBATCH --out=" + today + "files." + count + ".err     ##CHANGE" + "\n" + \
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
		"##cd to working directory" + "\n" + \
		"srun wf_solver.py" + "\n" + \
		"sleep 10\n\n"

	'''
	'''
	python_str = "python_run_" + today + "_" + count + ".wf.csh"
	h = open(folder + '/' + python_str, "w+")
	h.write(job)
	h.close()

	shutil.copy('wf_solver.py', folder + '/wf_solver.py')


#insert code here
	
print("Done. Woo.")

