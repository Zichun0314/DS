#=============================================================================== 
# Import data and package ----
#===============================================================================
library(ggplot2)
library(ggExtra)
library(dplyr)
library(tidyr)
library(here)

data_path = here('01-data','01-raw',"heart_failure_clinical_records.csv")
data = read.csv(data_path)


#=============================================================================== 
# Initial look at the data ----
#===============================================================================

## data information
head(data,5)
str(data)

## check missing value
sum(is.na(data)) ## there is no missing values

## data summary
summary(data)

## omit 'time' for further analyses, 
## because we are not interested in this variable
data = data[,-12]


#=============================================================================== 
# Check for outliers ----
#===============================================================================

## boxplot of the continuous variables 
par(mfrow = c(2, 3))  
boxplot(data$age~data$DEATH_EVENT , main = "Age", 
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(data$creatinine_phosphokinase~data$DEATH_EVENT, main = "Creatinine Phosphokinase",
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(data$ejection_fraction~data$DEATH_EVENT, main = "Ejection Fraction",
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(data$platelets~data$DEATH_EVENT, main = "Platelets",
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(data$serum_creatinine~data$DEATH_EVENT , main = "Serum Creatinine",
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(data$serum_sodium~data$DEATH_EVENT, main = "Serum Sodium",
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))


#=============================================================================== 
# Transformation ----
#===============================================================================

transformed_data = data

## CPK -- log transformation
transformed_data$creatinine_phosphokinase = log(transformed_data$creatinine_phosphokinase)
colnames(transformed_data)[3] = 'transformd_creatinine_phosphokinase'

## serum_creatinine -- reciprocal transformation
transformed_data$serum_creatinine = 1/transformed_data$serum_creatinine
colnames(transformed_data)[8] = 'transcormed_serum_creatinine'

## check the results -- look better
par(mfrow = c(1, 2))
boxplot(transformed_data$transformd_creatinine_phosphokinase~transformed_data$DEATH_EVENT , 
        main = "Log Creatinine Phosphokinase", 
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))
boxplot(transformed_data$transcormed_serum_creatinine ~transformed_data$DEATH_EVENT, 
        main = "The reciprocal of Serum Creatinine", 
        xlab = "Death event", ylab = NULL,col=c('#F66068','#206095'))


## store the transformed data in derived data folder
tr_data_path = here('01-data','02-derived','transformed_data.csv')
write.csv(transformed_data,tr_data_path,row.names = FALSE)
