from ase import Atoms
from ase import io
from ase.io import iread
from ase.visualize import view
import numpy as np
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter

#fileScan = open("138315243755384596184917576.log", "r")

filecounter = 0

workbook = xlsxwriter.Workbook("Mamun.xlsx")
worksheet = workbook.add_worksheet()
worksheet.write(0, 0, 'Filename')
worksheet.write(0, 1, 'Name')
worksheet.write(0, 2, 'Kind')
worksheet.write(0, 3, 'Energy')
worksheet.write(0, 4, 'Percent A')
worksheet.write(0, 5, 'File Number')

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
# filter to get only the output files
for file in onlyfiles:
    if ".log" in file:
        finalfiles.append(file)
for file in finalfiles:
    fileScan = open(file, "r")
    filecounter = filecounter + 1
    #print(file)
    print(filecounter)

    energies = []
    x = 0
    y = 0
    crystal_axes = []
    coordinates = []
    symbols = []
    sym1_counter = 0
    sym2_counter = 0
    kind = ""
    atomspercell = 0
    pA = -100

    for line in fileScan:
    	if 'crystal axes:' in line:
    		#print(line)
    		x = x + 1
    	elif x > 0 and x < 4:

    		l = float(line[-36:-27].strip(" "))
    		m = float(line[-27:-16].strip(" "))
    		n = float(line[-15:-4].strip(" "))

    		crystal_axes.append([l, m, n])

    		x = x + 1

    	if 'number of atoms/cell' in line:
    		atomspercell = int(line[-3:-1])

    		if atomspercell == 12:
    			kind = "Surface"
    		elif atomspercell == 4 or atomspercell == 2:
    			kind = "Bulk"
    		else: 
    			kind = "Gas"

    	if 'site n.' in line or (y > 0 and y <= atomspercell):	
    		a = line[-39:-28].strip(" ")
    		b = line[-27:-16].strip(" ")
    		c = line[-15:-3].strip(" ")

    		if y > 0 and y <= atomspercell:
    			a = float(a)
    			b = float(b)
    			c = float(c)
    			coordinates.append([a, b, c])

    			symbol = line[18:25].strip(" ")
    			symbol = ''.join([i for i in symbol if not i.isdigit()])

    			if symbol not in symbols:
    				symbols.append(symbol)
    				if len(symbols) == 1:
    					sym1_counter = sym1_counter + 1
    				elif len(symbols) == 2:
    					sym2_counter = sym2_counter + 1
    			else:
    				if symbol == symbols[0]:
    					sym1_counter = sym1_counter + 1
    				elif symbol == symbols[1]:	
    					sym2_counter = sym2_counter + 1

    		y = y + 1
    	if '!' in line:
    		energies.append(line[line.find('.')-1:line.find('Ry')])

    if "H" in symbols or "C" in symbols or "N" in symbols or "S" in symbols or "O" in symbols:
    	print("yeet")
    	print(symbols)
    	kind = "Gas"

    try:
    	if len(symbols) == 1:
    		name = symbols[0]
    		pA = 100
    	elif len(symbols) == 2:
    		name = symbols[0] + str(sym1_counter) + symbols[1] + str(sym2_counter) 
    		pA = sym1_counter / (sym1_counter + sym2_counter) * 100
    	elif len(symbols) == 3:
    		name = symbols[0] + symbols[1] + symbols[2]
    	coordinates = np.array(coordinates)
    	crystal_axes = np.array(crystal_axes)
    	if kind == "Surface":
    		if energies[-1] == 'E':
    			final_energy = float(energies[-2])
    		else:
    			final_energy = float(energies[-1])
    	elif kind == "Bulk":
    		if energies[-1] == 'E':
    			final_energy = float(energies[-2])
    		else:
    			final_energy = float(energies[-1])
    except:
    	print("Error1 at {}".format(file))

    try:
    	worksheet.write(filecounter, 0, file)
    	worksheet.write(filecounter, 1, name)
    	worksheet.write(filecounter, 2, kind)
    	worksheet.write(filecounter, 3, final_energy)
    	worksheet.write(filecounter, 4, pA)
    	worksheet.write(filecounter, 5, filecounter)
    	#print(type(final_energy))
    	#print(coordinates.shape)
    	#print(crystal_axes.shape)
    	#print(name)
    	#print(kind)
    except:
    	print("Error2 at {}".format(file))

    #print("xxxxxx")
workbook.close()
print(len(finalfiles))
