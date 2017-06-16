

library(shiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  bmivalues <- reactiveValues()
  
  observe({
    input$FindBMI
    bmivalues$bmi <- isolate({
      
      input$ing_weight_kg/(input$int_height_cm/100 * input$int_height_cm/100)
      
      
      
    })
  })
  
  
  
  # Display your current values
  output$current_height <- renderText({
    input$FindBMI
    paste("Your Height in CM :", isolate(input$int_height_cm))
  })
  
  output$current_weight <- renderText({
    input$FindBMI
    paste("Your Weight in KG : ", isolate(input$ing_weight_kg))
  })
  
  
  output$status_indicator <- renderText({
    
    
    if(input$FindBMI == 0) ""
    else {
      
      if (bmivalues$bmi < 18.5)
      {
        bmivalues$status_indicator = "Underweight"
        
      }
      
      else if (bmivalues$bmi < 24.9)
      {
        bmivalues$status_indicator="Normal weight"
      }
      else if (bmivalues$bmi < 29.9)
      {
        bmivalues$status_indicator="Overweight"
      }
      else
      {
        bmivalues$status_indicator="Obesity"
      }
      
      
      paste("Classification according to BMI: ", bmivalues$status_indicator)
    }
  })
  
  
  # Display your BMI
  
  output$BMI_result <- renderText({
    if(input$FindBMI == 0) ""
    else
      paste("Your current BMI is:", bmivalues$bmi)
  })
  
})