#=============================================================================== 
# Import data and package ----
#===============================================================================

library(MASS) 
library(klaR)
library(here)

train_data_path = here('01-data','02-derived','train_data.csv')
train_data = read.csv(train_data_path)

test_data_path = here('01-data','02-derived','test_data.csv')
test_data = read.csv(test_data_path)

train_data$DEATH_EVENT = as.factor(train_data$DEATH_EVENT)
test_data$DEATH_EVENT = as.factor(test_data$DEATH_EVENT)

#=============================================================================== 
# Modelling on the training set (Naive Bayes) ----
#===============================================================================

model_nb = NaiveBayes(train_data[,-12],train_data[,12])
print(model_nb)

#=============================================================================== 
# Make prediction on the test set ----
#===============================================================================

## make prediction
test_nb = predict(model_nb, newdata=test_data[,-12]) 

## confusion matrix
confusion_matrix_nb = table(Predicted = test_nb$class, Actual = test_data[,12])
confusion_matrix_nb

