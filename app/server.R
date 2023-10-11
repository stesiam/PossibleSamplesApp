server <- function(input, output) {
  
  output$num_srswor <- renderText({ sep_big_num(possible_samples_srswor(input$population, input$sample)) })
  output$num_srswr <- renderText({ sep_big_num(possible_samples_srswr(input$population, input$sample)) })
  output$num_sys <- renderText({ sep_big_num(possible_samples_systematic(input$population, input$sample)) })
  
  
  ## Add dynamic parameters
  
  observeEvent(input$strata, {
    output$inputGroup = renderUI({
      input_list <- lapply(1:input$strata, function(i) {
        # for each dynamically generated input, give a different name
        Np <- paste("N", i, sep = "")
        ns <- paste("n", i, sep = "")
        fluidRow(
          column(2, 
                 paste0("Strata", i)),
          br(),
          column(4,
                 numericInput(Np, Np, 20)
          ),
          column(4,
                 numericInput(ns, ns, 10)
          )
        )
      })
      do.call(tagList, input_list)
    })
  })
  
  output$num_strata = renderText({
    num_pairs <- input$strata
    input_values <- sapply(1:num_pairs, function(i) {
      N <- input[[paste0("N", i)]]
      n <- input[[paste0("n", i)]]
      possible_samples_srswor(N, n)
    })
    sep_big_num(prod(as.numeric(input_values)))
  })
  
}