import numpy as np
import pandas as pd
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter

def fermi(file):
    h = open(file, "r")
    for line in h:
        if 'Fermi energy' in line:
            fe = float(line[28:36])
    return fe

def get_alloys():
    alloy_list = []
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    finalfiles = []
    # filter to get only the output files
    for file in onlyfiles:
        if ".txt" in file and "symbols" in file[0:7]:
            finalfiles.append(file)
            
    for file in finalfiles:
        f = open(file, "r")
        file_list = f.read().splitlines() 
        for alloy in file_list:
            alloy = alloy[:-3]
            alloy_list.append(alloy)

    file_count = finalfiles[0][-6:-4]

    return alloy_list, file_count

def dos_variables(d_arr,sym):
    off_range = ''
    x = 0

    data = np.zeros([len(d_arr),7])

    fermi_energy = fermi('./' + sym + '.out')

    data[:,0] = d_arr[:,0] - fermi_energy  # energy (eV) wrt to Fermi
    if len(d_arr[0]) == 3: 
        data[:,1] = d_arr[:,1]  # DOS at E-Ef
    elif len(d_arr[0]) == 4: 
        data[:,1] = d_arr[:,1] + d_arr[:,2]  # DOS at E-Ef (net for magnetic surfaces)
    else: 
        print('Error at: {}.dos.out'.format(sym))


    for x in range(len(data[:,0])):
        if abs(data[x,0]) <= 0.0005:
            break

    dos = data[x,1]

    print("DOS: {},".format(dos))
    print("\n")

    return dos
   

def pdos_variables(d_arr,sym):
    off_range = ''
    x = 0

    data = np.zeros([len(d_arr),7])

    fermi_energy = fermi('./' + sym + '.out')

    data[:,0] = d_arr[:,0] - fermi_energy  # energy (eV) wrt to Fermi
    data[:,1] = d_arr[:,1]  # PDOS at E

    for x in range(len(data[:,0])):
        if data[x,0] + fermi_energy  >= fermi_energy:
            break

    d_band_center = sum(data[:,1]*data[:,0]) / sum(data[:,1])

    data[:,2] = d_arr[:,1] * (d_arr[:,0]-d_band_center)**1
    data[:,3] = d_arr[:,1] * (d_arr[:,0]-d_band_center)**2
    data[:,4] = d_arr[:,1] * (d_arr[:,0]-d_band_center)**3
    data[:,5] = d_arr[:,1] * (d_arr[:,0]-d_band_center)**4
    data[:x,6] = d_arr[:x,1] * (d_arr[:x,0]-d_band_center)**0

    moment_0 =  sum(data[:,6]) / sum(data[:,1])
    moment_1 =  sum(data[:,2]) / sum(data[:,1])
    moment_2 =  sum(data[:,3]) / sum(data[:,1])
    moment_3 =  sum(data[:,4]) / sum(data[:,1])
    moment_4 =  sum(data[:,5]) / sum(data[:,1])

    d_band_filling = moment_0
    width = moment_2**(1/2)
    #Read Xin's Paper for d-band kurtosis and the other thing

    print("d-Band Center: {},".format(d_band_center))
    print("d-Band Width: {},".format(width))
    print("d-Band Filling: {}".format(d_band_filling))
    print("\n")

    if d_band_filling < 0 or d_band_filling > 1:
        off_range = sym

    return off_range, d_band_center, width, d_band_filling



sym = ''
errors = [] 
d = []
counter = 1
#change metals to available alloys (use text files as reference)
[alloys, fc] = get_alloys() #insert important stuff here
adsorption_sites = ['4fold-A_A_B_B','bridge-A_A-A','bridge-A_A-B','bridge-A_B-A','bridge-A_B-B','bridge-B_B-A','bridge-B_B-B','hollow-A_A_A-FCC','hollow-A_A_A-HCP','hollow-A_A_B-FCC','hollow-A_A_B-HCP','hollow-A_B_B-FCC','hollow-A_B_B-HCP','top-A','top-B'] #insert adsorption sites here

workbook = xlsxwriter.Workbook("D-Band Data_" + str(fc) + ".xlsx")
worksheet = workbook.add_worksheet()
worksheet.write(0, 0, 'Metal')
worksheet.write(0, 1, 'D-Band Center')
worksheet.write(0, 2, 'D-Band Width')
worksheet.write(0, 3, 'D-Band Filling')
worksheet.write(0, 4, 'Adsorption Site')
worksheet.write(0, 5, 'DOS at Fermi Energy')


#if 'something' in alloys:
#   alloys.remove('something')

for sym in alloys:

    d_arr_2 = np.genfromtxt(sym + '.dos.out',skip_header=1,invalid_raise=False) #Change File Name
    d_arr_2 = d_arr_2[~np.isnan(d_arr_2).any(axis=1),:]
    print("DOS at Fermi Energy of {}: ".format(sym))

    dos = dos_variables(d_arr_2,sym)

    #Change to different combinations
    for site in adsorption_sites:
        path = sym + '_' + site + '_(d).dat'
        if isfile(path):   
            d_arr = np.genfromtxt(sym + '_' + site + '_(d).dat',skip_header=1,invalid_raise=False) #Change File Name
            d_arr = d_arr[~np.isnan(d_arr).any(axis=1),:]
            print(sym)
            print("D orbitals in {}: ".format(site))

            off, dbc, dbw, dbf = pdos_variables(d_arr,sym)
        
            site_text = site.replace('-','|')

            worksheet.write(counter, 0, sym)
            worksheet.write(counter, 1, dbc)
            worksheet.write(counter, 2, dbw)
            worksheet.write(counter, 3, dbf)
            worksheet.write(counter, 4, site_text)
            worksheet.write(counter, 5, dos)
            counter += 1

    d_arr_2 = []
    dos = float("NaN")

workbook.close()
