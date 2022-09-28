ui <- fluidPage(
  
  includeCSS("www/custom.css"),
  
  tags$div(
    titlePanel(title = "Possible Samples Calculator", windowTitle = "Possible Samples"),
    id = "title"
  ),
  
  sidebarLayout(
    tags$div(
    sidebarPanel(width = 4,
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
      conditionalPanel(
        condition = "input.method_sampling == 'stratified'",
        sliderInput(inputId = "strata", label = "Number of Strata", min = 1, max = 4, step = 1, value = 1),
        fluidRow(column(6,
                        numericInput(inputId = "N1", label = "N_1", value = 20)),
                 column(6,
                        numericInput(inputId = "n1", label = "n_1", value = 20)))
      ),
    ),
    id = "sidebar"),
    
    mainPanel(
      conditionalPanel(
        condition = "input.method_sampling == 'srswor'",
        verbatimTextOutput("num_srswor")
      ),
      conditionalPanel(
        condition = "input.method_sampling == 'srswr'",
        verbatimTextOutput("num_srswr")
      ),
      conditionalPanel(
        condition = "input.method_sampling == 'systematic'",
        verbatimTextOutput("num_sys")
      ),
    )
  )
  
) # end fluidPage