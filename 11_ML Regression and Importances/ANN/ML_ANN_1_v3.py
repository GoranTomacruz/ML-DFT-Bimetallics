# Use scikit-learn to grid search the batch size and epochs
import numpy as np
from numpy.random import seed
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
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import KFold
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Reshape
from tensorflow.keras.losses import MeanSquaredError
from tensorflow.keras.metrics import Accuracy, RootMeanSquaredError
from skopt import BayesSearchCV
from skopt.space import Real, Categorical, Integer
from scikeras.wrappers import KerasRegressor
from sklearn.inspection import permutation_importance
from sklearn.metrics import r2_score
from tensorflow.keras import backend as K
import xlsxwriter
import joblib
import shap

#setting a seed for replicability
seed(42)
tf.random.set_seed(42)
rmse = RootMeanSquaredError()

#for RMSE
#def root_mean_squared_error(y_true, y_pred):
#    return K.sqrt(K.mean(K.square(y_pred - y_true)))

# Function to create model, required for KerasRegressor
def create_model(neurons=10, neurons2=10, neurons3=10, optimizer=tf.keras.optimizers.legacy.Adam(), activation="relu"):
	# create model
	model = Sequential()
	model.add(Dense(neurons, input_dim=9, activation=activation))
	model.add(Dense(neurons2, activation=activation))
	model.add(Dense(neurons3, activation=activation))
	model.add(Dense(1, activation='linear'))
	Reshape([1, -1])
	# Compile model
	#model.compile(loss=root_mean_squared_error, optimizer=optimizer, metrics=['accuracy'])
	model.compile(optimizer=optimizer, loss='mean_squared_error', metrics=[rmse])

	return model

def regression(data,rand_index,element):
	# split into input (X) and output (Y) variables
	nominal_columns = []
	numerical_columns = list(data.columns[1:-1])
	y_column = data.columns[-1]

	# from one-hot
	X = data[numerical_columns + nominal_columns]
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

	
	# create model
	model = KerasRegressor(model=create_model, verbose=0, activation='relu', neurons=5, neurons2=5, neurons3=5)

	#pipeline for preprocessing and regression
	ann_pipe = Pipeline([
	    ('preprocess', preprocessing), #STEP 1
	    ('regressor', model) # STEP 3
	])

	



	# define the grid search parameters
	#batch_size = [10]
	#epochs = [20]
	#learn_rate = [0.0001, 0.001, 0.01, 0.1]
	#optimizer = ['Adam']
	#neurons = [10, 15, 20]
	#neurons2 = [10, 15, 20]
	#activation = ['relu', 'linear', 'selu', 'elu', 'tanh']
	
	'''
	batch_size = [5]
	epochs = [60]
	learn_rate = [0.0001]
	optimizer = ['Adam']
	neurons = [20]
	neurons2 = [10, 20]
	neurons3 = [10]
	activation = ['relu']
	'''
	
	
	batch_size = [5,10,15]
	epochs = [60]
	learn_rate = [0.0001, 0.001, 0.01, 0.1]
	optimizer = tf.keras.optimizers.legacy.Adam()
	neurons = [20]
	neurons2 = [10, 15, 20]
	neurons3 = [0, 5, 10]
	activation = ['relu']
    
	param_grids = dict(regressor__batch_size = batch_size, regressor__epochs = epochs, regressor__neurons = neurons, regressor__neurons2 = neurons2, regressor__neurons3 = neurons3, regressor__optimizer__learning_rate=learn_rate, regressor__activation=activation)
	#ann_search = BayesSearchCV(estimator=ann_pipe, search_spaces=param_grid, scoring = 'neg_root_mean_squared_error', n_jobs=-1, n_iter = 50, cv=5, verbose=10, random_state = rand_index)
	print(param_grids)
    
	#GridSearchCV and fit
	ann_search = GridSearchCV(estimator=ann_pipe, param_grid=param_grids, n_jobs=-1, cv=5, scoring = 'neg_root_mean_squared_error',verbose = 10, error_score="raise")
	print(X_train.shape)
	print(y_train.shape)
	ann_search.fit(X_train, y_train)

	# summarize results
	print("Best: %f using %s" % (-1*ann_search.best_score_, ann_search.best_params_))
	means = ann_search.cv_results_['mean_test_score']
	stds = ann_search.cv_results_['std_test_score']
	params = ann_search.cv_results_['params']
	for mean, stdev, param in zip(means, stds, params):
	    print("%f (%f) with: %r" % (-1*mean, stdev, param))
	
	
	# PREDICTING Y ON TRAINING AND TEST DATA
	predicted_y_train = ann_search.best_estimator_.predict(X_train)
	predicted_y_test = ann_search.best_estimator_.predict(X_test)

	# PLOTTING PREDICTIONS
	'''
	ann_plot = plt.figure()
	plt.scatter(y_train,predicted_y_train,color = 'k',label='train')
	plt.scatter(y_test,predicted_y_test,color = 'r',label='test')
	ax = plt.gca()
	ax.axline((1, 1), linewidth=0.5, slope=1, color = 'b')
	plt.xlim([-2, 2])
	plt.ylim([-2, 2])
	plt.title('Scatter Plot of Predictive Model from Artificial Neural Network')
	plt.xlabel('Actual Hydrogen Adsorption Energy (eV)')
	plt.ylabel('Predicted Hydrogen Adsorption Energy (eV)')
	plt.legend()
	'''

	# CALCULATING R^2 AND RMSE
	NMSE_train = (np.sum(np.power(y_train - predicted_y_train,2))*(1/len(y_train))) / (np.sum(np.power(y_train - np.mean(y_train),2))*(1/len(y_train)))
	ANN_NMSE = (np.sum(np.power(y_test - predicted_y_test,2))*(1/len(y_test))) / (np.sum(np.power(y_test - np.mean(y_test),2))*(1/len(y_test)))
	ANN_R2_train = 1 - NMSE_train
	ANN_R2 = 1 - ANN_NMSE
	#ANN_R2_train = r2_score(y_train,predicted_y_train)
	#ANN_R2 = r2_score(y_test,predicted_y_test)
	ANN_RMSE_train = (np.sum(np.power(y_train - predicted_y_train,2)) / len(y_train))**(1/2)
	ANN_RMSE = (np.sum(np.power(y_test - predicted_y_test,2)) / len(y_test))**(1/2)
	final_ann_train = "TRAIN ANN R2 = {:0.4f}, TRAIN ANN RMSE = {:0.4f},".format(ANN_R2_train, ANN_RMSE_train)
	final_ann = "ANN R2 = {:0.4f}, ANN RMSE = {:0.4f},".format(ANN_R2, ANN_RMSE)


	print(final_ann)

 
	# PERMUTATION IMPORTANCE
	result = permutation_importance(ann_search.best_estimator_, X_test, y_test, n_repeats=10, random_state=rand_index, scoring='r2')
	sorted_idx = result.importances_mean.argsort()
	print(result)
	print(sorted_idx)
	print(numerical_columns)
    
	#SHAP
    # Fits the explainer
	explainer = shap.Explainer(ann_search.best_estimator_.predict, X_test)

	# Calculates the SHAP values - It takes some time
	shap_values = explainer(X_test)
	shap_values_values = shap_values.values
	shap_values_base = shap_values.base_values
	shap_values_data = shap_values.data

	#y_train=y_train.flatten()
	#y_test=y_test.flatten()
	#predicted_y_train=predicted_y_train.flatten()
	#predicted_y_test=predicted_y_test.flatten()

	final_columns = np.array(numerical_columns)[sorted_idx]

	# BAR PLOT OF FEATURE IMPORTANCE
	'''
	y_ticks = np.arange(0, len(X_test.columns[sorted_idx]))
	fig, ax = plt.subplots()
	ax.barh(y_ticks, result.importances_mean[sorted_idx].T)
	ax.set_yticks(y_ticks)
	ax.set_yticklabels(X_train.columns[sorted_idx])
	ax.set_title("Permutation Importances on Artificial Neural Networks (test set)")
	fig.tight_layout()
	'''
	x_train_dataframe = pd.DataFrame(X_train, columns=numerical_columns)
	x_test_dataframe = pd.DataFrame(X_test, columns=numerical_columns)
	y_dataframe=pd.DataFrame({'Test Y':y_test, 'Predicted Y':predicted_y_test})
	y_train_dataframe=pd.DataFrame({'Train Y':y_train, 'Predicted Y':predicted_y_train})
	imp_dataframe=pd.DataFrame({'Importances':result.importances_mean[sorted_idx].T, 'STD':result.importances_std[sorted_idx].T, 'Columns':X_test.columns[sorted_idx]})

	x_train_dataframe.to_csv('ANN-x-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
	x_test_dataframe.to_csv('ANN-x-test_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
	y_dataframe.to_csv('ANN-y_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
	y_train_dataframe.to_csv('ANN-y-train_' + str(rand_index) + '_' + str(element) + '.csv',index=False)
	imp_dataframe.to_csv('S2-ANN-imp_' + str(rand_index) + '_' + str(element) + '.csv',index=False)

	np.savetxt('S2-ANN-shap-values_' + str(rand_index) + '_' + str(element) + '.csv', shap_values_values, delimiter=',')
	np.savetxt('S2-ANN-shap-base_' + str(rand_index) + '_' + str(element) + '.csv', shap_values_base, delimiter=',')
	np.savetxt('S2-ANN-shap-data_' + str(rand_index) + '_' + str(element) + '.csv', shap_values_data, delimiter=',')

	print(final_ann)

	#Save
	best_model = ann_search.best_estimator_['regressor']
	best_model.model_.save('ANN-model_' + str(rand_index) + '_' + str(element) + '.h5')

	return ANN_R2, ANN_RMSE, ANN_R2_train, ANN_RMSE_train, ann_search.best_params_




# START OF OPERATING CODE

# Data cleaning

#print("Final Dataset")
#print(data)

tf.autograph.set_verbosity(0)
'''
random_state_counter = 8
workbook = xlsxwriter.Workbook("ANN_regression_results_v11.1_STAGE1&2pt4-FINAL-extra-C.xlsx")
text = ""

data=pd.read_csv('updated_v11.1_ml_data_c.csv', sep=',')
worksheet = workbook.add_worksheet('C')
element = 0
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'C- ANN R2')
worksheet.write(0, 2, 'C- ANN RMSE')
worksheet.write(0, 3, 'C- ANN Training R2')
worksheet.write(0, 4, 'C- ANN Training RMSE')
worksheet.write(0, 5, 'C- ANN Best Params')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  ANN_R2, ANN_RMSE, ANN_R2_train, ANN_RMSE_train, best_params = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, ANN_R2)
  worksheet.write(random_state_counter+1, 2, ANN_RMSE)
  worksheet.write(random_state_counter+1, 3, ANN_R2_train)
  worksheet.write(random_state_counter+1, 4, ANN_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_params))
  random_state_counter = random_state_counter + 1

workbook.close()
'''
'''
random_state_counter = 9

data=pd.read_csv('updated_v11.1_ml_data_h.csv', sep=',')
workbook = xlsxwriter.Workbook("ANN_regression_results_v11.1_STAGE1&2pt4-FINAL-extra-H.xlsx")
worksheet = workbook.add_worksheet('H')
element = 9
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'H- ANN R2')
worksheet.write(0, 2, 'H- ANN RMSE')
worksheet.write(0, 3, 'H- ANN Training R2')
worksheet.write(0, 4, 'H- ANN Training RMSE')
worksheet.write(0, 5, 'H- ANN Best Params')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  ANN_R2, ANN_RMSE, ANN_R2_train, ANN_RMSE_train, best_params = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, ANN_R2)
  worksheet.write(random_state_counter+1, 2, ANN_RMSE)
  worksheet.write(random_state_counter+1, 3, ANN_R2_train)
  worksheet.write(random_state_counter+1, 4, ANN_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_params))
  random_state_counter = random_state_counter + 1

workbook.close()
'''



random_state_counter = 7

data=pd.read_csv('updated_v11.1_ml_data_o.csv', sep=',')
workbook = xlsxwriter.Workbook("ANN_regression_results_v11.1_STAGE1&2pt4-FINAL-extra-O.xlsx")
worksheet = workbook.add_worksheet('O')
element = 2
worksheet.write(0, 0, 'Random Seed')
worksheet.write(0, 1, 'O- ANN R2')
worksheet.write(0, 2, 'O- ANN RMSE')
worksheet.write(0, 3, 'O- ANN Training R2')
worksheet.write(0, 4, 'O- ANN Training RMSE')
worksheet.write(0, 5, 'O- ANN Best Params')

while random_state_counter <= 9:
  line = "Random Seed: {:f},".format(random_state_counter)
  print(line)
  ANN_R2, ANN_RMSE, ANN_R2_train, ANN_RMSE_train, best_params = regression(data,random_state_counter,element)
  worksheet.write(random_state_counter+1, 0, random_state_counter)
  worksheet.write(random_state_counter+1, 1, ANN_R2)
  worksheet.write(random_state_counter+1, 2, ANN_RMSE)
  worksheet.write(random_state_counter+1, 3, ANN_R2_train)
  worksheet.write(random_state_counter+1, 4, ANN_RMSE_train)
  worksheet.write(random_state_counter+1, 5, str(best_params))
  random_state_counter = random_state_counter + 1

workbook.close()

