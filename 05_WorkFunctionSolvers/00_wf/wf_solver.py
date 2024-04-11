import numpy as np
import pandas as pd
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter
import matplotlib.pyplot as plt
from scipy.signal import peak_widths
from scipy.signal import find_peaks

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
    finalfiles = ['symbols_2022June23_00.txt']
            
    for file in finalfiles:
        f = open(file, "r")
        file_list = f.read().splitlines() 
        for alloy in file_list:
            alloy = alloy[:-3]
            alloy_list.append(alloy)

    file_count = finalfiles[0][-6:-4]

    return alloy_list, file_count


def get_wf(x,y):
    left = y[np.array(x)<=0.20]
    right = y[np.array(x)>=0.80]
    together = np.concatenate((left,right),axis=0)

    wf = np.average(together)

    return wf






sym = ''
errors = [] 
d = []
counter = 1
#change metals to available alloys (use text files as reference)
[alloys, fc] = get_alloys() #insert important stuff here

workbook = xlsxwriter.Workbook("wf_" + str(fc) + ".xlsx")
worksheet = workbook.add_worksheet()
worksheet.write(0, 0, 'Alloy')
worksheet.write(0, 1, 'Workfunction')

#if 'something' in alloys:
#   alloys.remove('something')

for sym in alloys:

    data_arr = np.genfromtxt(sym + '-avg.dat',skip_header=1,invalid_raise=False) 
    data_arr = data_arr[~np.isnan(data_arr).any(axis=1),:] #removes NaNs
    #print(data_arr)
    #print(data_arr.shape)

    fe = fermi(sym + '-750.out')

    z = data_arr[:,0]
    #print(z)
    c = data_arr[-1,0]
    z_frac = z/c
    plan = np.dot(data_arr[:,1],13.6056980659) - fe #planar average potential
    mac = np.dot(data_arr[:,2],13.6056980659) - fe

    wf = get_wf(z_frac,plan)


    #plt.scatter(z_frac,plan)
    #plt.show()

    worksheet.write(counter, 0, sym)
    worksheet.write(counter, 1, wf)
    counter += 1

    wf = float("NaN")

workbook.close()
