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


blacklist = {'Al', 'Bi', 'Ga', 'In', 'Pb', 'Sn', 'Tl', 'Co6Cr6', 'Co6Mo6', 'Fe6Nb6', 'Fe6Sc6', 'Fe6Ti6', 'Fe6V6', 'Fe6W6', 'Mn6Sc6', 'Mn6Ti6', 'Mn6V6', 'Ni6Ti6', 'Ni6V6'}

ads = pd.read_csv('./ads_energies_bimetallic_O_nomono.csv',delimiter=",")
print(ads)
ads_data = ads.values.tolist()

headers = []
for col in ads.columns:
	headers.append(col)
print(headers)

i = 0

length = len(ads_data)

while i < length:
	name = ads_data[i][1]

	if any([x in name for x in blacklist]):
		ads_data.remove(ads_data[i])
		i = i - 1

	length = len(ads_data)
	i = i + 1 

with open('./ads_energies_bimetallic_O_nomono_clean.csv', 'w') as f:
	writer = csv.writer(f)
	writer.writerow(headers)
	writer.writerows(ads_data)


	
print("Done. Woo.")

