setwd("~/Documents/info201/group_project/project-group-1-section-ae/data")

crime_df <- read_csv("Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
library(readr)
library(dplyr)
library(ggplot2)

plot_crime <- crime_df %>%
  ggplot(aes(y=Violent_crime, x= state_abbreviation))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
  geom_col()+
  scale_x_discrete(guide = guide_axis(n.dodge= 2))+
  labs(title="Violent Crime by State", x = "States", y = "Violent Crime")

#This chart shows all violent crime that happened in each state in 2021. It is displayed as a bar graph with many 
#observations included in the chart. This provides numbers on crime in 
#a variety of violent crime like rape or homicide to give an idea of which state is more dangerous than the
#other. 