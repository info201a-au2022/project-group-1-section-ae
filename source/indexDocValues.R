library(tidyverse)

counties<- read.csv("../data/Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
View(counties)

number_of_columns <- ncol(counties)
number_of_rows <- nrow(counties)
num_violent <- counties$Violent_crime
max_violent_crimes <- max(num_violent)
num_property <- counties$Property_crime
max_propery_crime <- max(num_property)
num_murder <- counties$Murder
max_murder <- max(num_murder)
