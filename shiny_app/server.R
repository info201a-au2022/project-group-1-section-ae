library("shiny")
library(ggplot2)
library(shiny)
library(gsheet)
library(dplyr)
library(ggplot2)

#crime_df <- read_csv("C:\\Users\\Katie\\Documents\\info201\\Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021_2.csv")
crime_df <- gsheet2tbl("https://docs.google.com/spreadsheets/d/1DvqRh0LNJIhLDdJyG5-ZQlFeGucNzO3b/edit#gid=557182089")

#crime_df <- read.csv("../data/Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021.xlsx - in.csv")
state_violent_crime <- crime_df %>% 
  group_by(state_abbreviation) %>% 
  summarize(Violent_crime = sum(Violent_crime, na.rm = TRUE)) %>% 
  select(state_abbreviation, Violent_crime)


# Define a server for the Shiny app

  server <- function(input, output) {
    
    output$line_crime <- renderPlot({
      state_violent_crime %>%
        ggplot(aes(y=Violent_crime, x= state_abbreviation))+
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
        geom_line(aes(group = 1))+
        geom_point()+
        scale_x_discrete(guide = guide_axis(n.dodge= 2))+
        labs(title="Violent Crime by State", x = "States", y = "Violent Crime")
      
      
    })
    
    function(input, output) {
      
      # Fill in the spot we created for a plot
      output$crime_bar_plot <- renderPlot({
        
        plot_bar_crime <- crime_df %>%
          ggplot(aes(y=Violent_crime, x= input$State))+
          
          theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
          scale_x_discrete(guide = guide_axis(n.dodge= 2))+
          labs(title="Violent Crime by State", x = "States", y = "Violent Crime")
        plot_bar_crime
      })
    }
    
    output$property_crime_plot <- renderPlot ({
      ggplot(crime_df, aes(x = state_abbreviation, y = Property_crime))  +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
        geom_point() +
        scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
        labs(title="Property Crime by State in 2021", x = "States", y = "Property Crime")
      
    }) 
    
    output$crime_bar_plot <- renderPlot({
      # data wrangle crime_df
      
      plot_bar_crime <- crime_df %>%
        ggplot(aes(y=Violent_crime, x= input$State))+
        geom_col() +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
        scale_x_discrete(guide = guide_axis(n.dodge= 2))+
        labs(title="Violent Crime by State", x = "States", y = "Violent Crime")
      plot_bar_crime
    })
    
    output$choices <- renderPrint({
      summarize(group_by(crime_df, state))
    })
    
  }