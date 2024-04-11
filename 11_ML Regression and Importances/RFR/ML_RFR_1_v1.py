import numpy as np
import pandas as pd
import os
import tensorflow as tf
import matplotlib.pyplot as plt
from matplotlib import pyplot
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.decomposition import PCA
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import KFold
from skopt import BayesSearchCV
from skopt.space import Real, Categorical, Integer
from sklearn.inspection import permutation_importance
from sklearn.metrics import r2_score
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
  rfr = RandomForestRegressor(random_state=rand_index)

  # START OF RANDOM FOREST REGRESSION
  # PIPELINE
  rfr_pipe = Pipeline([
      ('preprocess', preprocessing), #STEP 1
      ('regressor', rfr) # STEP 3
  ])

  # HYPER-PARAMETER GRID

  if element == 0:
    param_grid = {
          'regressor__n_estimators': [10, 50, 100, 150, 200],
          'regressor__max_features': [None,"sqrt","log2"],
          'regressor__max_depth': [None,5,10,15,20,25],
    }

  elif element == 1:
    param_grid = {
          'regressor__n_estimators': [10, 50, 100, 150, 200],
          'regressor__max_features': [None,"sqrt","log2"],
          'regressor__max_depth': [None,5,10,15,20,25],
    }

  elif element == 2:
    param_grid = {
          'regressor__n_estimators': [10, 50, 100, 150, 200],
          'regressor__max_features': [None,"sqrt","log2"],
          'regressor__max_depth': [None,5,10,15,20,25],
    }

  # GRID SEARCH WITH R^2 AS SCORER
  #rfr_search = RandomizedSearchCV(estimator=rfr_pipe, param_distributions=param_grid, scoring = 'r2', n_jobs=-1, cv=3, n_iter = 140, verbose=10, random_state = 0)
  rfr_search = GridSearchCV(rfr_pipe, param_grid, n_jobs=-1, cv=10, scoring = 'neg_root_mean_squared_error',verbose = 100, error_score='raise')
  #rfr_search = BayesSearchCV(estimator=rfr_pipe, search_spaces=param_grid, scoring = 'neg_root_mean_squared_error', n_jobs=-1, n_iter = 45, cv=5, verbose=10, random_state = rand_index)
  rfr_search.fit(X_train, y_train)
  #print("Best parameter (CV score=%0.3f):" % search.best_score_) #OUTPUTS BEST PARAMETERS
  best_rfr = rfr_search.best_params_
  #rfr_scores = rfr_search.cv_results_
  #print(rfr_scores)


  # summarize results
  print("Best: %f using %s" % (-1*rfr_search.best_score_, rfr_search.best_params_))
  means = rfr_search.cv_results_['mean_test_score']
  stds = rfr_search.cv_results_['std_test_score']
  params = rfr_search.cv_results_['params']
  for mean, stdev, param in zip(means, stds, params):
    print("%f (%f) with: %r" % (-1*mean, stdev, param))

    print(type(rfr_search.best_estimator_))

  # HYPER-PARAMETER FINE-TUNING HAS ENDED - TIME TO DO REGRESSION
  print("Random Forest Regression")

  # FITTING
  #rfr_pipe.fit(X_train, y_train)

  # PREDICTING Y ON TRAINING AND TEST DATA
  predicted_y_train = rfr_search.best_estimator_.predict(X_train)
  predicted_y_test = rfr_search.best_estimator_.predict(X_test)

  '''
  # PLOTTING PREDICTIONS
  rfr_plot = plt.figure()
  plt.scatter(y_train,predicted_y_train,color = 'k',label='train')
  plt.scatter(y_test,predicted_y_test,color = 'r',label='test')
  ax = plt.gca()
  ax.axline((1, 1), linewidth=0.5, slope=1, color = 'b')
  plt.xlim([-2, 2])
  plt.ylim([-2, 2])
  plt.title('Scatter Plot of Predictive Model from Random Forest Regression')
  plt.xlabel('Actual Hydrogen Adsorption Energy (eV)')
  plt.ylabel('Predicted Hydrogen Adsorption Energy (eV)')
  plt.legend()
  '''
  print('y train')
  print(y_train)
  print('predicted y train')
  print(predicted_y_train)
  print('y train diff')
  print(y_train - predicted_y_train)

  # CALCULATING R^2 AND RMSE
  NMSE_train = (np.sum(np.power(y_train - predicted_y_train,2))*(1/len(y_train))) / (np.sum(np.power(y_train - np.mean(y_train),2))*(1/len(y_train)))
  NMSE = (np.sum(np.power(y_test - predicted_y_test,2))*(1/len(y_test))) / (np.sum(np.power(y_test - np.mean(y_test),2))*(1/len(y_test)))
  RFR_R2_train = 1 - NMSE_train
  RFR_R2 = 1 - NMSE
  RFR_RMSE_train = (np.sum(np.power(y_train - predicted_y_train,2)) / len(y_train))**(1/2)
  RFR_RMSE = (np.sum(np.power(y_test - predicted_y_test,2)) / len(y_test))**(1/2)
  final_rfr_train = "TRAIN RFR R2 = {:0.4f}, TRAIN RFR RMSE = {:0.4f},".format(RFR_R2_train, RFR_RMSE_train)
  final_rfr = "RFR R2 = {:0.4f}, RFR RMSE = {:0.4f},".format(RFR_R2, RFR_RMSE)

  # PERMUTATION IMPORTANCE
  result = permutation_importance(rfr_search.best_estimator_, X_test, y_test, n_repeats=10,
                                  random_state=rand_index)
  sorted_idx = result.importances_mean.argsort()

  '''
  # BAR PLOT OF FEATURE IMPORTANCE
  y_ticks = np.arange(0, len(X_test.columns[sorted_idx]))
  fig, ax = plt.subplots()
  ax.barh(y_ticks, result.importances_mean[sorted_idx].T)
  ax.set_yticks(y_ticks)
  ax.set_yticklabels(X_train.columns[sorted_idx])
  ax.set_title("Permutation Importances on Random Forest Regression (test set)")
  fig.tight_layout()
  '''
  x_train_dataframe = pd.DataFrame(X_train, columns=numerical_columns)
  x_test_dataframe = pd.DataFrame(X_test, columns=numerical_columns)
  y_dataframe=pd.DataFrame({'Test Y':y_test, 'Predicted Y':predicted_y_test})
  y_train_dataframe=pd.DataFrame({'Train Y':y_train, 'Predicted Y':predicted_y_train})
  imp_dataframe=pd.DataFrame({'Importances':result.importances_mean[sorted_idx].T, 'Columns':X_test.columns[sorted_idx]})

  x_train_dataframe.to_csv('RFR-x-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  x_test_dataframe.to_csv('RFR-x-test_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  y_dataframe.to_csv('RFR-y_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  y_train_dataframe.to_csv('RFR-y-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  imp_dataframe.to_csv('RFR-imp_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
  
  # save
  joblib.dump(rfr_search.best_estimator_['regressor'], 'RFR-model_' + str(rand_index) + '_' + str(element) + '.pkl') 

  print(final_rfr)

  return RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train, best_rfr


# START OF OPERATING CODE

# Data cleaning

#print("Final Dataset")
#print(data)
#print(sklearn.__version__)

random_state_counter = 0
workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_FINAL_C.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_c.csv', sep=',')
worksheet = workbook.add_worksheet('C')
element = 0
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'C- RFR R2')
worksheet.write(0, 2, 'C- RFR RMSE')
worksheet.write(0, 3, 'C- RFR TRAINING R2')
worksheet.write(0, 4, 'C- RFR TRAINING RMSE')
worksheet.write(0, 5, 'C- RFR Best Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train, best_rfr = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, RFR_R2)
  worksheet.write(random_state_counter+1, 2, RFR_RMSE)
  worksheet.write(random_state_counter+1, 3, RFR_R2_train) 
  worksheet.write(random_state_counter+1, 4, RFR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_rfr))
  random_state_counter = random_state_counter + 1

workbook.close()

random_state_counter = 0
workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_FINAL_H.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_h.csv', sep=',')
worksheet = workbook.add_worksheet('H')
element = 1
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'H- RFR R2')
worksheet.write(0, 2, 'H- RFR RMSE')
worksheet.write(0, 3, 'H- RFR TRAINING R2')
worksheet.write(0, 4, 'H- RFR TRAINING RMSE')
worksheet.write(0, 5, 'H- RFR Best Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train, best_rfr = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, RFR_R2)
  worksheet.write(random_state_counter+1, 2, RFR_RMSE)
  worksheet.write(random_state_counter+1, 3, RFR_R2_train) 
  worksheet.write(random_state_counter+1, 4, RFR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_rfr))
  random_state_counter = random_state_counter + 1

workbook.close()
random_state_counter = 0
workbook = xlsxwriter.Workbook("RFR_regression_results_v11.1_FINAL_O.xlsx")

data=pd.read_csv('updated_v11.1_ml_data_o.csv', sep=',')
worksheet = workbook.add_worksheet('O')
element = 2
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'O- RFR R2')
worksheet.write(0, 2, 'O- RFR RMSE')
worksheet.write(0, 3, 'O- RFR TRAINING R2')
worksheet.write(0, 4, 'O- RFR TRAINING RMSE')
worksheet.write(0, 5, 'O- RFR Best Parameters')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  RFR_R2, RFR_RMSE, RFR_R2_train, RFR_RMSE_train, best_rfr = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, RFR_R2)
  worksheet.write(random_state_counter+1, 2, RFR_RMSE)
  worksheet.write(random_state_counter+1, 3, RFR_R2_train) 
  worksheet.write(random_state_counter+1, 4, RFR_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_rfr))
  random_state_counter = random_state_counter + 1

workbook.close()

