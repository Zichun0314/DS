#=============================================================================== 
# Import data and package ----
#===============================================================================

library(randomForest)
library(here)

train_data_path = here('01-data','02-derived','train_data.csv')
train_data = read.csv(train_data_path)

test_data_path = here('01-data','02-derived','test_data.csv')
test_data = read.csv(test_data_path)

train_data$DEATH_EVENT = as.factor(train_data$DEATH_EVENT)
test_data$DEATH_EVENT = as.factor(test_data$DEATH_EVENT)

#=============================================================================== 
# Modelling on the training set (Random forest) ----
#===============================================================================

## fit the model
set.seed(123)
model_rf = randomForest(DEATH_EVENT ~ ., train_data, ntree = 500,  importance = TRUE)
print(model_rf)

## variable importance plot
varImpPlot(model_rf, n.var = nrow(model_rf$importance), main = 'Variable importance')

#=============================================================================== 
# Make prediction on the test set ----
#===============================================================================

## make prediction
test_rf = predict(model_rf, newdata = test_data[,-12])

## confusion matrix
confusion_matrix_rf = table(Predicted = test_rf, Actual = test_data[,12])
confusion_matrix_rf

