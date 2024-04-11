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
import pandas as pd
import glob

file1 = 'ads_extracted_energies_mono_C_v2.csv'
file2 = 'ads_extracted_energies_mono_H_v2.csv'
file3 = 'ads_extracted_energies_mono_O_v2.csv'

finalfile = 'ads_extracted_energies_mono_COMBINED_v2.csv'

#files = os.path.join(file1, file2, file3)

#print(files)

#files = glob.glob(files)

df = pd.concat(map(pd.read_csv,([file1, file2, file3])), ignore_index=True)

df = df[['adsorbate', 'surface', 'lattice_constant_alloy', 'molar_volume_alloy', 'EN_alloy', 'IE_alloy', 'EA_alloy', 'Sublimation Energy', 'CN','GCN','Valence Electrons','reaction energy (eV)','site','Beta','S. designation', 'ads_site', 'ads_indices', 'ads+neighbors_site', 'ads+neighbors_indices']]
print(df)

df.to_csv(finalfile, encoding='utf-8', index=False)

	
print("Done. Woo.")

