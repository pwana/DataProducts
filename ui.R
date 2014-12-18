library(shiny)

shinyUI(navbarPage("Results_Tabs",
    tabPanel("Dynamic Adjust and Plots",
             titlePanel("Dynamic Portfolio Allocation"),
    fluidRow(
        
        column(width = 2 ,
            helpText("Enter two symbols for dynamic allocation"),
            
            textInput(inputId="symb_1", label="Asset 1", value="SPY"),
            textInput(inputId="symb_2", label="Asset 2", value="TLT"),
            # Simple integer interval
            sliderInput("alloc", "Allocation Percentage to Asset 1:", 
                        min=0, max=1, value=0.5),
        
            actionButton(inputId = "update", label = "Update Tabular results")),
        
        column(width = 8, 
                    offset = 2,
                    h4("Results Comparison"),
               tableOutput("results")
                    
               )),
    fluidRow(
        column(width= 7,
               offset = 0,
               h4("Allocation Plot"),
               plotOutput("plot")
               ))),
        
    tabPanel("Tabular results",
        column(width = 12, offset = 0,
               h4("Portfolio Rebalance   Peformance Returns Summary:
                    2000-Present"),
                    tableOutput("view")
               )
             )
))

    

