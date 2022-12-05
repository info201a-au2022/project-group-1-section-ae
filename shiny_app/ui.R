library("shiny")
library(plotly)
library(tidyverse)
library("shiny")
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
        h3("Summary:"),
        strong("Daisy Shiewoo Lee, Katie Hulst, Rusheel Chande, Yulia Danielyan"),
        p("Our project will be a website that shows many different crimes which you will be able to filter to the crime that you want to see. You can filter out the city you would like to see and view how widely involved this crime is in that area. The user will also be able to control what date they would like to see the data being in, the earliest being the year of 2021 to give a more current timeline. They can filter the distance within the city they are looking at to show how zoomed in or zoomed out they want to see the data. We will be using variations of a color shade to show areas that have a hotter trend of crime and others that lay low with crime. There will be tabs to give other information about the project or information about crime.")
      )
    ),
    
    # Define content for the second page
    page_two <- tabPanel(
      "Scatter Plot", # label for the tab in the navbar
        titlePanel("Scatter Plot"), # show with a displayed title
        # This content uses a sidebar layout
        sidebarLayout(
          sidebarPanel(
            h3("Summary"),
            p("This ")
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
            p("This chart shows the violent crime by population. It highlights 
              certain states rates compared to others and allows the user to see the states
               with the highest and lowest amounts of crime. This shows that states with bigger populations and cities have more crime.")
          ),
          mainPanel(
            plotOutput("line_crime")
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
            
              selectInput("State", "State", 
                          choices=crime_df$State),
              ##hr(),
              ##helpText(""),
              h3("Summary: "),
              p("This chart focuses in on certain states and allows for the amount of violent crime within a state to seen more clearly. It allows for the trends within the data to be more clearly analyzed. ")
          ),
          mainPanel(
            plotOutput("crime_bar_plot")
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
        p("Our findings provide crucial information regarding crime. We analyzed crime all over the United States with a focus on metropolitan counties, what we counted as “cities” and non-metropolitan counties. We analyzed violent crimes, including homicide, rape, robbery, and aggravated assault, and property crimes, which includes burglary, Larceny-theft, motor chicle theft and arson.

It's no secret that crime is everywhere. While we like to believe we would never experience this crime first hand, that is not always the case. Our friends, neighbors and strangers are victims of these crimes. Crime occurs all around our country, in many different forms. Our work provides a reminder that crime happens all around us. It provides a reminder to be vigilant and stay safe. To be aware of your surroundings and be cautious. While we focused on metropolitan areas, where most people expect crime to occur, non-metropolitan areas, where most people expect no crime to occur, also experienced similar trends with the data. While the numbers in the non-metropolitan areas are small, they still exist, and are quite shocking when expecting these numbers to be non-existent, showing the cracks within our society and issues with our policing system. Many other countries have tried different approaches to policing and have been relatively successful. The United States has not tried any new approaches and it’s evident, through our data, that the current system does not work. We need to do something to fix the number of crimes we see in the United States. The number of violent crimes within a county might seem low, but we must remember the context. Within our data there are over two thousand counties included meaning the amount of crimes we see within a year is extremely large. It is also important to note that our data is limited in California, Florida, Illinois, Maryland, New Jersey, New Mexico, New York, and Pennsylvania. This means that states with some of the largest populations are not entirely included due to issues with their police stations reporting procedures. With this context, the numbers are still very large and show that reform is needed.

The United States of America needs to work harder to stop crime. While we understand it would be a bit naive to hope that our findings will cause change, at the very least we hope our findings will provide more evidence for the fight for reform, in the ongoing debate on police reform.")
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
    
