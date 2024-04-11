# Init
import pandas as pd
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()
from matplotlib import colormaps as cm

# Load data
from sklearn.datasets import load_diabetes

# Clustering
from scipy.cluster.hierarchy import dendrogram, fcluster, leaves_list
from scipy.spatial import distance
from fastcluster import linkage # You can use SciPy one too
from scipy.cluster import hierarchy

# matplotlib inline

# Dataset
A_data = load_diabetes().data
DF_diabetes = pd.DataFrame(A_data, columns = ["attr_%d" % j for j in range(A_data.shape[1])])

# Absolute value of correlation matrix, then subtract from 1 for disimilarity
DF_dism = 1 - np.abs(DF_diabetes.corr())

# Compute average linkage
A_dist = distance.squareform(DF_dism.values)
Z = linkage(A_dist,method="average")



# Color mapping -> Reference: https://stackoverflow.com/questions/2967858/dendrogram-generated-by-scipy-cluster-does-not-show
dflt_col = "#808080"   # Unclustered gray

D_leaf_colors = {"attr_1": dflt_col,
                    "attr_4": "#B061FF", # Cluster 1 indigo
                    "attr_5": "#B061FF",
                    "attr_2": "#B061FF",
                    "attr_8": "#B061FF",
                    "attr_6": "#B061FF",
                    "attr_7": "#B061FF",
                    "attr_0": "#61ffff", # Cluster 2 cyan
                    "attr_3": "#61ffff",
                    "attr_9": "#61ffff",
                    }

link_cols = {}

print(Z)
print(Z[:,:2])
print(enumerate(Z[:,:2].astype(int)))
print('---')
#ensures that clusters are all of the same color    
for i, i12 in enumerate(Z[:,:2].astype(int)):
    print(len(Z))
    print('*****')
    print(i)
    print(i12)
    print('++++')
    for x in i12:
        if x > len(Z):
            print('yay')
        else:
            print('boo')
            print(x)
            print(D_leaf_colors["attr_%d"%x])
            print(D_leaf_colors[x])
    print('xxxxxxxxx')
    c1, c2 = (link_cols[x] if x > len(Z) else D_leaf_colors["attr_%d"%x] for x in i12)
    print(c1)
    print(c2)
    link_cols[i+1+len(Z)] = c1 if c1 == c2 else dflt_col
    print('---')

print(link_cols)

# Dendrogram

#D = dendrogram(Z)
D = dendrogram(Z=Z, labels=DF_dism.index, color_threshold=0.3,leaf_font_size=12, leaf_rotation=45, link_color_func=lambda x: link_cols[x])
#D = hierarchy.dendrogram(Z, labels=DF_dism.index, color_threshold=0.7,leaf_font_size=12, leaf_rotation=45)
plt.show()