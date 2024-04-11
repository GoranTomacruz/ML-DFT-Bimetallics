import os

import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager
import matplotlib.ticker as ticker
import scipy.stats as stats

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

categories = ['VE','SE','DBC','DBE']
adsorbates = ['C', 'H', 'O']

for category in categories:
    for adsorbate in adsorbates:
        fig_arr_mono = np.empty
        fig_arr_Cu = np.empty
        fig_arr_Pt = np.empty
        print(adsorbate)
        print(category + ' vs ' + 'AdsE_' + adsorbate + '_complete.csv')
        fig_arr = pd.read_csv(category + ' vs ' + 'AdsE_' + adsorbate + '_complete.csv', skiprows=2).values

        print(fig_arr)

        fig_arr_mono = fig_arr[:,:2]
        fig_arr_Cu = fig_arr[:,2:4]
        fig_arr_Pt = fig_arr[:,4:]

        # initialize parameters
        plt.figure(figsize=(3.5*4/3, 3.5))
        plt.rcParams['font.family'] = 'Roboto Condensed'
        plt.rcParams['font.size'] = 14
        plt.rcParams['legend.title_fontsize'] = 10
        plt.rc('legend', fontsize=10)
    
        print(len(fig_arr_mono[:,1]))
        print(len(fig_arr_Cu[:,1]))
        print(len(fig_arr_Pt[:,1]))
        #removal of empty rows
        x = 0
        while x <= len(fig_arr_mono[:,1]) - 1:
            #print(fig_arr_mono)
            #print(x)
            if math.isnan(fig_arr_mono[x,1]):
                fig_arr_mono = np.delete(fig_arr_mono, x, 0)
            else:
                x = x + 1
        x = 0
        while x <= len(fig_arr_Cu[:,1]) - 1:
            #print(fig_arr_Cu)
            #print(x)
            if math.isnan(fig_arr_Cu[x,1]):
                fig_arr_Cu = np.delete(fig_arr_Cu, x, 0)
            else:
                x = x + 1
        x = 0
        while x <= len(fig_arr_Pt[:,1]) - 1:
            print(x)
            if x == len(fig_arr_Pt[:,1]) - 1:
                print(fig_arr_Pt)
                print(x)
            if math.isnan(fig_arr_Pt[x,1]):
                fig_arr_Pt = np.delete(fig_arr_Pt, x, 0)
            else:
                x = x + 1
        print('-----------------')
        print(fig_arr_mono)
        print(fig_arr_Cu)
        print(fig_arr_Pt)
        #best fit line
        a1, b1 = np.polyfit(fig_arr_mono[:, 0], fig_arr_mono[:, 1], 1)
        a2, b2 = np.polyfit(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1], 1)
        a3, b3 = np.polyfit(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1], 1)

        slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_mono[:, 0], fig_arr_mono[:, 1])
        r2_1 = r_value**2
        slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1])
        r2_2 = r_value**2
        slope, intercept, r_value, p_value, std_err = stats.linregress(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1])
        r2_3 = r_value**2

        # plot data
        plt.plot(fig_arr_mono[:, 0], fig_arr_mono[:, 1], color='#ed0d47', marker='o', mfc='#ed0d47', mec='#ed0d47', mew=1.5, linewidth=0, label='Monometallic TMs')
        plt.plot(fig_arr_Cu[:, 0], fig_arr_Cu[:, 1], color='#032c7a', marker='^', mfc='#032c7a', mec='#032c7a', mew=1.5, linewidth=0, label='Cu alloys')
        plt.plot(fig_arr_Pt[:, 0], fig_arr_Pt[:, 1], color='#047354', marker='s', mfc='#047354', mec='#047354', mew=1.5, linewidth=0, label='Pt alloys')

        # plot best fit lines
        plt.plot(fig_arr_mono[:, 0], a1*fig_arr_mono[:, 0]+b1, color='#ed0d47') 
        plt.plot(fig_arr_Cu[:, 0], a2*fig_arr_Cu[:, 0]+b2, color='#032c7a') 
        plt.plot(fig_arr_Pt[:, 0], a3*fig_arr_Pt[:, 0]+b3, color='#047354') 

        # plot colors
        colors = ['#ed0d47','#032c7a','#047354']

        # minor ticks
        plt.minorticks_on()
        ax = plt.gca()

        if category == 'VE':
            plt.xlabel('Valence Electrons')
            plt.xlim(2, 13)
            plt.xticks(np.arange(2, 14, 1))
            ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
            if adsorbate == 'C':
                # plot equation texts
                plt.text(6.7, 5.25, 'y = ' + '{:.4f}'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(8, 0, 'y = ' + '{:.4f}'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(3, 3, 'y = ' +  '{:.4f}'.format(a3) + 'x' + ' + {:.4f}'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'H':
                # plot equation texts
                plt.text(3, -1.75, 'y = ' + '{:.4f}'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(8.5, -1.25, 'y = ' + '{:.4f}'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(3, 0, 'y = ' +  '{:.4f}'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'O':
                # plot equation texts
                plt.text(4.25, -5, 'y = ' + '{:.4f}'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(8.5, -4.5, 'y = ' + '{:.4f}'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(3, -0.5, 'y = ' +  '{:.4f}'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])

        elif category == 'SE':
            plt.xlabel('Sublimation Energy [kJ/mol]')
            plt.xlim(0, 900)
            plt.xticks(np.arange(0, 1000, 100))
            ax.xaxis.set_minor_locator(ticker.MultipleLocator(50))
            if adsorbate == 'C':
                # plot equation texts
                plt.text(20, 6, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + {:.4f}'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(20, -0.25, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + {:.4f}'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(550, 3, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + {:.4f}'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'H':
                # plot equation texts
                plt.text(450, -1.75, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + {:.4f}'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(50, -1.60, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + {:.4f}'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(550, 0, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + {:.4f}'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'O':
                # plot equation texts
                plt.text(500, -5.5, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + {:.4f}'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(50, -5.5, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + {:.4f}'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(50, 2.5, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + {:.4f}'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])

        elif category == 'DBC':
            plt.xlabel('d-Band Center [eV]')
            plt.xlim(-10, 4)
            plt.xticks(np.arange(-10, 6, 2))
            ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
            if adsorbate == 'C':
                # plot equation texts
                plt.text(-9, 2.5, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-9, 1, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-9, -0.5, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'H':
                # plot equation texts
                plt.text(-9, -0.7, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-2, 0.65, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-2, -1.8, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'O':
                # plot equation texts
                plt.text(-9, -2, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-1.5, -5.5, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-1.5, 2.25, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])

        elif category == 'DBE':
            plt.xlabel('d-Band Upper Edge [eV]')
            plt.xlim(-10, 4)
            plt.xticks(np.arange(-10, 6, 2))
            ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
            if adsorbate == 'C':
                # plot equation texts
                plt.text(-9, 2.5, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-9, 1, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-9, -0.5, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'H':
                # plot equation texts
                plt.text(-9, -0.7, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-2, 0.65, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-2, -1.75, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
            elif adsorbate == 'O':
                # plot equation texts
                plt.text(-9, -2, 'y = ' + '({:.4f})'.format(a1) + 'x' + ' + ({:.4f})'.format(b1) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_1), size=10, color=colors[0])
                plt.text(-1.5, -5.5, 'y = ' + '({:.4f})'.format(a2) + 'x' + ' + ({:.4f})'.format(b2) +'\n' + 'R$^2$ = ' '{:.2f}'.format(r2_2), size=10, color=colors[1])
                plt.text(-1.5, 2.25, 'y = ' +  '({:.4f})'.format(a3) + 'x' + ' + ({:.4f})'.format(b3) + '\n' + 'R$^2$ = ' '{:.2f}'.format(r2_3), size=10, color=colors[2])
        
        plt.ylabel('Adsorption Energy [kJ/mol]')
        if adsorbate == 'C':
            plt.ylim(-1, 7)
            plt.yticks(np.arange(-1, 8, 1))
            ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.5))
        elif adsorbate == 'H':
            plt.ylim(-2, 1)
            plt.yticks(np.arange(-2, 2, 0.5))
            ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.25))
        elif adsorbate == 'O':
            plt.ylim(-6, 4)
            plt.yticks(np.arange(-6, 5, 1))
            ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.5))

        

        #legend
        ax.legend(frameon=False,handletextpad=0.05)

        plt.savefig('SuppFig6_' + category + ' vs ' + 'AdsE_' + adsorbate + '.png', bbox_inches='tight', dpi=1000)

        #plt.clf()
        #fig_arr = np.empty
        # output plot
        plt.show()