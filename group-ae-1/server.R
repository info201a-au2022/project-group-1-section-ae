#GROUP AE -1
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

state_violent_crime <- crime_df %>% 
  group_by(state_abbreviation) %>% 
  summarize(Violent_crime = sum(Violent_crime, na.rm = TRUE)) %>% 
  select(state_abbreviation, Violent_crime)


# Define server logic required to draw a histogram
server <- function(input, output) {
# SCATTER PLOT ----------------------------------------------------------------
  output$property_crime_plot <- renderPlot ({
    ggplot(crime_df, aes(x = state_abbreviation, y = Property_crime))  +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
      geom_point() +
      scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
      labs(title="Property Crime by State in 2021", x = "States", y = "Property Crime")
    
  }) 

# LINE CHART -------------------------------------------------------------------
  
  output$line_crime <- renderPlot({
    state_violent_crime %>%
      ggplot(aes(y=Violent_crime, x= state_abbreviation))+
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
      geom_line(aes(group = 1))+
      geom_point()
      })
  
#-------------------------------------------------------------------------------
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

}
