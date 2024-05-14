# Getting Started

These R scripts provide a complete analysis process, from data preprocessing, and exploratory analysis to modelling.

## Prerequisites

R 4.3.2 and RStudio 2023.12.0.369.

Packages and corresponding version:

-   ggplot2 3.5.1

-   ggExtra 0.10.1

-   dplyr 1.1.4

-   tidyr 1.3.1

-   here 1.0.1

-   reshape2 1.4.4

-   RColorBrewer 1.1-3

-   tidymodels 1.2.0

-   MASS 7.3-60.0.1

-   klaR 1.7-3

-   randomForest 4.7-1.1

# Data transformation

This R script includes the following process:

-   check missing values

-   get the data summary

-   delete the 'time' variable from the dataset because we are not interested in this variable

-   use boxplots of the continuous variables to check for outliers

-   apply log transformation on the ’Creatinine phosphokinase’ variable

-   apply the reciprocal transformation on the ’Serum creatinine’

# Exploratory analysis

This R script includes the following process:

-   get the Heat map of the correlation matrix

-   get the summary of the data

-   get the bar plot of the response variable y

-   get density plots of continuous variables by y groups

-   get bar plots of categorical variables by y group

# Data preparation

This R script includes the following process:

-   standardise all the continuous variables

-   divide the whole dataset into the training set (3750 samples) and test set (1250 samples).

# Modelling

This folder contains 5 R scripts, each conducting a classification model. The whole procedure includes: fitting the model on the training set, getting the model results, applying the model on the test set and getting the confusion matrix.

The 5 classification model includes:

-   Linear discriminant analysis (LDA)

-   Quadratic discriminant analysis (QDA)

-   Naive Bayes

-   Logistic regression

-   Random forest
