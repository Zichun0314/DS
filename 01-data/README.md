# Raw data

The raw data comes from the [Kaggle website](https://www.kaggle.com/datasets/aadarshvelu/heart-failure-prediction-clinical-records/data). There are 5000 medical records in the dataset and the clinical features are as follows:

-   age: age of the patient (years)

-   anaemia: decrease of red blood cells or hemoglobin (0:No, 1:Yes)

-   creatinine phosphokinase (CPK): level of the CPK enzyme in the blood (mcg/L)

-   diabetes: if the patient has diabetes (0:No, 1:Yes)

-   ejection fraction: percentage of blood leaving the heart at each contraction

-   high blood pressure: if the patient has hypertension (0:No, 1:Yes)

-   platelets: platelets in the blood (kiloplatelets/mL)

-   sex: 0: woman, 1: man

-   serum creatinine: level of serum creatinine in the blood (mg/dL)

-   serum sodium: level of serum sodium in the blood (mEq/L)

-   smoking: If the patient smokes or not (0:No, 1:Yes)

-   time: follow-up period (days)

-   DEATH EVENT: if the patient died during the follow-up period (0:No, 1:Yes)

# Derived data

## Transformed data

The following is done in the data transformation R script to get the transformed data:

-   delete the 'time' variable from the dataset

-   apply log transformation on the ’Creatinine phosphokinase’ variable

-   apply the reciprocal transformation on the ’Serum creatinine’

## Train data and test data

The following is done in the data preparation R script to get the train data and test data:

-   standardize all the continuous variables

-   divide the whole dataset into the training set (3750 samples) and test set (1250 samples).
