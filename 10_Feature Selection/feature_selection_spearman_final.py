import numpy as np
import pandas as pd
import os
from os import listdir
from os.path import isfile, join
import xlsxwriter
import matplotlib.pyplot as plt
import matplotlib.colors as colors
from sklearn.feature_selection import f_regression
from scipy.stats import spearmanr, f, pearsonr
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler
from scipy.cluster import hierarchy
from scipy.spatial.distance import squareform
from matplotlib import font_manager


def f_test(X, y, target, mode):
    if mode.lower() == 'pearsonr':
        temp = []
        for col in X.columns:
            corr, _ = pearsonr(X[col].values,y)
            temp.append(corr)
        df = pd.DataFrame(temp, columns = ['pearsonr'], index=X.columns)
    elif mode.lower() == 'spearmanr':
        corr, _ = spearmanr(X,y)
        df = pd.DataFrame(corr[:-1,-1], columns=['spearman'], index=X.columns)
    else:
        return

    degree_of_freedom = len(y)-2
    df['F-score'] = df.iloc[:,0].apply(lambda x: x**2/(1-x**2)*degree_of_freedom)
    df['p-value'] = f.sf(df['F-score'], 1, degree_of_freedom)
    #print(df)
    return df

sym = ''
errors = [] 
d = []
counter = 1

files = ['updated_v11_ml_data_c.csv','updated_v11_ml_data_h.csv','updated_v11_ml_data_o.csv']
atom = ['C', 'H', 'O']
i = 0

#add font
font_dirs = ["/Users/jttomacruz/Library/Fonts/"]
font_files = font_manager.findSystemFonts(fontpaths=font_dirs)

for font_file in font_files:
    font_manager.fontManager.addfont(font_file)

# initialize parameters
plt.figure(figsize=(3.5*4/3, 3.5))
plt.rcParams['font.family'] = 'Roboto Condensed'
plt.rcParams['font.size'] = 14
plt.rcParams['legend.title_fontsize'] = 12
plt.rc('legend', fontsize=12)


for file in files:
    ads = pd.read_csv(file,delimiter=",")
    #print(ads)
    
    nominal_columns = []
    numerical_columns = list(ads.columns[1:15])
    y_column = ads.columns[15]

    #print(numerical_columns)

    # from one-hot
    X = ads[numerical_columns + nominal_columns]
    #X = data[numerical_columns]
    #X[numerical_columns] = StandardScaler().fit_transform(X[numerical_columns])
    y = ads[y_column]
    
    print("\n\nRegression of {}:".format(atom[i]))
    #f_test(X, y, target=['reaction energy (eV)'], mode='pearsonr')
    #f_test(X, y, target=['reaction energy (eV)'], mode='spearmanr')

    #F_score, p_value = f_regression(X[numerical_columns],y)

    #df = pd.DataFrame(list(zip(numerical_columns, F_score, p_value)), columns = ['Feature', 'F-score', 'p-value'])
    #print("\n\nF regression of {}:".format(atom[i]))
    #print(df)

    #print(ads.columns)

    ads_edited = ads.drop(['surface'], axis=1)

    features = ['LC','MV','EN', 'IE','EA','SE','DBC','DBW','DBF','DOS','WF','EAC','GCN','VE','RxnE']
    
    coef_matrix, p_matrix = spearmanr(ads_edited)
    spearman_results = coef_matrix[:-1,-1]
    #pearson_results, p_value = f_regression(X[numerical_columns],y)
    #pearson_results, _ = pearsonr(X[numerical_columns],y)
    pearson_results = []
    for col in numerical_columns:
        corr, _ = pearsonr(X[col].values,y)
        pearson_results.append(corr)
    greater_lesser = []
    for v in range(len(spearman_results)):
    	if abs(spearman_results[v]) > abs(pearson_results[v]):
    		greater_lesser.append(1)
    	else:
    		greater_lesser.append(0)

    reg_df = pd.DataFrame(list(zip(features[:-1], pearson_results, spearman_results, greater_lesser)), columns = ['Feature', 'Pearson', 'Spearman', 'If spearman is greater'])
    #print(reg_df)

    reg_df.to_csv('Regression DataFrame of ' + atom[i] + '.csv')

    
    coef_matrix = (coef_matrix + coef_matrix.T) / 2
    np.fill_diagonal(coef_matrix, 1)

    to_remove_list = []

    for j in range(len(coef_matrix)):
        for k in range(len(coef_matrix)):
            if abs(coef_matrix[j,k]) >= 0.5 and j > k:
                if j != len(coef_matrix) - 1 or k != len(coef_matrix) - 1: 
                    #print("Remove {} or {}. Correlation: {}". format(features[j], features[k], coef_matrix[j,k]))
                    if j not in to_remove_list:
                        to_remove_list.append(j)
                    if k not in to_remove_list:
                        to_remove_list.append(k)


    for m in range(len(to_remove_list)):
        if features[to_remove_list[m]] != 'RxnE':
            print("Coefficient of {} to Rxn Energy: {}".format(features[to_remove_list[m]],coef_matrix[to_remove_list[m],-1]))

    #drop RxnE
    coef_matrix = np.delete(coef_matrix, -1, axis=-1)
    coef_matrix = np.delete(coef_matrix, -1, axis=0)
    features = ['LC','MV','EN', 'IE','EA','SE','DBC','DBW','DBF','DOS','WF','EAC','GCN','VE']
    #print(len(features))
    #print(np.shape(coef_matrix))

    col_index = []
    for r in range(len(features)):
        col_index.append(r)


    '''
    print("Correlation matrix of {}:".format(atom[i]))
    #with pd.option_context('display.max_columns', None,):
        #print(matrix)
    #print(coef_matrix)
    plt.matshow(coef_matrix)
    plt.colorbar()
    plt.title("Correlation matrix of {}:".format(atom[i]))
    plt.show()

    print("p matrix of {}:".format(atom[i]))
    #with pd.option_context('display.max_columns', None,):
        #print(matrix)
    #print(p_matrix)
    plt.matshow(p_matrix)
    plt.colorbar()
    plt.title("p matrix of {}:".format(atom[i]))
    plt.show()
    '''


    masked_array = np.ma.array(coef_matrix, mask=np.isnan(coef_matrix))
    cmap = plt.cm.plasma
    cmap.set_bad('gray',1.)
    #plt.imshow(masked_array, interpolation='nearest',cmap=cmap)
    '''
    fig, ax = plt.subplots(1)

    bounds = [-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1]
    
    #norm = colors.Normalize(vmin=matrix_min, vmax=matrix_max)
    norm = colors.BoundaryNorm(bounds, cmap.N)

    im = ax.imshow(masked_array, cmap=cmap, norm=norm)

    cb = fig.colorbar(plt.cm.ScalarMappable(norm=norm, cmap=cmap), cax = ax.inset_axes([1.05, 0.1, 0.05, 0.8]), ticks = bounds)
    cb.ax.set_ylabel("Spearman Correlation", rotation=270, labelpad=20)
    ax.set_xticks(col_index)
    ax.set_yticks(col_index)
    ax.set_xticklabels(features, fontsize=7.5)
    ax.set_yticklabels(features, fontsize=7.5)

    ax.set_title("Spearman correlation matrix of {}-adsorption".format(atom[i]))

    plt.show()
    '''

    fig, ax = plt.subplots(1)

    
    # Color mapping
    dflt_col = "#808080"
    D_leaf_colors = {"LC": "#acd96e", 
                     "MV": "#16c285", 
                     "EN": "#055359",
                     "IE": "#700460",
                     "EA": "#055359",
                     "SE": "#a12d5d", 
                     "DBC": "#700460", 
                     "DBW": "#a12d5d",
                     "DBF": "#032c7a",
                     "DOS": "#262949",
                     "WF": "#16c285",
                     "EAC": "#FBBF53",
                     "GCN": "#fbbf53",
                     "VE": "#700460",
                 }
    
    D_leaf_colors = [["LC", "#acd96e"], 
                     ["MV", "#16c285"], 
                     ["EN", "#055359"],
                     ["IE", "#700460"],
                     ["EA", "#055359"],
                     ["SE", "#a12d5d"], 
                     ["DBC", "#700460"], 
                     ["DBW", "#a12d5d"],
                     ["DBF", "#032c7a"],
                     ["DOS", "#262949"],
                     ["WF", "#16c285"],
                     ["EAC", "#FBBF53"],
                     ["GCN", "#fbbf53"],
                     ["VE", "#700460"]]

    #ax.set_title("Distance matrix of features for {}-adsorption prediction from Ward's Method".format(atom[i]))

    distance_matrix = 1 - np.abs(coef_matrix)
    dist_linkage = hierarchy.ward(squareform(distance_matrix))

    #print(dist_linkage)

    '''
    link_cols = {}

    #ensures that clusters are all of the same color
    for i, i12 in enumerate(dist_linkage[:,:2].astype(int)):
        print(len(dist_linkage))
        print('*****')
        print(i)
        print(i12)
        print(D_leaf_colors[i][1])
        print(D_leaf_colors[i12][1])
        print('++++')
        c1, c2 = (link_cols[x] if x > len(dist_linkage) else D_leaf_colors[x][1] for x in i12)
        print(c1)
        print(c2)
        link_cols[i+1+len(dist_linkage)] = c1 if c1 == c2 else dflt_col
        print('---')
        
    print(link_cols)

    '''
    dendro = hierarchy.dendrogram(dist_linkage, labels=features, ax=ax, leaf_rotation=90, color_threshold=0.5, above_threshold_color='gray')

    plt.plot([0,150],[0.5,0.5], linewidth=1, color='gray', linestyle = 'dashed')


    my_palette = plt.cm.get_cmap("plasma",4)
    #print(dendro)
    #print(dendro["ivl"])

    plt.savefig('figure7_{}.png'.format(atom[i]), bbox_inches='tight', dpi=1000)

    plt.show()
    
    #print(ads.columns)
    

    i = i + 1