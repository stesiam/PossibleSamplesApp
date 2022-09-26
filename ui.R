ui <- fluidPage(
  
  includeCSS("www/custom.css"),
  
  tags$div(
    titlePanel(title = "Possible Samples Calculator", windowTitle = "Possible Samples"),
    id = "title"
  ),
  
  sidebarLayout(
    tags$div(
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
    id = "sidebar"),
    
    mainPanel(
    )
  )
  
) # end fluidPage