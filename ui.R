

library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("BODY MASS Index Calculator"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText("Shiny application helps you to find your BMI"),            
      br(),           
      numericInput("ing_weight_kg",label = h4("Please enter your weight (KG)"),min = 40, max = 300,0), #, value = 70
      br(),
      numericInput("int_height_cm",label = h4("Please enter your height (CM)"),min = 50, max = 250,0), #,value = 170
      br(),
      
      br(),   
      actionButton("FindBMI", label = "Your BMI is")    
      
      
    ),
    mainPanel
    (
      tabsetPanel
      (
        tabPanel("Your BMI Description",
                 p(h4("your current measures:")),
                 textOutput("current_height"),
                 textOutput("current_weight"),
                 br(),
                 p(h4("Please see Your BMI below:")),
                 textOutput("BMI_result"),
                 p(h4("Please see your BMI classification below:")),
                 textOutput("status_indicator")
                 
        ),
        tabPanel(
          "BMI",
          p(h4("Body Mass Index Application")),
          br(),
          helpText("Shiny application calculates your BMI based on your current weight and height"),
          p(h4("the World Health Organization (WHO) proposes the following classification")),
          p(h5("BMI <18.5 : Underweight")),
          p(h5("BMI [18.5-24.9] : Normal weight")),
          p(h5("BMI [25-29.9] : Overweight")),
          p(h5("BMI >=30 : Obesity"))
          
          
          )
        
        
      )
    )
  )
))