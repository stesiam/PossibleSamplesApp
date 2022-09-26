ui <- fluidPage(
  
  includeCSS("www/custom.css"),
  
  tags$div(
    titlePanel(title = "Possible Samples Calculator", windowTitle = "Possible Samples"),
    class = "title"
  ),
  
  sidebarLayout(
    sidebarPanel(
      br(),
      selectInput(inputId = "method_sampling",
                  label = "Choose your sampling method", 
                  choices = 
                    c("SRSWOR" = "srswor",
                      "SRSWR" = "srswr",
                      "Systematic" = "systematic",
                      "Stratified" = "stratified"
                    ),
                  selected = "srswor"
      )  
    ),
    
    mainPanel(
      tags$h3("Possible Samples")
    )
  )
  
) # end fluidPage