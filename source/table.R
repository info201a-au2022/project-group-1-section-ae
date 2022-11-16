library(tidyverse)
library(lubridate)

counties<- read.csv("C:\\Users\\Katie\\Documents\\info201\\Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021_2.csv")
View(counties)

counties<- counties %>%
  mutate(total_crime = colSums((counties[c(Violent.crime, Property.crime),], na.rm = TRUE)))

group_state <- counties %>%
  group_by(State)%>%
  summarize(County, Violent.crime, Property.crime)
  #mutate(total_crime = colSums((counties[c(Violent.crime, Property.crime) ], na.rm = TRUE)))

View(group_state)
