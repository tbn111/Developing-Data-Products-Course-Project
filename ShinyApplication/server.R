#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to calculate resting metabolic rate
shinyServer(function(input, output) {
  
  output$gender <- renderText(input$gender)
  
  output$age <- renderText(input$age)
  
  output$weight <- renderText(input$weight)
  
  output$height <- renderText(input$height)
  
  output$exercise <- renderText(input$exercise)
  
  
  
  
  resting_metabolic_rate <- function(gender, age, height, weight) {
    if (gender == "Male")  {
      metabolic_rate <- round((10 * weight) + (6.25 * height) - (5 * age) + 5)}
    else {metabolic_rate <- round((10 * weight) + (6.25 * height) - (5 * age) - 161)}
    return(metabolic_rate)
  }

  
  output$resting <- renderText({resting_metabolic_rate(input$gender, input$age, input$height, input$weight)})
  

  
  rate <- function(gender, age, weight, height, exercise)  {
    if (gender == "Male") {
      metabolic_rate <- round((10 * weight) + (6.25 * height) - (5 * age) + 5)}
    else {metabolic_rate <- round((10 * weight) + (6.25 * height) - (5 * age) - 161)}
    if (exercise == "Sedentary (little to no exercise)")  {exercise_rate <- round(metabolic_rate * 1.2)}
    else if (exercise == "Lightly active (exercise 1-3 days/week)") {exercise_rate <- round(metabolic_rate * 1.375)}
    else if (exercise == "Moderately active (exercise 3-5 days/week)")  {exercise_rate <- round(metabolic_rate * 1.55)}
    else if (exercise == "Active (exercise 6-7 days/week)") {exercise_rate <- round(metabolic_rate * 1.725)}
    else {exercise_rate <- round(metabolic_rate * 1.9)}
    return(exercise_rate)
  }
  
  
  output$rates <- renderText({rate(input$gender, input$age, input$weight, input$height, input$exercise)})
  
  
  
})
