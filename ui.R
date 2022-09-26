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
      ),
      conditionalPanel(
        condition = "input.method_sampling == 'srswor' || input.method_sampling == 'srswr' || input.method_sampling == 'systematic'",
        numericInput(inputId = "population", label = "Population size", value = 20),
        numericInput(inputId = "sample", label = "Sample size", value = 5)
      ),
    ),
    id = "sidebar"),
    
    mainPanel(
    )
  )
  
) # end fluidPage