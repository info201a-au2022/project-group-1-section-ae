#GROUP AE-1


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
      #img(src="C:\\Users\\Katie\\Documents\\info201\\assignments\\project-group-1-section-ae\\docs\\crime_img.JPG"),
      h3("Project Cop"),
      strong("Daisy Shiewoo Lee, Katie Hulst, Rusheel Chande, Yulia Danielyan"),
      p("ProjectCop analyzes a dataset that contains crime statistics from each 
        county in the United States. We look at the trends and correlations between 
        location in the US and crime density. We attempt to see how crime varies 
        from state to state and make a conclusion. We also attempt to see how types
        of crime and prevalence of certain crimes vary from each state. Our dataset only
        contains dates, crime statistics, and location. To make a conclusion from just this
        data won’t be easy, which is why we will use further data researched on our own, 
        such as population, to make a solid conclusion. Our main goal is to see 
        how crime varies from state to state in the United States.")
    )
  ),
  
  # Define content for the second page
  page_two <- tabPanel(
    "Scatter Plot", # label for the tab in the navbar
    titlePanel("Scatter Plot"), # show with a displayed title
    # This content uses a sidebar layout
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "Property_crime",
                    label = "Property Crime",
                    multiple = TRUE,
                    choices = crime_df$state_abbreviation,
                    selected = crime_df$state_abbreviation
        ),
        h3("Summary"),
        p("This chart shows the violent crime by population. It highlights 
          certain states rates compared to others and allows the user to see the states
          with the highest and lowest amounts of crime. This shows that states 
          with bigger populations and cities have more crime.")
      ),
      mainPanel(
        plotOutput("property_crime_plot")
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
        p("This visualization shows the property crime per state. The slider can
        be used to filter out different states that have different levels of 
        crime and change the scale of the visualization. As shown in the chart, 
        states that have higher populations such as Texas have higher amounts of
        property crimes. This line graph shows the amount of violent crime that 
          occurred in each state in 2021. Differences can be seen among states 
          that have higher populations and lower populations. The slider can be 
          used to filter out different states that have different levels of crime
          and change the scale of the visualization. All in all a positive 
          correlation is shown between higher populations and higher amounts of crimes.")
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
          p("This visualization shows the crime and can filter down to each 
            individual state showing a more clear graph that can be used to 
            analyze how crime varies from state to state. As shown by this 
            visualization among the others, a connection is seen between the 
            population and crime. For example states like Texas having a lot 
            more crime than other states.")
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
      p("Our findings provide crucial information regarding crime. We analyzed 
      crime all over the United States with a focus on metropolitan counties, 
      what we counted as “cities” and non-metropolitan counties. We analyzed 
      violent crimes, including homicide, rape, robbery, and aggravated assault,
      and property crimes, which includes burglary, Larceny-theft, motor chicle 
      theft and arson. It's no secret that crime is everywhere. While we like to
      believe we would never experience this crime first hand, that is not always
      the case. Our friends, neighbors and strangers are victims of these crimes.
      Crime occurs all around our country, in many different forms. Our work 
      provides a reminder that crime happens all around us. It provides a reminder
      to be vigilant and stay safe. To be aware of your surroundings and be 
      cautious. While we focused on metropolitan areas, where most people expect
      crime to occur, non-metropolitan areas, where most people expect no crime 
      to occur, also experienced similar trends with the data. While the numbers
      in the non-metropolitan areas are small, they still exist, and are quite 
      shocking when expecting these numbers to be non-existent, showing the cracks
      within our society and issues with our policing system. Many other countries
      have tried different approaches to policing and have been relatively 
      successful. The United States has not tried any new approaches and it’s 
      evident, through our data, that the current system does not work. We need 
      to do something to fix the number of crimes we see in the United States. 
      The number of violent crimes within a county might seem low, but we must 
      remember the context. Within our data there are over two thousand counties
      included meaning the amount of crimes we see within a year is extremely 
      large. It is also important to note that our data is limited in California,
      Florida, Illinois, Maryland, New Jersey, New Mexico, New York, and 
      Pennsylvania. This means that states with some of the largest populations 
      are not entirely included due to issues with their police stations 
      reporting procedures. With this context, the numbers are still very large 
      and show that reform is needed. The United States of America needs to work
      harder to stop crime. While we understand it would be a bit naive to hope
      that our findings will cause change, at the very least we hope our 
      findings will provide more evidence for the fight for reform, in the 
      ongoing debate on police reform.")
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