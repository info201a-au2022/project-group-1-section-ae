setwd("~/Documents/info201/group_project/project-group-1-section-ae/data")

crime_df <- read_csv("Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
library(readr)
library(dplyr)
library(ggplot2)

state_property_crime <- crime_df %>% 
  group_by(state_abbreviation) %>% summarise(Property_crime = sum(Property_crime)) %>% select(state_abbreviation, Property_crime)

property_crime_plot <- state_property_crime %>% 
  ggplot(aes(y= Property_crime, x= state_abbreviation))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
  geom_point()+
  scale_x_discrete(guide = guide_axis(n.dodge= 2))+
  labs(title="Property Crime by State in 2021", x = "States", y = "Property Crime")
property_crime_plot

#This chart shows all the property crime that happened in 2021 in each state. All activity that happened in each
#county was added all together by state and produced as a scatter plot. I included the property crime in this chart
#because it shows a variety of crime in this category that happened in each state. Because there are so many states
#it was difficult to fit the labels in a normal way.