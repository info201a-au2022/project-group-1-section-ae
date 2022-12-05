library("shiny")
library(plotly)
library(tidyverse)
library("shiny")
library(ggplot2)
library(shiny)
library(gsheet)
library(dplyr)
library(ggplot2)

crime_df <- read_csv("C:\\Users\\Katie\\Documents\\info201\\Table_10_Offenses_Known_to_Law_Enforcement_by_State_by_Metropolitan_and_Nonmetropolitan_Counties_2021_2.csv")


# Use a fluid Bootstrap layout
fluidPage(    
    
    # Define the first page content; uses `tabPanel()` and `sidebarLayout()`
    # layout functions together (as an example)
  page_one <- tabPanel(
    "Introduction", # label for the tab in the navbar
    titlePanel("Introduction"), # show with a displayed title
      mainPanel(
        h3("Primary Content"),
        p("Insert Introduction here:")
      )
    ),
    
    # Define content for the second page
    page_two <- tabPanel(
      "Map", # label for the tab in the navbar
        titlePanel("Map"), # show with a displayed title
        # This content uses a sidebar layout
        sidebarLayout(
          sidebarPanel(
            h3("Summary"),
            p("Insert summary paragraph here:")
          ),
          mainPanel(
            h3("Primary Content"),
            p("Plots, data tables, etc. would go here")
          )
        )
    ),
    
    # Define content for the third page
    page_three <- tabPanel(
      "Line Graph",
      titlePanel("Violent Crime in 2021"),
        # This content uses a sidebar layout
        sidebarLayout(
          sidebarPanel(
            sliderInput(inputId = "Violent_crime",
                        label = "Number of Crime:",
                        min = 0,
                        max = 30000,
                        value = 30,
            ),
            
            h3("Summary:"),
            p("Insert summary paragraph here:")
          ),
          mainPanel(
            plotOutput("plot_crime")
          )
        )
    ),
    
# Chart 3  ----------------------------------------------------------
    page_four <- tabPanel(
      "Bar Chart", # label for the tab in the navbar
      # Give the page a title
        titlePanel("Bar Chart"), # show with a displayed title
        
        # This content uses a sidebar layout
        sidebarLayout(
          sidebarPanel(
            
            sidebarPanel(
              selectInput("State", "State", 
                          choices=crime_df$State),
              ##hr(),
              ##helpText(""),
              h3("Summary: "),
              p("Plots, data tables, etc. would go here")
          )
          ),
          mainPanel(
            plotOutput("plot_bar_crime")
          #)
        )
      )
    ),
      
      # Summary  ----------------------------------------------------------
    page_five <- tabPanel(
      "Summary", # label for the tab in the navbar
      mainPanel(
        h3("Takeaways"),
        p("- Overall, a higher crime rate is seen in places more populated such as cities. Rural areas experience less crime. However, the data shows that location doesn’t equate to crime perfectly as states like South Dakota and Georgia experienced 15,000 violent crimes in 2021."),
        p(" - Crime is lowest in states with low populations. There aren’t trends that show a relationship between crimes and location, other than population size. Populated states such as California, Florida, Illinois, Maryland, New Jersey, New Mexico, New York, Pennsylvania, Texas, and Georgia have the most crime."),
        p("- Crime is where people are. Every state recorded crime that is seen at higher numbers in places with more people, but also exists in rural areas.")
      )
    ),
    
    page_six <- tabPanel(
      "Report", # label for the tab in the navbar
      mainPanel(
        h3("Report: "),
        p("Insert Report Here:")
        )
    )
)
    
    
    # Pass each page to a multi-page layout (`navbarPage`)
    ui <- navbarPage(
     "Crime Report", # application title
     page_one,         # include the first page content
     page_two,         # include the second page content
     page_three,        # include the third page content
     page_four, 
     page_five, 
     page_six
  )
    
