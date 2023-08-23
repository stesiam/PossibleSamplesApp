server <- function(input, output) {
  
  output$num_srswor <- renderText({ sep_big_num(possible_samples_srswor(input$population, input$sample)) })
  output$num_srswr <- renderText({ sep_big_num(possible_samples_srswr(input$population, input$sample)) })
  output$num_sys <- renderText({ sep_big_num(possible_samples_systematic(input$population, input$sample)) })
  
  
## Add dynamic parameters
  
 observeEvent(input$strata, {
    output$inputGroup = renderUI({
      input_list <- lapply(1:input$strata, function(i) {
        # for each dynamically generated input, give a different name
        inputNamePop <- paste("N", i, sep = "")
        inputNameSample <- paste("n", i, sep = "")
        fluidRow(
          column(6,
          numericInput(inputNamePop, inputNamePop, 20)
        ),
        column(6,
               numericInput(inputNameSample, inputNameSample, 20)
        )
        )
      })
      do.call(tagList, input_list)
    })
  })
}