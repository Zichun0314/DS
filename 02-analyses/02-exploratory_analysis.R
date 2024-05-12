#=============================================================================== 
# Import data and package ----
#===============================================================================
library(ggplot2)
library(ggExtra)
library(dplyr)
library(tidyr)
library(here)
library(reshape2)
library(RColorBrewer)

tr_data_path = here('01-data','02-derived','transformed_data.csv')
plot_data = read.csv(tr_data_path)


#=============================================================================== 
# Heat map of the correlation matrix ----
#===============================================================================

## change into shorter column name
colnames(plot_data)[3] = 'transformed_CPK'
colnames(plot_data)[8] = 'transformed_s_c'

## compute correlation matrix
cor_matrix = cor(plot_data)

## melting the correlation matrix
melted_cor_matrix = melt(cor_matrix)

## heat map
ggplot(data = melted_cor_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = sprintf("%.2f", value)), color = "white", size = 3) +
  scale_fill_gradientn(colors = brewer.pal(11, "RdBu"), limits = c(-1, 1)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), axis.title = element_blank(),
        legend.key.height = unit(30, "pt")) +
  labs(title = "Correlation Matrix", fill = "Correlation")


#=============================================================================== 
# Summary of the data ----
#===============================================================================

## change the categorical variables into factor

plot_data$anaemia = as.factor(plot_data$anaemia)
plot_data$diabetes = as.factor(plot_data$diabetes)
plot_data$high_blood_pressure = as.factor(plot_data$high_blood_pressure)
plot_data$sex = as.factor(plot_data$sex)
plot_data$smoking = as.factor(plot_data$smoking)
plot_data$DEATH_EVENT = as.factor(plot_data$DEATH_EVENT)

## summary of the data
summary(plot_data)


#=============================================================================== 
# Barplot of Y ----
#===============================================================================

ggplot(plot_data, aes(x = DEATH_EVENT)) +
  geom_bar(fill = c('#F66068','#206095'), color = "black",width = 0.3,alpha = 0.85) + 
  labs(x = "Death Event", y = "Count", title = "Distribution of Death Events") +
  ylim(0,4000)+
  theme_minimal() +
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )


#=============================================================================== 
# Density plots of continuous variables by y groups ----
#===============================================================================

## age
ggplot(plot_data, aes(x = age, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) +  
  labs(x = "Age", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )  


## transformed creatinine phosphokinase
ggplot(plot_data, aes(x = transformed_CPK, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) +  
  labs(x = "Log creatinine phosphokinase", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )  


## ejection fraction
ggplot(plot_data, aes(x = ejection_fraction, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) +  
  labs(x = "Ejection fraction", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )   


## platelets
ggplot(plot_data, aes(x = platelets, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) + 
  labs(x = "Platelets", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )   


## transformed serum creatinine
ggplot(plot_data, aes(x = transformed_s_c, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) +  
  labs(x = "The reciprocal of serum creatinine", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )   

## serum sodium
ggplot(plot_data, aes(x = serum_sodium, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_density(alpha = 0.65) +  
  labs(x = "Serum sodium", y = NULL,
       title = "Density Plot by Group") +
  theme_minimal()+
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )   


#=============================================================================== 
# Barplot of count variables by y group ----
#===============================================================================


## anaemia
ggplot(plot_data, aes(x = anaemia, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_bar(width = 0.4,position = "dodge",alpha = 0.85) + 
  labs( x = 'Anaemia', y = "Count", title = "Distirbution of anaemia by death event") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )


## diabetes
ggplot(plot_data, aes(x = diabetes, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_bar(width = 0.4,position = "dodge",alpha = 0.85) + 
  labs( x = 'Diabetes', y = "Count", title = "Distirbution of diabetes by death event") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )


## high blood pressure
ggplot(plot_data, aes(x = high_blood_pressure, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_bar(width = 0.4,position = "dodge",alpha = 0.85) + 
  labs( x = 'High blood pressure', y = "Count", title = "Distirbution of high blood pressure by death event") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )



## sex
ggplot(plot_data, aes(x = sex, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_bar(width = 0.4,position = "dodge",alpha = 0.85) + 
  labs( x = 'Sex', y = "Count", title = "Distirbution of sex by death event") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )


## smoking
ggplot(plot_data, aes(x = smoking, fill = DEATH_EVENT, color = DEATH_EVENT)) +
  geom_bar(width = 0.4,position = "dodge",alpha = 0.85) + 
  labs( x = 'Smoking', y = "Count", title = "Distirbution of smoking by death event") +
  theme_minimal() +
  scale_fill_manual(values = c('#F66068','#206095')) +  
  scale_color_manual(values = c('#F66068','#206095'))+
  theme(
    plot.title = element_text( face = "bold", size = 15),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 8)
  )

