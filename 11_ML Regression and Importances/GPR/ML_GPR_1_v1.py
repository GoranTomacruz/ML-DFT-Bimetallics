from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import KFold
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import pairwise
from sklearn.gaussian_process.kernels import (RBF, Matern, RationalQuadratic, ExpSineSquared, DotProduct, ConstantKernel, WhiteKernel)
from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import Hyperparameter
from sklearn.inspection import permutation_importance
from skopt import BayesSearchCV
from skopt.space import Real, Categorical, Integer
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import pyplot
import xlsxwriter
import joblib

def regression(data,rand_index,element):
  nominal_columns = []
  numerical_columns = list(data.columns[1:-1])
  y_column = data.columns[-1]

  #print(numerical_columns)

  # from one-hot
  X = data[numerical_columns + nominal_columns]
  #X = data[numerical_columns]
  X[numerical_columns] = StandardScaler().fit_transform(X[numerical_columns])
  y = data[y_column]

  #splitting test and train
  X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=rand_index) 

  nominal_encoder = OneHotEncoder(handle_unknown='ignore') #one hot encoding of nominal data
  numerical_pipe = Pipeline([('imputer', SimpleImputer(strategy='mean'))]) #missing numerical is labelled to be the mean of the present data

  # fixes needed adjusstments on columns

  preprocessing = ColumnTransformer(
      [('nom', nominal_encoder, nominal_columns),
       ('num', numerical_pipe, numerical_columns)])

  # Listing PCA and Other Regression Methods to put in the Pipeline
  '''
  if element == 0:
    pca = PCA(n_components=8) #solved from final_project_1.py
  else:
    pca = PCA(n_components=7)
  '''
  gpr = GaussianProcessRegressor(random_state=rand_index)

  # START OF GAUSSIAN PROCESS REGRESSION
  # PIPELINE
  gpr_pipe = Pipeline([
      ('preprocess', preprocessing),
      ('regressor', gpr)
  ])

  # HYPER-PARAMETER GRID

  if element == 0:
    gpr_param_grid =  [
    {
        'regressor__alpha': [1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 100],
        #'regressor__alpha': [1e-10, 1e-6, 1e-2, 100],
        'regressor__kernel': 
        [ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2))]
    }
    ]

  elif element == 1:
    gpr_param_grid =  [
    {
        'regressor__alpha': [1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 100],
        #'regressor__alpha': [1e-10, 1e-6, 1e-2, 100],
        'regressor__kernel': 
        [ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2))]
    }
    ]

  elif element == 2:
    gpr_param_grid =  [
    {
        'regressor__alpha': [1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 100],
        #'regressor__alpha': [1e-10, 1e-6, 1e-2, 100],
        'regressor__kernel': 
        [ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)),
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RBF(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*RationalQuadratic(length_scale=1.0, length_scale_bounds=(1e-2,1e2)) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2)), 
        ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*Matern(length_scale=1.0, length_scale_bounds=(1e-2,1e2), nu=1.5) + ConstantKernel(constant_value=1.0, constant_value_bounds=(1e-2,1e2))*DotProduct(sigma_0=1.0, sigma_0_bounds=(1e-2,1e2)) + WhiteKernel(noise_level=0.01, noise_level_bounds=(1e-8,1e2))]
    }
    ]

  # GRID SEARCH WITH R^2 AS SCORER
  gpr_search = GridSearchCV(gpr_pipe, gpr_param_grid, n_jobs=-2, cv=5, scoring = 'neg_root_mean_squared_error',verbose = 10)
  #print(gpr_param_grid)
  #print(gpr_param_grid[0]['regressor__kernel'][0])
  #print(type(gpr_param_grid[0]['regressor__kernel'][0]))  
  #gpr_search = BayesSearchCV(estimator=gpr_pipe, search_spaces=gpr_param_grid, scoring = 'neg_root_mean_squared_error', n_jobs=-1, n_iter = 50, cv=3, verbose=10, random_state=0)
  gpr_search.fit(X_train, y_train)
  #print("Best parameter (CV score=%0.3f):" % gpr_search.best_score_)
  best_gpr = gpr_search.best_params_
  #best_gpr_2 = gpr_search.get_params()

  # summarize results
  print("Best: %f using %s" % (-1*gpr_search.best_score_, gpr_search.best_params_))
  means = gpr_search.cv_results_['mean_test_score']
  stds = gpr_search.cv_results_['std_test_score']
  params = gpr_search.cv_results_['params']
  for mean, stdev, param in zip(means, stds, params):
    print("%f (%f) with: %r" % (-1*mean, stdev, param))

    print(type(gpr_search.best_estimator_))

  # HYPER-PARAMETER FINE-TUNING HAS ENDED - TIME TO DO REGRESSION
  print("Gaussian Process Regression")

  # FITTING
  #gpr_pipe.fit(X_train, y_train)

  # PREDICTING Y ON TRAINING AND TEST DATA
  predicted_y_train = gpr_search.best_estimator_.predict(X_train)
  predicted_y_test = gpr_search.best_estimator_.predict(X_test)

  # PLOTTING PREDICTIONS
  '''
  gpr_plot = plt.figure()
  plt.scatter(y_train,predicted_y_train,color = 'k',label='train')
  plt.scatter(y_test,predicted_y_test,color = 'r',label='test')
  ax = plt.gca()
  ax.axline((1, 1), linewidth=0.5, slope=1, color = 'b')
  plt.xlim([-2, 2])
  plt.ylim([-2, 2])
  plt.title('Scatter Plot of Predictive Model from Gaussian Process Regression')
  plt.xlabel('Actual Hydrogen Adsorption Energy (eV)')
  plt.ylabel('Predicted Hydrogen Adsorption Energy (eV)')
  plt.legend()
  '''

  # CALCULATING R^2 AND RMSE
  NMSE_train = (np.sum(np.power(y_train - predicted_y_train,2))*(1/len(y_train))) / (np.sum(np.power(y_train - np.mean(y_train),2))*(1/len(y_train)))
  NMSE = (np.sum(np.power(y_test - predicted_y_test,2))*(1/len(y_test))) / (np.sum(np.power(y_test - np.mean(y_test),2))*(1/len(y_test)))
  GPR_R2_train = 1 - NMSE_train
  GPR_R2 = 1 - NMSE
  GPR_RMSE_train = (np.sum(np.power(y_train - predicted_y_train,2)) / len(y_train))**(1/2)
  GPR_RMSE = (np.sum(np.power(y_test - predicted_y_test,2)) / len(y_test))**(1/2)
  final_gpr_train = "TRAIN GPR R2 = {:0.4f}, TRAIN GPR RMSE = {:0.4f},".format(GPR_R2_train, GPR_RMSE_train)
  final_gpr = "GPR R2 = {:0.4f}, GPR RMSE = {:0.4f},".format(GPR_R2, GPR_RMSE)

  kernel_params_1 = str(gpr_search.best_estimator_['regressor'].kernel_.k1.k1)
  kernel_params_2 = str(gpr_search.best_estimator_['regressor'].kernel_.k1.k2)
  kernel_params_3 = str(gpr_search.best_estimator_['regressor'].kernel_.k2)

  #rbf_constant = gpr_search.best_estimator_['regressor'].kernel_.k1.k1.k1.constant_value
  #rbf_length = gpr_search.best_estimator_['regressor'].kernel_.k1.k1.k2.length_scale
  #dp_constant = gpr_search.best_estimator_['regressor'].kernel_.k1.k2.k1.constant_value
  #dp_length = gpr_search.best_estimator_['regressor'].kernel_.k1.k2.k2.sigma_0
  #wk_noise = gpr_search.best_estimator_['regressor'].kernel_.k2.noise_level

  # PERMUTATION IMPORTANCE
  #result = permutation_importance(gpr_search.best_estimator_, X_test, y_test, n_repeats=10,random_state=rand_index)
  #sorted_idx = result.importances_mean.argsort()

  '''
  # BAR PLOT OF FEATURE IMPORTANCE
  y_ticks = np.arange(0, len(X_test.columns[sorted_idx]))
  fig, ax = plt.subplots()
  ax.barh(y_ticks, result.importances_mean[sorted_idx].T)
  ax.set_yticks(y_ticks)
  ax.set_yticklabels(X_train.columns[sorted_idx])
  ax.set_title("Permutation Importances on Gaussian Process Regression (test set)")
  fig.tight_layout()
  '''
  x_train_dataframe = pd.DataFrame(X_train, columns=numerical_columns)
  x_test_dataframe = pd.DataFrame(X_test, columns=numerical_columns)
  y_dataframe=pd.DataFrame({'Test Y':y_test, 'Predicted Y':predicted_y_test})
  y_train_dataframe=pd.DataFrame({'Train Y':y_train, 'Predicted Y':predicted_y_train})
  #imp_dataframe=pd.DataFrame({'Importances':result.importances_mean[sorted_idx].T, 'Columns':X_test.columns[sorted_idx]})

  x_train_dataframe.to_csv('GPR-x-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  x_test_dataframe.to_csv('GPR-x-test_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  y_dataframe.to_csv('GPR-y_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  y_train_dataframe.to_csv('GPR-y-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  #imp_dataframe.to_csv('GPR-imp_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  
  # save
  joblib.dump(gpr_search.best_estimator_['regressor'], 'GPR-model_' + str(rand_index) + '_' + str(element) + '.pkl') 

  return GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train, best_gpr, kernel_params_1, kernel_params_2, kernel_params_3



# START OF OPERATING CODE

# Data cleaning

#print("Final Dataset")
#print(data)

'''
random_state_counter = 0
workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_C.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_c.csv', sep=',')
worksheet = workbook.add_worksheet('C')
element = 0
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'C- GPR R2')
worksheet.write(0, 2, 'C- GPR RMSE')
worksheet.write(0, 3, 'C- GPR TRAINING R2')
worksheet.write(0, 4, 'C- GPR TRAINING RMSE')
worksheet.write(0, 5, 'C- GPR Best Parameters')
worksheet.write(0, 6, 'C- Kernel Parameters 1')
worksheet.write(0, 7, 'C- Kernel Parameters 2')
worksheet.write(0, 8, 'C- Kernel Parameters 3')
#worksheet.write(0, 6, 'C- GPR Best Extra Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train, best_gpr, kernel_params_1, kernel_params_2, kernel_params_3  = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, GPR_R2)
  worksheet.write(random_state_counter+1, 2, GPR_RMSE)
  worksheet.write(random_state_counter+1, 3, GPR_R2_train)
  worksheet.write(random_state_counter+1, 4, GPR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_gpr))
  worksheet.write(random_state_counter+1, 6, kernel_params_1)
  worksheet.write(random_state_counter+1, 7, kernel_params_2)
  worksheet.write(random_state_counter+1, 8, kernel_params_3)
  #worksheet.write(random_state_counter+1, 6, str(best_gpr_2))
  random_state_counter = random_state_counter + 1

workbook.close()
'''

random_state_counter = 0
workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_H.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_h.csv', sep=',')
worksheet = workbook.add_worksheet('H')
element = 1
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'H- GPR R2')
worksheet.write(0, 2, 'H- GPR RMSE')
worksheet.write(0, 3, 'H- GPR TRAINING R2')
worksheet.write(0, 4, 'H- GPR TRAINING RMSE')
worksheet.write(0, 5, 'H- GPR Best Parameters')
worksheet.write(0, 6, 'H- Kernel Parameters 1')
worksheet.write(0, 7, 'H- Kernel Parameters 2')
worksheet.write(0, 8, 'H- Kernel Parameters 3')
#worksheet.write(0, 6, 'H- GPR Best Extra Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train, best_gpr, kernel_params_1, kernel_params_2, kernel_params_3  = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, GPR_R2)
  worksheet.write(random_state_counter+1, 2, GPR_RMSE)
  worksheet.write(random_state_counter+1, 3, GPR_R2_train)
  worksheet.write(random_state_counter+1, 4, GPR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_gpr))
  worksheet.write(random_state_counter+1, 6, kernel_params_1)
  worksheet.write(random_state_counter+1, 7, kernel_params_2)
  worksheet.write(random_state_counter+1, 8, kernel_params_3)
  #worksheet.write(random_state_counter+1, 6, str(best_gpr_2))
  random_state_counter = random_state_counter + 1

workbook.close()


random_state_counter = 0
workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_O.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_o.csv', sep=',')
worksheet = workbook.add_worksheet('O')
element = 2
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'O- GPR R2')
worksheet.write(0, 2, 'O- GPR RMSE')
worksheet.write(0, 3, 'O- GPR TRAINING R2')
worksheet.write(0, 4, 'O- GPR TRAINING RMSE')
worksheet.write(0, 5, 'O- GPR Best Parameters')
worksheet.write(0, 6, 'O- Kernel Parameters 1')
worksheet.write(0, 7, 'O- Kernel Parameters 2')
worksheet.write(0, 8, 'O- Kernel Parameters 3')
#worksheet.write(0, 6, 'O- GPR Best Extra Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train, best_gpr, kernel_params_1, kernel_params_2, kernel_params_3 = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, GPR_R2)
  worksheet.write(random_state_counter+1, 2, GPR_RMSE)
  worksheet.write(random_state_counter+1, 3, GPR_R2_train)
  worksheet.write(random_state_counter+1, 4, GPR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_gpr))
  worksheet.write(random_state_counter+1, 6, kernel_params_1)
  worksheet.write(random_state_counter+1, 7, kernel_params_2)
  worksheet.write(random_state_counter+1, 8, kernel_params_3)
  #worksheet.write(random_state_counter+1, 6, str(best_gpr_2))
  random_state_counter = random_state_counter + 1

workbook.close()

