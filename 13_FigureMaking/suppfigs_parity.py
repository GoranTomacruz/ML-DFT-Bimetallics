from os import listdir
from os import mkdir
from os.path import isfile, join
import csv
import sys
import shutil
import os

import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

adsorbates = ['C', 'H', 'O']
regression = 'ANN'

#workbook = xlsxwriter.Workbook(regression + "_regression_results_v9.4_STAGE-2-FINAL-decoded.xlsx")

for adsorbate in adsorbates:
    print("Doing " + adsorbate + "...")

    onlyfiles = []
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    train_files = []
    test_files = []
    # filter to get only the output files
    for file in onlyfiles:
        if "y-train" in file and regression in file and adsorbate in file:
            train_files.append(file)
        elif "y_" in file and regression in file and adsorbate in file:
            test_files.append(file)

    print(train_files)
    print(test_files)

    for count, file in enumerate(train_files):
        # read data file
        y_train_pd = pd.read_csv(train_files[count], skiprows=0).values
        y_test_pd = pd.read_csv(test_files[count], skiprows=0).values

        y_train = y_train_pd[:,0]
        y_test = y_test_pd[:,0]
        predicted_y_train = y_train_pd[:,1]
        predicted_y_test = y_test_pd[:,1]

        print(y_train)
        print(y_train.shape)
        print(y_test)
        print(y_test.shape)
        print(predicted_y_train)
        print(predicted_y_train.shape)
        print(predicted_y_test)
        print(predicted_y_test.shape)


        # initialize parameters
        plt.figure(figsize=(3.5*4/3, 3.5))
        plt.rcParams['font.family'] = 'Roboto Condensed'
        plt.rcParams['font.size'] = 14
        plt.rcParams['legend.title_fontsize'] = 12
        plt.rc('legend', fontsize=12)

        # PLOTTING PREDICTIONS

        plt.scatter(y_train,predicted_y_train,color = '#032c7a',label='Training')
        plt.scatter(y_test,predicted_y_test,color = '#ed0d47',label='Testing')
        ax = plt.gca()
        ax.axline((1, 1), linewidth=0.5, slope=1, color = 'b')
        if adsorbate == 'C':
            plt.xlim([-1, 8])
            plt.ylim([-1, 8])
        elif adsorbate == 'H':
            plt.xlim([-3, 4])
            plt.ylim([-3, 4])
        elif adsorbate == 'O':
            plt.xlim([-4, 4])
            plt.ylim([-4, 4])
        #plt.title('Scatter Plot of Predictive Model from Artificial Neural Network')
        plt.xlabel('Actual Adsorption Energy [eV]')
        plt.ylabel('Predicted Adsorption Energy [eV]')
        plt.legend()

        # minor ticks
        plt.minorticks_on()
        ax = plt.gca()
        ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
        ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
        ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.5))
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.5))

        #legend
        ax.legend(frameon=False)

        # output plot
        plt.savefig('suppfig-' + regression + '-' + adsorbate + '-' + str(count) + '.png', bbox_inches='tight', dpi=1000)

        plt.show()
    


