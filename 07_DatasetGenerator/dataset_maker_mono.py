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

def find_nth(string,substring,n):
    if n == 1:
        return string.find(substring)
    else:
        return string.find(substring, find_nth(string, substring, n - 1) + 1)

def distance(arr1,arr2):

    x1 = float(arr1[0])
    x2 = float(arr2[0])
    y1 = float(arr1[1])
    y2 = float(arr2[1])
    z1 = float(arr1[2])
    z2 = float(arr2[2])

    dist = (x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2
    dist = dist**(0.5) 
    return dist


def find_farthest(A,B,coords_arr,symbols,top):
    second_layer = coords_arr[4:8] 
    third_layer = coords_arr[8:]
    ads_site = ''
    max_dist = 0
    max_dist_2 = 0
    max_i = -1
    max_i_2 = -1

    if top == 0:
        ads_site = third_layer[0]
        #print('Top at: ')
        #print(symbols[8])
    elif top == 1:
        max_i = 2 #temp
        return(max_i)
        #print('Top at: ')
        #print(symbols[10])
    else:
        return 

    i = 0

    while i <= 3:
        dist = distance(second_layer[i], ads_site)
        if dist >= max_dist:
            max_dist_2 = max_dist
            max_i_2 = max_i
            max_dist = dist
            max_i = i
        i = i + 1

    return max_i


def get_site(name,top,finalfiles):

    name = name[:-2]

    file = ""

    file = "#" + name + ".txt"

    an = pyasl.AtomicNo()

    fileScan = open(file, "r")
    max_i = 999
    relevant_symbols = []
    relevant_coords = []
    
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
    
    symbols = [name]*12

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

    #SEPARATION OF RELEVANT SYMBOLS AND COORDINATES
    #functions to indicate what to kick out

    if name == 'Pt' or name == 'Ir':
        coords_orient = 'B'
    elif name == 'Hf' or name == 'Cu' or name == 'Nb':
        coords_orient = 'H'
    elif name == 'La' or name == 'Ta':
        coords_orient = 'I'
    elif name == 'Ni':
        coords_orient = 'J'
    elif name == 'Co' or name == 'Os' or name == 'Ru':
        coords_orient = 'K'
    else:
        coords_orient = 'G'

    if coords_orient == 'B':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[8],symbols[9]]
            relevant_coords = [coords_arr[8],coords_arr[9]]
            indices = [9, 10]
        elif site_index == 3:
            relevant_symbols = [symbols[8], symbols[9], symbols[11]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
            indices = [9, 10, 12]
        elif site_index == 4:
            relevant_symbols = [symbols[9], symbols[10], symbols[11]]
            relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
            indices = [10, 11, 12]
        else:
            print('ERROR')
    elif coords_orient == 'G':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[10],symbols[11]]
            relevant_coords = [coords_arr[10],coords_arr[11]]
            indices = [11, 12]
        elif site_index == 3:
            relevant_symbols = [symbols[8], symbols[9], symbols[11]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
            indices = [10, 11, 12]
        elif site_index == 4:
            relevant_symbols = [symbols[8], symbols[9], symbols[10]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
            indices = [9, 10, 11]
        else:
            print('ERROR')
    elif coords_orient == 'H':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[9],symbols[11]]
            relevant_coords = [coords_arr[9],coords_arr[11]]
            indices = [10, 12]
        elif site_index == 3:
            relevant_symbols = [symbols[9], symbols[10], symbols[11]]
            relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
            indices = [10, 11, 12]
        elif site_index == 4:
            relevant_symbols = [symbols[8], symbols[9], symbols[10]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
            indices = [9, 10, 11]
        else:
            print('ERROR')

    elif coords_orient == 'I':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[9],symbols[10]]
            relevant_coords = [coords_arr[9],coords_arr[10]]
            indices = [10, 11]
        elif site_index == 3:
            relevant_symbols = [symbols[8], symbols[9], symbols[10]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
            indices = [9, 10, 11]
        elif site_index == 4:
            relevant_symbols = [symbols[8], symbols[9], symbols[11]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
            indices = [9, 10, 12]
        else:
            print('ERROR')

    elif coords_orient == 'J':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[8],symbols[9]]
            relevant_coords = [coords_arr[8],coords_arr[9]]
            indices = [9, 10]
        elif site_index == 3:
            relevant_symbols = [symbols[8], symbols[9], symbols[10]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
            indices = [9, 10, 11]
        elif site_index == 4:
            relevant_symbols = [symbols[9], symbols[10], symbols[11]]
            relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
            indices = [10, 11, 12]
        else:
            print('ERROR')

    elif coords_orient == 'K':
        if site_index == 1:
            relevant_symbols = [symbols[8]]
            relevant_coords = coords_arr[8]
            indices = [9]
        elif site_index == 2:
            relevant_symbols = [symbols[10],symbols[11]]
            relevant_coords = [coords_arr[10],coords_arr[11]]
            indices = [11, 12]
        elif site_index == 3:
            relevant_symbols = [symbols[8], symbols[10], symbols[11]]
            relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
            indices = [9, 11, 12]
        elif site_index == 4:
            relevant_symbols = [symbols[8], symbols[9], symbols[10]]
            relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
            indices = [9, 10, 11]
        else:
            print('ERROR')

    return [relevant_symbols, relevant_coords, indices]
    #print(relevant_symbols)
    #print(relevant_coords)


def get_neighbors(name,top,finalfiles):
    file = ""

    name = name[:-2]

    file = "#" + name + ".txt"

    an = pyasl.AtomicNo()

    fileScan = open(file, "r")
    max_i = 999
    relevant_symbols = []
    relevant_coords = []
    indices = [5, 6, 7, 8, 9, 10, 11, 12]
    
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
    
    symbols = [name]*12

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

    #SEPARATION OF RELEVANT SYMBOLS AND COORDINATES
    #functions to indicate what to kick out
    relevant_symbols = symbols[4:]
    relevant_coords = coords_arr[4:]

    '''

    if top != 999:
        max_i = find_farthest(A,B,coords_arr,symbols,top) #e.g. max_1 = 4 --> 5th atom
        
        del relevant_symbols[max_i]
        del relevant_coords[max_i]
        del indices[max_i]
    '''

    return [relevant_symbols, relevant_coords, indices]
    #print(relevant_symbols)
    #print(relevant_coords)

def ap_solver(name,site_symbols,site_indices):

    name = name[:-2]
    
    lattice_constant = 0
    molar_volume = 0

    #atomic property dataframe
    atoms = pd.read_csv('./mono_data.csv',delimiter=",")
    #print(atoms)

    atoms_data = atoms.values.tolist()
    i = 0

    while i < len(atoms_data):
        if atoms_data[i][0] == name:
            molar_volume = atoms_data[i][5]
            lattice_constant = atoms_data[i][6]
        i = i + 1 
    
    return lattice_constant, molar_volume

def elec_solver(name,neighbor_symbols,neighbor_indices):
    
    name = name[:-2]

    EN = 0
    IE = 0
    EA = 0
    sub_e = 0
    valen = 0
    beta = 0

    
    #atomic property dataframe
    atoms = pd.read_csv('./mono_data.csv',delimiter=",")
    #print(atoms)

    atoms_data = atoms.values.tolist()
    i = 0

    while i < len(atoms_data):
        if atoms_data[i][0] == name:
            EN = atoms_data[i][1]
            IE = atoms_data[i][2]
            EA = atoms_data[i][3]
            sub_e = atoms_data[i][4]
            valen = atoms_data[i][7]
            beta = atoms_data[i][8]
        i = i + 1           

    return EN, IE, EA, sub_e, valen, beta

#START

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
blacklist = {'Al', 'Bi', 'Ga', 'In', 'Pb', 'Sn', 'Tl', 'C', 'H', 'O', 'N', 'S'}
# filter to get only the output files
for file in onlyfiles:
    if "#" in file[0] and any([x not in file for x in blacklist]):
        finalfiles.append(file)

print("Reading metals...")

#adsorbate dataframe
ads = pd.read_csv('./ads_energies_mono_O.csv',delimiter=",")
#print(ads)
ads_data = ads.values.tolist()
ads_symbol_list = []
ads_index_list = []
ads_nn_symbol_list = []
ads_nn_index_list = []
CN_list = []
GCN_list = []
#print(len(ads_data))

print("Disecting adsorption site data...")

i = 0

while i < len(ads_data):
    #print(ads_data[i][1]) #symbols
    #print(ads_data[i][3]) #site
    name = ads_data[i][1]
    site = ads_data[i][3]
    A = ""
    B = ""
    top = 999
    site_index = 0
    CN = 0
    GCN = 0

    if "top" in site and "A" in site:
        top = 0
        CN = 1
        GCN = 7.5
        site_index = 1
    elif "bridge" in site and "A_A|A" in site:
        CN = 2
        GCN = 7.33
        site_index = 2
    elif "hollow" in site and "A_A_A|HCP" in site:
        CN = 3
        GCN = 7.50
        site_index = 3
    elif "hollow" in site and "A_A_A|FCC" in site:
        CN = 3
        GCN = 6.9545454545454545
        site_index = 4

    [site_symbols, site_coords, site_indices] = get_site(name,site_index,finalfiles)

    [neighbor_symbols, neighbor_coords, neighbor_indices] = get_neighbors(name,top,finalfiles)

    CN_list.append(CN)
    GCN_list.append(GCN)

    ads_symbol_list.append(site_symbols)
    ads_index_list.append(site_indices)

    ads_nn_symbol_list.append(neighbor_symbols)
    ads_nn_index_list.append(neighbor_indices)
    i = i + 1 

ads['ads_site'] = ads_symbol_list
ads['ads_indices'] = ads_index_list
ads['ads+neighbors_site'] = ads_nn_symbol_list
ads['ads+neighbors_indices'] = ads_nn_index_list
ads['CN'] = CN_list
ads['GCN'] = GCN_list

#print(ads)

print("Calculating metal properties...")

ads_data = ads.values.tolist()

i = 0

lattice_constant_list = []
molar_volume_list = []
EN_list = []
IE_list = []
EA_list = []
sub_e_list = []
valen_list = []
beta_list = []

while i < len(ads_data):
    name = ads_data[i][1]
    site_symbols = ads_data[i][5]
    site_indices = ads_data[i][6]
    neighbor_symbols = ads_data[i][7]
    neighbor_indices = ads_data[i][8]
    A = ""
    B = ""
    top = 999

    print(name)

    [lattice_constant, molar_volume] = ap_solver(name,site_symbols,site_indices)
    [EN, IE, EA, sub_e, valen, beta] = elec_solver(name,site_symbols,site_indices)

    ''''
    print(lattice_constant)
    print(molar_volume)
    print(EN)
    print(IE)
    print(EA)
    print(sub_e)
    print(valen)
    '''

    lattice_constant_list.append(lattice_constant)
    molar_volume_list.append(molar_volume)
    EN_list.append(EN)
    IE_list.append(IE)
    EA_list.append(EA)
    sub_e_list.append(sub_e)
    valen_list.append(valen)
    beta_list.append(beta)

    i = i + 1 

ads['lattice_constant_alloy'] = lattice_constant_list
ads['molar_volume_alloy'] = molar_volume_list
ads['EN_alloy'] = EN_list
ads['IE_alloy'] = IE_list
ads['EA_alloy'] = EA_list
ads['Sublimation Energy'] = sub_e_list
ads['Valence Electrons'] = valen_list
ads['Beta'] = beta_list
ads.to_csv('./ads_extracted_energies_mono_O_v2.csv', encoding='utf-8', index=False)

#------------------- SUM PDOS
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
print("Done. Woo.")
