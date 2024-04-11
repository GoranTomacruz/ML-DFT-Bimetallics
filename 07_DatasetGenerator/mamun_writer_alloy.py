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
import xlsxwriter
import ast
from PyAstronomy import pyasl
import math


def replacer(symbol,filename):
	f = open(filename,'r')
	filedata = f.read()
	f.close()
	newdata = filedata.replace("\'0.01D0\'","0.01D0")
	newdata = newdata.replace("\'0.0D0\'","0.0D0")
	if symbol == "Fe" or symbol == "Co":
		cree = 1
	else:
		newdata = newdata.replace("angstrom","alat")
	newdata = newdata.replace("'.true.'",".true.")
	f = open(filename,'w')
	f.write(newdata)
	f.close()

def magnetization(symbol):
	switcher = {
		"Fe": 6, #1.25
		"Co": 12, 
		"Ni": 9,
		"Mn": 5	 #0.66
	}

	return switcher.get(symbol, "nothing")

def find_nth(string,substring,n):
	if n == 1:
		return string.find(substring)
	else:
		return string.find(substring, find_nth(string, substring, n - 1) + 1)

filecounter = 1

today = '2022July02'

an = pyasl.AtomicNo()

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
# filter to get only the output files
for file in onlyfiles:
	if "_" in file[0]:
		finalfiles.append(file)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
finalfiles = sorted(finalfiles)
print(finalfiles)


for file in finalfiles:
	sym = file[1:file.find('.t')]
	fileScan = open(file, "r")
	
	x = 0
	y = 0
	z = 0
	coord = []
	axes = []
	symbols = []
	crystal = 0

	for line in fileScan:
		if 'Coordinates:' in line or (x > 0 and x <= 12):    
			if x > 0:
				coord.append([float(i) for i in line.split()])
			x = x + 1

		if 'Crystal Axes:' in line or (y > 0 and y <= 3):    
			if y > 0:
				axes.append([float(i) for i in line.split()])
			y = y + 1
		if 'Order:' in line or (z > 0 and z <= 1):    
			if z > 0:
				symbols = ast.literal_eval(line)
				symbols = [n.strip() for n in symbols]
			z = z + 1

	coords_arr = np.array(coord)
	axes_arr = np.array(axes)

	#if any coordinate is greater than 1, crystal = 1
	if (coords_arr < 1.05).all():
		crystal = 1

	if crystal == 1:
		#print('conversion')
		for i in range(len(coords_arr)):
			coords_arr[i] = np.matmul(coords_arr[i],axes_arr)

	coords_arr = list(zip(coords_arr.T[0],coords_arr.T[1],coords_arr.T[2]))
	axes_arr = list(zip(axes_arr.T[0],axes_arr.T[1],axes_arr.T[2]))

	kpt = 12
	ecutwfc = 750

	filecounter = filecounter + 1
	ecutwfc_ry = ecutwfc*0.0734986176495
	ecutrho_ry = ecutwfc_ry*10

	filename = sym + ".in"
	outfilename = sym + ".out"
	symbol_count = len(symbols)
	numbers = np.zeros([12], dtype=int)
	magnets = np.zeros([12], dtype=int)
	kpoints = (kpt, kpt, 1)

	i = 1
	magnet_surfaces = ["Mn", "Ni", "Co", "Fe"]
	while i <= len(symbols):
		numbers[i-1] = an.getAtomicNo(symbols[i-1])
		if symbols[i-1] in magnet_surfaces:
			magnets[i-1] = magnetization(symbols[i-1])
		else:
			magnets[i-1] = 0
		i = i + 1

	pseudo = {
	"Sc": "Sc.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Ti": "Ti.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"V": "V.pbe-spnl-rrkjus_psl.1.0.0.UPF",
	"Cr": "Cr.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Mn": "Mn.pbe-spn-rrkjus_psl.0.3.1.UPF",
	"Fe": "Fe.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Co": "Co.pbe-spn-rrkjus_psl.0.3.1.UPF",
	"Ni": "Ni.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Cu": "Cu.pbe-dn-rrkjus_psl.1.0.0.UPF",
	"Zn": "Zn.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Y": "Y.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Zr": "Zr.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Nb": "Nb.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Mo": "Mo.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Tc": "Tc.pbe-spn-rrkjus_psl.0.3.0.UPF",
	"Ru": "Ru.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Rh": "Rh.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Pd": "Pd.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Ag": "Ag.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Cd": "Cd.pbe-n-rrkjus_psl.1.0.0.UPF",
	"La": "La.pbe-spfn-rrkjus_psl.1.0.0.UPF",
	"Hf": "Hf.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Ta": "Ta.pbe-spfn-rrkjus_psl.1.0.0.UPF",
	"W": "W.pbe-spn-rrkjus_psl.0.2.3.UPF",
	"Re": "Re.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Os": "Os.pbe-spn-rrkjus_psl.1.0.0.UPF",
	"Ir": "Ir.pbe-n-rrkjus_psl.0.2.3.UPF",
	"Pt": "Pt.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Au": "Au.pbe-n-rrkjus_psl.1.0.0.UPF",
	"Hg": "Hg.pbe-n-rrkjus_psl.1.0.0.UPF",
	"H": "H.pbe-rrkjus_psl.1.0.0.UPF",
	"O": "O.pbe-n-rrkjus_psl.1.0.0.UPF",
	"C": "C.pbe-n-rrkjus_psl.1.0.0.UPF"
	}

	structure = Atoms(numbers, positions=coords_arr, cell=axes_arr, magmoms=magnets)

	inputdata = {
	'calculation':'scf',
	'tstress':'.true.',
	'tprnfor':'.true.',
	'tefield':'.true.',
	'dipfield':'.true.',
	'pseudo_dir':'../pseudo',
	'outdir':'./' + sym,
	'prefix': sym + '_beef',
	'ecutwfc':ecutwfc_ry,
	'ecutrho':ecutrho_ry,
	'nosym':'.true.',
	'occupations':'smearing',
	'smearing':'fd',
	'input_dft':'BEEF-vdW',
	'edir':3,
	'emaxpos':0.99,
	'eopreg':0.025,
	'eamp':'0.0D0',
	'conv_thr':0.00001,
	'mixing_beta':0.1,
	'electron_maxstep':500,
	'mixing_mode':'plain',
	'mixing_ndim':10,
	'degauss':'0.01D0',
	'celldm(1)':1.889726
	}

	f = open(filename, "w")

	ase.io.espresso.write_espresso_in(f, structure, input_data=inputdata, pseudopotentials=pseudo, kspacing=None, kpts=kpoints, koffset=(0,0,0))
	f.close()

	replacer(sym,filename)
		


print("Writing qe_run files...")

onlyfiles = []
finalfiles = []
finalfilespt1 = []
finalfilespt2 = []
finalfilespt3 = []
finalfilespt4 = []
finalfilespt5 = []
finalfilespt6 = []
finalfilespt7 = []
finalfilespt8 = []
finalfilespt9 = []
finalfilespt10 = []
finalfilespt11 = []
finalfilespt12 = []
finalfilespt13 = []
finalfilespt14 = []
finalfilespt15 = []
finalfilespt16 = []
finalfilespt17 = []
finalfilespt18 = []
finalfilespt_nonmag = []
finalfilespt_mag = []

magnet_surfaces = ["Mn", "Ni", "Co", "Fe"]
batch1 = ["Pd", "W", "V"]
batch2 = ["Tc", "Ir"]
batch3 = ["Ti", "Re", "Pt"]
batch4 = ["Ag", "Cu", "Ru"]
batch5 = ["Os", "Y", "Nb", "Hg"]
batch6 = ["Mo", "Rh", "Cr","Cd", "Au", "Sc"]
batch7 = ["Hf", "Ta"]
batch8 = ["La"]

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
# filter to get only the output files
for file in onlyfiles:
	sym1 = file[0:find_nth(file,'2',1)]
	sym2 = file[find_nth(file,'2',1)+1:find_nth(file,'2',2)]
	if ".in" in file[-3:]:
		if sym1 not in magnet_surfaces and sym2 not in magnet_surfaces:
			if sym1 in batch8 or sym2 in batch8:
				finalfilespt8.append(file) 
			elif sym1 in batch7 or sym2 in batch7:
				finalfilespt7.append(file) 
			elif sym1 in batch1 or sym2 in batch1: 
				finalfilespt1.append(file) 
			elif sym1 in batch2 or sym2 in batch2: 
				finalfilespt2.append(file) 
			elif sym1 in batch3 or sym2 in batch3: 
				finalfilespt3.append(file) 
			elif sym1 in batch4 or sym2 in batch4: 
				finalfilespt4.append(file) 
			elif sym1 in batch5 or sym2 in batch5:
				finalfilespt5.append(file) 
			elif sym1 in batch6 or sym2 in batch6:  	
				finalfilespt6.append(file) 
		else: #ensure magnet surfaces are last
			if sym1 == "Fe" or sym2 == "Fe":
				if len(finalfilespt12) < 3:
					finalfilespt12.append(file)
				elif len(finalfilespt13) < 3:
					finalfilespt13.append(file)
				elif len(finalfilespt14) < 3:
					finalfilespt14.append(file)
				elif len(finalfilespt15) < 3:
					finalfilespt15.append(file)
				elif len(finalfilespt16) < 3:
					finalfilespt16.append(file)
				elif len(finalfilespt17) < 3:
					finalfilespt17.append(file)
				elif len(finalfilespt18) < 3:
					finalfilespt18.append(file)
			elif sym1 == "Mn" or sym2 == "Mn":
				finalfilespt11.append(file)
			elif sym1 == "Co" or sym2 == "Co":
				finalfilespt10.append(file)
			elif sym1 == "Ni" or sym2 == "Ni":	
				finalfilespt9.append(file)
print("weee" + "\n")



errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
finalfilespt1 = sorted(finalfilespt1)
finalfilespt2 = sorted(finalfilespt2)
finalfilespt3 = sorted(finalfilespt3)
finalfilespt4 = sorted(finalfilespt4)
finalfilespt5 = sorted(finalfilespt5)
finalfilespt6 = sorted(finalfilespt6)
finalfilespt7 = sorted(finalfilespt7)
finalfilespt8 = sorted(finalfilespt8)
finalfilespt9 = sorted(finalfilespt9)
finalfilespt10 = sorted(finalfilespt10)
finalfilespt11 = sorted(finalfilespt11)
finalfilespt12 = sorted(finalfilespt12)
finalfilespt13 = sorted(finalfilespt13)
finalfilespt14 = sorted(finalfilespt14)
finalfilespt15 = sorted(finalfilespt15)
finalfilespt16 = sorted(finalfilespt16)
finalfilespt17 = sorted(finalfilespt17)
finalfilespt18 = sorted(finalfilespt18)
finalfiles_nonmag = finalfilespt1 + finalfilespt2 + finalfilespt3 + finalfilespt4 + finalfilespt5 + finalfilespt6 + finalfilespt7 + finalfilespt8
finalfiles_mag = finalfilespt9 + finalfilespt10 + finalfilespt11 + finalfilespt12 + finalfilespt13 + finalfilespt14 + finalfilespt15 + finalfilespt16 + finalfilespt17 + finalfilespt18
finalfiles = finalfiles_nonmag + finalfiles_mag

print(finalfilespt9)
print(finalfilespt10)
print(finalfilespt11)
print(finalfilespt12)
print(finalfilespt13)
print(finalfilespt14)
print(finalfilespt15)
print(finalfilespt16)
print(finalfilespt17)
print(finalfilespt18)

qe_run_counter = 1
file_counter = 1


while qe_run_counter <= 18:
	job = ""
	for file in finalfiles:
		print(file)
		sym = file[0:file.find('.')]
		outfilename = sym + ".out"
		job2 = ""

		if qe_run_counter == 1:
			if file == finalfilespt1[0]:
				mkdir('./' + today + '_1')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt1[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:  	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt1:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_1/" + file)

		elif qe_run_counter == 2:
			if file == finalfilespt2[0]:
				mkdir('./' + today + '_2')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt2[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt2:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_2/" + file)

		elif qe_run_counter == 3:
			if file == finalfilespt3[0]:
				mkdir('./' + today + '_3')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt3[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt3:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_3/" + file)

		elif qe_run_counter == 4:
			if file == finalfilespt4[0]:
				mkdir('./' + today + '_4')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt4[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt4:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_4/" + file)

		elif qe_run_counter == 5:
			if file == finalfilespt5[0]:
				mkdir('./' + today + '_5')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt5[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt5:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_5/" + file)

		elif qe_run_counter == 6:
			if file == finalfilespt6[0]:
				mkdir('./' + today + '_6')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt6[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt6:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_6/" + file)

		elif qe_run_counter == 7:
			if file == finalfilespt7[0]:
				mkdir('./' + today + '_7')
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt7[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt7:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_7/" + file)

		elif qe_run_counter == 8:
			if file == finalfilespt8[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt8[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt8:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_8/" + file)

		elif qe_run_counter == 9:
			if file == finalfilespt9[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt9[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt9:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_9/" + file)

		elif qe_run_counter == 10:
			if file == finalfilespt10[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt10[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt10:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_10/" + file)

		elif qe_run_counter == 11:
			if file == finalfilespt11[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt11[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt11:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_11/" + file)

		elif qe_run_counter == 12:
			if file == finalfilespt12[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt12[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt12:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_12/" + file)

		elif qe_run_counter == 13:
			if file == finalfilespt13[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt13[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt13:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_13/" + file)

		elif qe_run_counter == 14:
			if file == finalfilespt14[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt14[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt14:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_14/" + file)

		elif qe_run_counter == 15:
			if file == finalfilespt15[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt15[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt15:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_15/" + file)

		elif qe_run_counter == 16:
			if file == finalfilespt16[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt16[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt16:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_16/" + file)

		elif qe_run_counter == 17:
			if file == finalfilespt17[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt17[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt17:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
			shutil.copy(file, "./" + today + "_17/" + file)

		elif qe_run_counter == 18:
			if file == finalfilespt18[0]:
				mkdir('./' + today + '_' + str(qe_run_counter))
				job = \
					"#!/bin/bash" + "\n" + \
					"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
					"#SBATCH --job-name=SCF-" + str(qe_run_counter) + "##CHANGE" + "\n" + \
					"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
					"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
					"#SBATCH --mem-per-cpu=4G" + "\n" + \
					"#SBATCH --out=" + today + "files." + str(qe_run_counter) + ".out     ##CHANGE" + "\n" + \
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
					"module load qe/6.6_openmpi-4.0.3" + "\n" + "\n" + \
					"ulimit -s unlimited" + "\n" + "\n" + \
					"export OMP_NUM_THREADS=1" + "\n" + "\n" + \
					"##cd to working directory" + "\n"
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"

			elif file != finalfilespt18[-1]:
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + " &&\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "\n"
				qe_str = "qe_run_" + today + "_" + str(qe_run_counter) + ".csh"
				h = open(qe_str, "w+")
				h.write(job)
				h.close()
				shutil.copy(qe_str, "./" + today + "_" + str(qe_run_counter) + "/" + qe_str)
				job = ""
				for filename in finalfilespt18:
					job2 += filename + "\n"
				fn_str = "symbols_" + today + "_" + str(qe_run_counter) + ".txt"
				j = open(fn_str, "w+")
				j.write(job2)
				j.close()
				shutil.copy(fn_str, "./" + today + "_" + str(qe_run_counter) + "/" + fn_str)
				qe_run_counter = qe_run_counter + 1
				shutil.copy(file, "./" + today + "_" + str(qe_run_counter-1) + "/" + file)
				break
			shutil.copy(file, "./" + today + "_18/" + file)
	

print("Done. You may now transfer your files.")

