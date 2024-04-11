import numpy as np
import pandas as pd
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter
import matplotlib.pyplot as plt
from scipy.signal import peak_widths
from scipy.signal import find_peaks

sym = ''
errors = [] 
d = []
counter = 1

files = ['ml_data_c.csv','ml_data_h.csv','ml_data_o.csv']
atom = ['C', 'H', 'O']
optimum = [0.5, -0.25, -1.75]
i = 0

for file in files:
	ads = pd.read_csv(file,delimiter=",")

	#ads = ads[ads['surface'].str.contains("12")].reset_index()

	#ads = ads[ads['site'].str.contains("hollow")].reset_index()

	#with pd.option_context('display.max_rows', None,):
	#	print(ads)

	#print(ads)

	GCN_list = []
	GCN = 0 


	x = ads['reaction energy (eV)']

	for k in range(len(x)):
		site = ads.iloc[k,14]
		print(ads.iloc[k,14])
		if 'top' in site:
			GCN = 7.50
		elif 'bridge' in site:
			GCN = 7.33
		elif 'hollow' in site and 'HCP' in site:
			GCN = 7.50
		elif 'hollow' in site and 'FCC' in site:
			GCN = 6.9545454545454545
		elif '4fold' in site:
			GCN = 7.615384615

		GCN_list.append(GCN)

	ads['GCN'] = GCN_list
	'''
	y13 = abs(x-optimum[i])
	ads['abs_values'] = y13
	'''

	#ads = ads.sort_values(by='reaction energy (eV)').reset_index()

	ads.to_csv('updated_v9_'+ file, encoding='utf-8', index=False)

	ads=ads.groupby('surface').head(2).reset_index(drop=True)

	s = ads['Valence Electrons']
	b = ads['Beta']

	ads=ads[['surface', 'lattice_constant_alloy', 'molar_volume_alloy',	'EN_alloy',	'IE_alloy',	'EA_alloy',	'Sublimation Energy',	'd-Band_Center',	'd-Band_Width',	'd-Band_Filling',	'DOS at Fermi Energy',	'Work Function',	'CN', 'GCN', 'Valence Electrons', 'reaction energy (eV)']]


	print('boop')

	#ads.to_csv('updated_v6_'+ file, encoding='utf-8', index=False) #for first one
	ads.to_csv('updated_v10_'+ file, encoding='utf-8', index=False)

	with pd.option_context('display.max_rows', None,):
		print(ads)

	x = ads['reaction energy (eV)']
	
	

	
	y1 = ads['lattice_constant_alloy']
	y2 = ads['molar_volume_alloy']
	y3 = ads['EN_alloy']
	y4 = ads['IE_alloy']
	y5 = ads['EA_alloy']
	y6 = ads['Sublimation Energy']
	y7 = ads['d-Band_Center']
	y8 = ads['d-Band_Width']
	y9 = ads['d-Band_Filling']
	y10 = ads['DOS at Fermi Energy']
	y11 = ads['Work Function']
	y12 = ads['CN']

	#surf = ads['surface']

	

	print(type(s))
	print(type(b))

	psi = (s**2)/(y3**b)
	ads['psi'] = psi

	

	#with pd.option_context('display.max_rows', None,):
	#	print(ads)
	'''

	plt.scatter(x,y1)
	plt.title("Lattice Constant with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y2)
	plt.title("Molar Volume with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y3)
	plt.title("Electronegativity with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y4)
	plt.title("Ionization Energy with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y5)
	plt.title("Electron Affinity with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y6)
	plt.title("Sublimation Energy with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y7)
	plt.title("D-Band Center with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y8)
	plt.title("D-Band Width with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y9)
	plt.title("D-Band Filling with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y10)
	plt.title("DOS at Fermi Energy with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y11)
	plt.title("Work Function with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()

	plt.scatter(x,y12)
	plt.title("Coordination Number with " + atom[i])
	plt.xlim([-5, 10])
	plt.show()
	

	
	
	plt.scatter(psi,x)
	plt.title("Linear Scaling Plot with " + atom[i])
	plt.xlim([0, 70])
	'''
	
	y14 = y7 + (y8/2)

	#ads['d band stuff'] = y14

	plt.scatter(x,y14)
	plt.title("AdsE vs d-band center and filling " + atom[i])
	#plt.xlim([-5, 7])
	'''
	'''
	'''

	y15 = ads['Valence Electrons']
	plt.scatter(x,y15)
	plt.title("AdsE vs Valence Electrons " + atom[i])
    '''

	'''
	plt.scatter(psi,y7)
	plt.title("Psi and dbc " + atom[i])
	plt.xlim([0, 70])
	'''

	'''
	if i == 0:
		plt.xlim([-0.5,6.5])
	elif i == 1:
		plt.xlim([-1.5,1])
	elif i == 2:
		plt.xlim([-4,3])
	'''

	labels = ads.index

	#labels = ads['surface']

	##points = ads[['surface','psi','reaction energy (eV)']]
	#with pd.option_context('display.max_rows', None,):
	#	print(points)

	'''
	for j,label in enumerate(labels):
		label = label[:-2]
		plt.annotate(label,(psi[j], x[j]),textcoords = "offset points",xytext=(2,2))

	j = 0
	'''
	
	plt.show()

	ads.to_csv('updated_v4_' + file, encoding='utf-8', index=False)
	
	df = pd.DataFrame()
	df['surface'] = labels
	df['rxn energy'] = ads['reaction energy (eV)'].values
	df['valence electrons'] = ads['Valence Electrons'].values
	
	df.to_csv('./valen_vs_adsE_BI_from_' + file, encoding='utf-8', index=False)
	

	

	#ads = ads.drop("reaction energy (eV)",axis=1)
	#ads = ads.drop("site", axis=1)
	#ads = ads.drop("Beta", axis=1)
	#ads = ads.drop("psi", axis=1)
	#ads = ads.drop("EA_alloy", axis=1)
	#ads = ads.drop("lattice_constant_alloy", axis=1)
	#ads = ads.drop("molar_volume_alloy", axis=1)

	matrix = ads.corr()
	print("Correlation matrix of {}:".format(atom[i]))
	with pd.option_context('display.max_columns', None,):
		print(matrix)
	plt.matshow(matrix)
	plt.colorbar()
	plt.show()
	

	i = i + 1