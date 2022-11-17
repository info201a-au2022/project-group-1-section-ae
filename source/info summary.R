library(tidyverse)

counties<- read.csv("../data/Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
View(counties)
summary_info <- list()
summary_info$num_observations <- nrow(counties)
summary_info$violent_max_value <- counties %>%
  filter(highest_violent_crime == max(violent, na.rm = T)) 
summary_info$property_max_value <- counties %>%
  filter(highest_property_crime == max(property, na.rm = T)) 
summary_info$num_property_crimes <- sum(counties$Property.crime, na.rm = T)
summary_info$num_violent_crimes <- sum(counties$Violent.crime, na.rm = T)
