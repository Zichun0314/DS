#=============================================================================== 
# Import data and package ----
#===============================================================================

library(ggExtra)
library(dplyr)
library(tidyr)
library(here)
library(reshape2)
library(tidymodels)

tr_data_path = here('01-data','02-derived','transformed_data.csv')
processed_data = read.csv(tr_data_path)


#=============================================================================== 
# Change y into factor ----
#===============================================================================

processed_data$DEATH_EVENT = as.factor(processed_data$DEATH_EVENT)


#=============================================================================== 
# Feature scalling for continuous variables ----
#===============================================================================

## change into shorter column name
colnames(processed_data)[3] = 'transformed_CPK'
colnames(processed_data)[8] = 'transformed_s_c'


## define a function
scalling = function(x){
  (x-mean(x))/sd(x)
}

## feature scalling
processed_data$age = scalling(processed_data$age)
processed_data$transformed_CPK = scalling(processed_data$transformed_CPK)
processed_data$ejection_fraction = scalling(processed_data$ejection_fraction)
processed_data$platelets = scalling(processed_data$platelets)
processed_data$transformed_s_c = scalling(processed_data$transformed_s_c)
processed_data$serum_sodium = scalling(processed_data$serum_sodium)

## check the results
summary(processed_data)


#=============================================================================== 
# Split the whole dataset into training set and test set ----
#===============================================================================

## set seed for reproducibility
set.seed(123)

## split the dataset
data_split <- initial_split(processed_data, 
                            prop = 3/4, 
                            strata = DEATH_EVENT)
train_data <- training(data_split) 
test_data <- testing(data_split)

## check the results
summary(train_data)
summary(test_data)


## store the training set data in derived data folder
train_data_path = here('01-data','02-derived','train_data.csv')
write.csv(train_data,train_data_path,row.names = FALSE)


## store the test set data in derived data folder
test_data_path = here('01-data','02-derived','test_data.csv')
write.csv(test_data,test_data_path,row.names = FALSE)
