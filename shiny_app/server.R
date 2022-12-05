library("shiny")
library(ggplot2)
library(shiny)
library(gsheet)
library(dplyr)
library(ggplot2)


crime_df <- read_csv("C:\\Users\\Katie\\Documents\\info201\\assignments\\project-group-1-section-ae\\data\\Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
##violent_crimes<- c(crime_df$Murder,	crime_df$Rape, crime_df$Robbery, crime_df$Aggravated_assault)
##property_crime<- c(crime_df$Burglary, crime_df$Larceny-theft,	crime_df$vehicle_theft, crime_df$Arson)
state_property_crime <- crime_df %>% 
  group_by(state_abbreviation) %>% summarise(Property_crime = sum(Property_crime)) %>% select(state_abbreviation, Property_crime)

crime_df <- gsheet2tbl("https://docs.google.com/spreadsheets/d/1DvqRh0LNJIhLDdJyG5-ZQlFeGucNzO3b/edit#gid=557182089")
state_violent_crime <- crime_df %>% 
  group_by(state_abbreviation) %>% 
  summarize(Violent_crime = sum(Violent_crime, na.rm = TRUE)) %>% 
  select(state_abbreviation, Violent_crime)


# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$crime_plot <- renderPlot({
    
      #barplot(crime_df[,input$State], 
              #main=input$State,
              #ylab="Number of Telephones",
              #xlab="Year")
    
    plot_bar_crime <- crime_df %>%
      ggplot(aes(y=Violent_crime, x= input$State))+
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
      geom_col()+
      scale_x_discrete(guide = guide_axis(n.dodge= 2))+
      labs(title="Violent Crime by State", x = "States", y = "Violent Crime")
    
      })
}
  server <- function(input, output) {
    
    output$plot_crime <- renderPlot({
      state_violent_crime %>%
        ggplot(aes(y=input$Violent_crime, x= state_abbreviation))+
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
        geom_line(aes(group = 1))+
        geom_point()+
        scale_x_discrete(guide = guide_axis(n.dodge= 2))+
        labs(title="Violent Crime by State", x = "States", y = "Violent Crime")
      
      
    })
  }