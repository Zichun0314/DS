#=============================================================================== 
# Import data and package ----
#===============================================================================

library(MASS)
library(here)

train_data_path = here('01-data','02-derived','train_data.csv')
train_data = read.csv(train_data_path)

test_data_path = here('01-data','02-derived','test_data.csv')
test_data = read.csv(test_data_path)

train_data$DEATH_EVENT = as.factor(train_data$DEATH_EVENT)
test_data$DEATH_EVENT = as.factor(test_data$DEATH_EVENT)

#=============================================================================== 
# Modelling on the training set (QDA) ----
#===============================================================================

model_qda = qda(train_data[,-12],train_data[,12])
print(model_qda)

#=============================================================================== 
# Make prediction on the test set ----
#===============================================================================

## make prediction
test_qda = predict(model_qda, newdata=test_data[,-12])

## confusion matrix
confusion_matrix_qda = table(Predicted = test_qda$class, Actual = test_data[,12])
confusion_matrix_qda
