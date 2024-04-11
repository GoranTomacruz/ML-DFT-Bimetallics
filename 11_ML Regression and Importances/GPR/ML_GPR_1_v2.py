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
import shap
import joblib

def regression(data,rand_index,element,trial):
  ominal_columns = []
  numerical_columns = list(data.columns[1:-1])
  y_column = data.columns[-1]

  adsorbates = ['C', 'H', 'O']

  X_train = pd.read_csv('GPR-x-train_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',').to_numpy()
  X_test = pd.read_csv('GPR-x-test_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',').to_numpy()
  y_train = pd.read_csv('GPR-y-train_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',', usecols=['Train Y']).to_numpy()
  y_test = pd.read_csv('GPR-y_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',', usecols=['Test Y']).to_numpy()

  model = joblib.load('./GPR-model_' + str(rand_index) + '_' + str(element) + '.pkl')

  print(model.get_params())

  print(X_train)
  print(y_train)
  print(type(X_train))
  print(type(y_train))

  model.fit(X_train, y_train)

  # PREDICTING Y ON TRAINING AND TEST DATA
  predicted_y_train = model.predict(X_train)
  predicted_y_test = model.predict(X_test)

  y_train=y_train.flatten()
  y_test=y_test.flatten()
  predicted_y_train=predicted_y_train.flatten()
  predicted_y_test=predicted_y_test.flatten()

  # CALCULATING R^2 AND RMSE
  NMSE_train = (np.sum(np.power(y_train - predicted_y_train,2))*(1/len(y_train))) / (np.sum(np.power(y_train - np.mean(y_train),2))*(1/len(y_train)))
  NMSE = (np.sum(np.power(y_test - predicted_y_test,2))*(1/len(y_test))) / (np.sum(np.power(y_test - np.mean(y_test),2))*(1/len(y_test)))
  GPR_R2_train = 1 - NMSE_train
  GPR_R2 = 1 - NMSE
  GPR_RMSE_train = (np.sum(np.power(y_train - predicted_y_train,2)) / len(y_train))**(1/2)
  GPR_RMSE = (np.sum(np.power(y_test - predicted_y_test,2)) / len(y_test))**(1/2)
  final_GPR_train = "TRAIN GPR R2 = {:0.4f}, TRAIN GPR RMSE = {:0.4f},".format(GPR_R2_train, GPR_RMSE_train)
  final_GPR = "GPR R2 = {:0.4f}, GPR RMSE = {:0.4f},".format(GPR_R2, GPR_RMSE)

  '''
  # PERMUTATION IMPORTANCE
  result = permutation_importance(model, X_test, y_test, n_repeats=10, random_state=rand_index, scoring='r2')
  sorted_idx = result.importances_mean.argsort()


  #SHAP
  # Fits the explainer
  explainer = shap.Explainer(model.predict, X_test)

  # Calculates the SHAP values - It takes some time
  shap_values = explainer(X_test)
  shap_values_values = shap_values.values
  shap_values_base = shap_values.base_values
  shap_values_data = shap_values.data
  
  final_columns = np.array(numerical_columns)[sorted_idx]
  '''

  x_train_dataframe = pd.DataFrame(X_train, columns=numerical_columns)
  x_test_dataframe = pd.DataFrame(X_test, columns=numerical_columns) 
  y_dataframe=pd.DataFrame({'Test Y':y_test, 'Predicted Y':predicted_y_test})
  y_train_dataframe=pd.DataFrame({'Train Y':y_train, 'Predicted Y':predicted_y_train})
  #imp_dataframe=pd.DataFrame({'Importances':result.importances_mean[sorted_idx].T, 'STD':result.importances_std[sorted_idx].T, 'Columns':final_columns})
  #imp_dataframe=pd.DataFrame({'Importances':result.importances_mean.T, 'STD':result.importances_std.T, 'Columns':numerical_columns})

  x_train_dataframe.to_csv('S2-GPR-x-train_' + str(rand_index) + '_' + str(element) + '_trial-' + str(trial) + '.csv',index=False)
  y_dataframe.to_csv('S2-GPR-y_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  y_train_dataframe.to_csv('S2-GPR-y-train_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  x_test_dataframe.to_csv('S2-GPR-x-test_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  #imp_dataframe.to_csv('S2-GPR-imp_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)

  #np.savetxt('S2-GPR-shap-values_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_values, delimiter=',')
  #np.savetxt('S2-GPR-shap-base_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_base, delimiter=',')
  #np.savetxt('S2-GPR-shap-data_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_data, delimiter=',')

  return GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train


# START OF OPERATING CODE

random_state_counter = 1
trial_count = 0

workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_STAGE2-C.xlsx")

text = ""


data=pd.read_csv('updated_v11.1_ml_data_c.csv', sep=',')
worksheet = workbook.add_worksheet('C')
element = 0
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'C- GPR R2')
worksheet.write(0, 2, 'C- GPR RMSE')
worksheet.write(0, 3, 'C- GPR Training R2')
worksheet.write(0, 4, 'C- GPR Training RMSE')


while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, GPR_R2)
  worksheet.write(trial_count+1, 2, GPR_RMSE)
  worksheet.write(trial_count+1, 3, GPR_R2_train)
  worksheet.write(trial_count+1, 4, GPR_RMSE_train)
  #worksheet.write(random_state_counter+1, 5, str(best_params))
  trial_count = trial_count + 1

workbook.close()


workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_STAGE2-H.xlsx")

trial_count = 0
random_state_counter = 5

data=pd.read_csv('updated_v11.1_ml_data_h.csv', sep=',')
worksheet = workbook.add_worksheet('H')
element = 1
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'H- GPR R2')
worksheet.write(0, 2, 'H- GPR RMSE')
worksheet.write(0, 3, 'H- GPR Training R2')
worksheet.write(0, 4, 'H- GPR Training RMSE')

while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, GPR_R2)
  worksheet.write(trial_count+1, 2, GPR_RMSE)
  worksheet.write(trial_count+1, 3, GPR_R2_train)
  worksheet.write(trial_count+1, 4, GPR_RMSE_train)
  trial_count = trial_count + 1

workbook.close()
   

workbook = xlsxwriter.Workbook("GPR_regression_results_v11.1_STAGE2-O.xlsx")
random_state_counter = 1
trial_count = 0

data=pd.read_csv('updated_v11.1_ml_data_o.csv', sep=',')
worksheet = workbook.add_worksheet('O')
element = 2
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'O- GPR R2')
worksheet.write(0, 2, 'O- GPR RMSE')
worksheet.write(0, 3, 'O- GPR Training R2')
worksheet.write(0, 4, 'O- GPR Training RMSE')

while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  GPR_R2, GPR_RMSE, GPR_R2_train, GPR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, GPR_R2)
  worksheet.write(trial_count+1, 2, GPR_RMSE)
  worksheet.write(trial_count+1, 3, GPR_R2_train)
  worksheet.write(trial_count+1, 4, GPR_RMSE_train)
  trial_count = trial_count + 1

workbook.close()

