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
# Modelling on the training set (Logistic regression) ----
#===============================================================================

model_lr = glm(DEATH_EVENT ~ ., data = train_data, family = binomial)
summary(model_lr)

#=============================================================================== 
# Make prediction on the test set ----
#===============================================================================

## make prediction
lr_prob = predict(model_lr, newdata=test_data[,-12],type = "response")
test_lr = ifelse(lr_prob > 0.5, 1, 0)

## confusion matrix
confusion_matrix_lr = table(Predicted = test_lr, Actual = test_data[,12])
confusion_matrix_lr



