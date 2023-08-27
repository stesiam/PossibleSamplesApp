ui <- page_sidebar(
  includeCSS("www/custom.css"),
  
  title = "Possible Samples Calculator",
  windowTitle = "Possible Samples", 
  
  sidebar = sidebar(
    width = 350,
    selectInput(
      inputId = "method_sampling",
      label = "Choose your sampling method",
      choices =
        c(
          "SRSWOR" = "srswor",
          "SRSWR" = "srswr",
          "Systematic" = "systematic",
          "Stratified" = "stratified"
        ),
      selected = "srswor"
    ),
    conditionalPanel(
      condition = "input.method_sampling == 'srswor' || input.method_sampling == 'srswr' || input.method_sampling == 'systematic'",
      numericInput(
        inputId = "population",
        label = "Population size",
        value = 20
      ),
      numericInput(
        inputId = "sample",
        label = "Sample size",
        value = 5
      )
    ),
    conditionalPanel(
      condition = "input.method_sampling == 'stratified'",
      sliderInput(
        inputId = "strata",
        label = "Number of Strata",
        min = 1,
        max = 4,
        step = 1,
        value = 1
      ),
      uiOutput("inputGroup")
    ),
  ),
  
  mainPanel(
    tags$div(
      conditionalPanel(condition = "input.method_sampling == 'srswor'",
                       verbatimTextOutput("num_srswor")),
      conditionalPanel(condition = "input.method_sampling == 'srswr'",
                       verbatimTextOutput("num_srswr")),
      conditionalPanel(condition = "input.method_sampling == 'systematic'",
                       verbatimTextOutput("num_sys")),
      conditionalPanel(condition = "input.method_sampling == 'stratified'",
                       verbatimTextOutput("num_strata")),
      class = "results")
    
  ) # end sidebarLayout 
  
) # end fluidPage