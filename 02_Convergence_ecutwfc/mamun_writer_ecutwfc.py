import ase
from ase import Atoms
from ase import io
from ase.io import espresso
import numpy as np
import pandas as pd
import os
from os import listdir
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
	    "Fe": 20, #1.25
	    "Co": 17, 
	    "Ni": 9,
	    "Mn": 15	 #0.9
	}

	return switcher.get(symbol, "nothing")

filecounter = 1

today = '2022June18'

an = pyasl.AtomicNo()

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
# filter to get only the output files
for file in onlyfiles:
	if "#" in file[0]:
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
		else:
			symbols = [sym]*12

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
	ecutwfc = 500
	
	while ecutwfc <= 1000:
		filecounter = filecounter + 1

		ecutwfc_ry = ecutwfc*0.0734986176495
		ecutrho_ry = ecutwfc_ry*10
	
		filename = sym + "-" + str(ecutwfc) + ".in"
		outfilename = sym + "-" + str(ecutwfc) + ".out"
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
		"Fe": "Fe.pbe-spn-rrkjus_psl.1.0.0.UPF",
		"Co": "Co.pbe-spn-rrkjus_psl.0.3.1.UPF",
		"Ni": "Ni.pbe-spn-rrkjus_psl.1.0.0.UPF",
		"Cu": "Cu.pbe-dn-rrkjus_psl.1.0.0.UPF",
		"Zn": "Zn.pbe-dnl-rrkjus_psl.1.0.0.UPF",
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

		if sym == "Fe" or sym == "Co":
			inputdata = {
			'calculation':'scf',
			'tstress':'.true.',
			'tprnfor':'.true.',
			'tefield':'.true.',
			'dipfield':'.true.',
			'pseudo_dir':'../pseudo',
			'outdir':'./' + sym + str(ecutwfc),
			'prefix': sym + str(ecutwfc) + '_beef',
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
			'degauss':'0.01D0'
			}
		else:
			inputdata = {
			'calculation':'scf',
			'tstress':'.true.',
			'tprnfor':'.true.',
			'tefield':'.true.',
			'dipfield':'.true.',
			'pseudo_dir':'../pseudo',
			'outdir':'./' + sym + str(ecutwfc),
			'prefix': sym + str(ecutwfc) + '_beef',
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
		
		ecutwfc = ecutwfc + 50

print("Writing qe_run files...")

ecutwfc_list = [500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000]

onlyfiles = []
finalfiles = []
finalfilespt2 = []
finalfilespt3 = []
finalfilespt4 = []
finalfilespt5 = []
magnet_surfaces = ["Mn", "Ni", "Co", "Fe"]
onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
# filter to get only the output files
for file in onlyfiles:
	sym = file[0:file.find('-')]
	if ".in" in file[-3:] and sym not in magnet_surfaces:
		finalfiles.append(file)
	elif ".in" in file[-3:] and sym in magnet_surfaces: #ensure magnet surfaces are last
		if sym == "Mn" or sym == "Co":
			if sym == "Co":
				finalfilespt2.append(file) #Co
			else:
				finalfilespt3.append(file) #Mn
		else:
			if sym == "Fe":
				finalfilespt4.append(file) #Fe
			else:
				finalfilespt5.append(file) #Ni
errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
finalfiles = sorted(finalfiles)
finalfiles = finalfiles + finalfilespt2 + finalfilespt3 + finalfilespt4 + finalfilespt5
print(finalfiles)

qe_run_counter = 1

for ecut in ecutwfc_list:
	job = ""

	job = \
			"#!/bin/bash" + "\n" + \
			"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
			"#SBATCH --job-name=ECUT-" + str(ecut) + "##CHANGE" + "\n" + \
			"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
			"#SBATCH --ntasks-per-node=37           ##CHANGE" + "\n" + \
			"#SBATCH --mem-per-cpu=4G" + "\n" + \
			"#SBATCH --out=" + today + "files." + str(int(((ecut-500)/50)+1)) + ".out     ##CHANGE" + "\n" + \
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

	for file in finalfiles:
		sym = file[0:file.find('-')]
		ecut_counter = int(file[file.find('-')+1:file.find('.')])
		outfilename = sym + "-" + str(ecut_counter) + ".out"

		if ecut_counter == ecut:
			if sym != "Ni":
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "  && ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
			else:    	
				job += "mpirun -np 37 pw.x -i " + file + " > " + outfilename + "   ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
				h = open("qe_run_" + today + "_" + str(ecut) + ".csh", "w+")
				h.write(job)
				h.close()
	qe_run_counter = qe_run_counter + 1

print("Done. You may now transfer your files.")




'''
	if filecounter % 4 == 1:
		job = \
			"#!/bin/bash" + "\n" + \
			"#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
			"#SBATCH --job-name=SLAB-" + str(math.floor((filecounter/4))+1) + "##CHANGE" + "\n" + \
			"#SBATCH --nodes=1         ##CHANGE" + "\n" + \
			"#SBATCH --ntasks-per-node=26           ##CHANGE" + "\n" + \
			"#SBATCH --mem-per-cpu=4G" + "\n" + \
			"#SBATCH --out=" + today + "files." + str(math.floor((filecounter/4))+1) + ".out     ##CHANGE" + "\n" + \
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
		job += "mpirun -np 26 pw.x -npool 2 -i " + filename + " > " + outfilename + "  && ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
	elif filecounter % 4 == 0:
		job += "mpirun -np 26 pw.x -npool 2 -i " + filename + " > " + outfilename + "   ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
		h = open("qe_run_" + today + "_" + str(int(filecounter/4)) + ".csh", "w+")
		h.write(job)
		h.close()
		job = ""
	elif filecounter == 24:
		job += "mpirun -np 26 pw.x -npool 2 -i " + filename + " > " + outfilename + "   ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
		h = open("qe_run_" + today + "_6.csh", "w+")
		h.write(job)
		h.close()
		job = ""
	else:
		job += "mpirun -np 26 pw.x -npool 2 -i " + filename + " > " + outfilename + "  && ##   mpirun -np XX pw.x -i input_file > output_file" + "\n"
		
'''
