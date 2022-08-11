#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates resting metabolic rate 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Resting Metabolic Rate Calculator"),
  
  # Sidebar with a multiple inputs
  sidebarLayout(
    sidebarPanel(
      
      
      h5("Please complete the fields below to calculate your resting metabolic rate."),
      
      
      radioButtons("gender", "Gender", 
                   choices = c("Male" = "Male",
                               "Female" = "Female"),
                   selected = "Male"),
      
      
      
      numericInput("age", "Age (years)", 
                   value = 50,
                   min = 1,
                   max = 130,
                   step = 1),
      
      
      
      numericInput("weight", "Weight (kg)",
                   value = 50,
                   min = 5,
                   max = 200,
                   step = 1),
      
      
      
      numericInput("height", "Height (cm)",
                   value = 180,
                   min = 50,
                   max = 250,
                   step = 1),
      
      
      
      selectInput("exercise", "Level of Exercise",
                  choices = c("Sedentary (little to no exercise)" = "Sedentary (little to no exercise)",
                              "Lightly active (exercise 1-3 days/week)" = "Lightly active (exercise 1-3 days/week)",
                              "Moderately active (exercise 3-5 days/week)" = "Moderately active (exercise 3-5 days/week)",
                              "Active (exercise 6-7 days/week)" = "Active (exercise 6-7 days/week)",
                              "Very active (vigorous exercise 6-7 days/week)" = "Very active (vigorous exercise 6-7 days/week)"),
                  selected = "Lightly active (exercise 1-3 days/week)"), 
      
      
      submitButton("Calculate"),
      
      
      
      h6("Calculations are derived using the Mifflin-St Jeor Equation."),
      
      
    ),
    
    
    # Show results
    mainPanel(
      
      h4("Gender:"),
      textOutput("gender"),
      h4("Age:"),
      textOutput("age"),
      h4("Weight:"),
      textOutput("weight"),
      h4("Height:"),
      textOutput("height"),
      h4("Level of Exercise:"),
      textOutput("exercise"),
      
      
      
      h4("Resting Metabolic Rate:"),
      textOutput("resting"),   
      
      
      
      h4("Resting Metabolic Rate Accounting for Exercise Level:"),
      textOutput("rates"),
      
      
    )
  )
))
