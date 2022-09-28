server <- function(input, output) {
  
  output$num_srswor <- renderText({ sep_big_num(possible_samples_srswor(input$population, input$sample)) })
  output$num_srswr <- renderText({ sep_big_num(possible_samples_srswr(input$population, input$sample)) })
  output$num_sys <- renderText({ sep_big_num(possible_samples_systematic(input$population, input$sample)) })
}