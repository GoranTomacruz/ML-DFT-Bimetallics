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

files = ['updated_v11_ml_data_complete.csv']
atom = ['C', 'H', 'O']
optimum = [0.5, -0.25, -1.75]
i = 0

for file in files:
	ads = pd.read_csv(file,delimiter=",")

	#Mono
	#ads = ads[ads['surface'].str.contains("Pt")]
	ads = ads.sort_values(by='reaction energy (eV)')
	#ads=ads.groupby('surface').head(1).reset_index(drop=True)

	#ads = ads[ads['site'].str.contains("hollow")].reset_index()

	#with pd.option_context('display.max_rows', None,):
	#	print(ads)

	print(ads)

	GCN_list = []
	GCN = 0 


	x = ads['reaction energy (eV)']


	s = ads['Valence Electrons']
	b = ads['Beta']

	ads=ads[['surface', 'lattice_constant_alloy', 'molar_volume_alloy',	'EN_alloy',	'IE_alloy',	'EA_alloy',	'Sublimation Energy',	'd-Band_Center',	'd-Band_Width',	'd-Band_Filling',	'DOS at Fermi Energy',	'Work Function',	'CN', 'GCN', 'Valence Electrons', 'reaction energy (eV)']]
	
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
	y13 = ads['GCN']
	y14 = ads['Valence Electrons']
	y15 = y7 + (y8/2)

	psi = (s**2)/(y3**b)
	ads['psi'] = psi

	print(x.values)
	print(type(x.values))

	
	
	if i == 0:
		plt.xlim([-0.5,6.5])
	elif i == 1:
		plt.xlim([-1.5,1])
	elif i == 2:
		plt.xlim([-4,3])

	plt.scatter(psi,y7)
	plt.title("Electronic descriptor psi vs d-band center")
	plt.xlim([0, 70])
	plt.show()
	saving_array = np.empty((len(y1),3),dtype='U32')
	saving_array[:,0] = psi.values
	saving_array[:,1] = y7.values
	saving_array[:,2] = ads['surface'].values
	np.savetxt("All_Electronic descriptor psi vs d-band center.csv", saving_array, delimiter=',', header='Psi, d-Band_Center, Surface', comments='', fmt='%s,%s,%s')

	plt.scatter(psi,y15)
	plt.title("Electronic descriptor psi vs d-band upper edge")
	plt.xlim([0, 70])
	plt.show()
	saving_array = np.empty((len(y1),3),dtype='U32')
	saving_array[:,0] = psi.values
	saving_array[:,1] = y15.values
	saving_array[:,2] = ads['surface'].values
	np.savetxt("All_Electronic descriptor psi vs d-band upper edge.csv", saving_array, delimiter=',', header='Psi, d-Band_Upper Edge, Surface', comments='', fmt='%s,%s,%s')
	
	i = i + 1