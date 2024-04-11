import sklearn
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
from sklearn.model_selection import RandomizedSearchCV
from sklearn.metrics import pairwise
from sklearn.ensemble import RandomForestRegressor
from sklearn.inspection import permutation_importance
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error as MSE
from sklearn.metrics import mean_absolute_error as MAE
from sklearn.metrics import r2_score as R2
from scipy.special import softmax

import shap 
import skopt
from skopt import BayesSearchCV
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import pyplot
import xlsxwriter
import joblib

def regression(data,rand_index,element,trial):
  nominal_columns = []
  numerical_columns = list(data.columns[1:-1])
  y_column = data.columns[-1]

  adsorbates = ['C', 'H', 'O']

  X_train = pd.read_csv('RFR-x-train_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',').to_numpy()
  X_test = pd.read_csv('RFR-x-test_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',').to_numpy()
  y_train = pd.read_csv('RFR-y-train_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',', usecols=['Train Y']).to_numpy()
  y_test = pd.read_csv('RFR-y_' + str(rand_index) + '_' + str(element) +  '.csv', sep=',', usecols=['Test Y']).to_numpy()

  model = joblib.load('./RFR-model_' + str(rand_index) + '_' + str(element) + '.pkl')

  #print(model.get_params())

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
  RFR_R2_train = 1 - NMSE_train
  RFR_R2 = 1 - NMSE
  RFR_RMSE_train = (np.sum(np.power(y_train - predicted_y_train,2)) / len(y_train))**(1/2)
  RFR_RMSE = (np.sum(np.power(y_test - predicted_y_test,2)) / len(y_test))**(1/2)
  final_rfr_train = "TRAIN RFR R2 = {:0.4f}, TRAIN RFR RMSE = {:0.4f},".format(RFR_R2_train, RFR_RMSE_train)
  final_rfr = "RFR R2 = {:0.4f}, RFR RMSE = {:0.4f},".format(RFR_R2, RFR_RMSE)

  print(final_rfr_train)
  print(final_rfr)

  # PERMUTATION IMPORTANCE
  result = permutation_importance(model, X_test, y_test, n_repeats=10, random_state=rand_index, scoring='r2')
  sorted_idx = result.importances_mean.argsort()

  '''
  #SHAP
  # Fits the explainer
  explainer = shap.Explainer(model.predict, X_test)

  # Calculates the SHAP values - It takes some time
  shap_values = explainer(X_test)
  shap_values_values = shap_values.values
  shap_values_base = shap_values.base_values
  shap_values_data = shap_values.data
  '''

  final_columns = np.array(numerical_columns)[sorted_idx]
  

  x_train_dataframe = pd.DataFrame(X_train, columns=numerical_columns)
  x_test_dataframe = pd.DataFrame(X_test, columns=numerical_columns) 
  y_dataframe=pd.DataFrame({'Test Y':y_test, 'Predicted Y':predicted_y_test})
  y_train_dataframe=pd.DataFrame({'Train Y':y_train, 'Predicted Y':predicted_y_train})
  imp_dataframe=pd.DataFrame({'Importances':result.importances_mean[sorted_idx].T, 'STD':result.importances_std[sorted_idx].T, 'Columns':final_columns})

  x_train_dataframe.to_csv('S3-RFR-x-train_' + str(rand_index) + '_' + str(element) + '_trial-' + str(trial) + '.csv',index=False)
  y_dataframe.to_csv('S3-RFR-y_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  y_train_dataframe.to_csv('S3-RFR-y-train_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  x_test_dataframe.to_csv('S3-RFR-x-test_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)
  imp_dataframe.to_csv('S3-RFR-imp_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv',index=False)

  #np.savetxt('S2-RFR-shap-values_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_values, delimiter=',')
  #np.savetxt('S2-RFR-shap-base_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_base, delimiter=',')
  #np.savetxt('S2-RFR-shap-data_' + str(rand_index) + '_' + adsorbates[element] + '_trial-' + str(trial) + '.csv', shap_values_data, delimiter=',')

  return RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train

# START OF OPERATING CODE

# Data cleaning

#print("Final Dataset")
#print(data)

random_state_counter = 1
trial_count = 0

workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_STAGE2-extra-C.xlsx")

text = ""


data=pd.read_csv('updated_v11.1_ml_data_c.csv', sep=',')
worksheet = workbook.add_worksheet('C')
element = 0
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'C- RFR R2')
worksheet.write(0, 2, 'C- RFR RMSE')
worksheet.write(0, 3, 'C- RFR Training R2')
worksheet.write(0, 4, 'C- RFR Training RMSE')
#worksheet.write(0, 5, 'C- RFR Best Params')


while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, RFR_R2)
  worksheet.write(trial_count+1, 2, RFR_RMSE)
  worksheet.write(trial_count+1, 3, RFR_R2_train)
  worksheet.write(trial_count+1, 4, RFR_RMSE_train)
  #worksheet.write(random_state_counter+1, 5, str(best_params))
  trial_count = trial_count + 1

workbook.close()

workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_STAGE2-extra-H.xlsx")

trial_count = 0
random_state_counter = 6

data=pd.read_csv('updated_v11.1_ml_data_h.csv', sep=',')
worksheet = workbook.add_worksheet('H')
element = 1
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'H- RFR R2')
worksheet.write(0, 2, 'H- RFR RMSE')
worksheet.write(0, 3, 'H- RFR Training R2')
worksheet.write(0, 4, 'H- RFR Training RMSE')

while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, RFR_R2)
  worksheet.write(trial_count+1, 2, RFR_RMSE)
  worksheet.write(trial_count+1, 3, RFR_R2_train)
  worksheet.write(trial_count+1, 4, RFR_RMSE_train)
  trial_count = trial_count + 1

workbook.close()



workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_STAGE2-extra-O.xlsx")
random_state_counter = 4
trial_count = 0

data=pd.read_csv('updated_v11.1_ml_data_o.csv', sep=',')
worksheet = workbook.add_worksheet('O')
element = 2
worksheet.write(0, 0, 'Trial Count')
worksheet.write(0, 1, 'O- RFR R2')
worksheet.write(0, 2, 'O- RFR RMSE')
worksheet.write(0, 3, 'O- RFR Training R2')
worksheet.write(0, 4, 'O- RFR Training RMSE')

while trial_count <= 9:
  line = "Trial Count: {:f},".format(trial_count)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train = regression(data,random_state_counter,element,trial_count)
  worksheet.write(trial_count+1, 0, trial_count)
  worksheet.write(trial_count+1, 1, RFR_R2)
  worksheet.write(trial_count+1, 2, RFR_RMSE)
  worksheet.write(trial_count+1, 3, RFR_R2_train)
  worksheet.write(trial_count+1, 4, RFR_RMSE_train)
  trial_count = trial_count + 1

workbook.close()


