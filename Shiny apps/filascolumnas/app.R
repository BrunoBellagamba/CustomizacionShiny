

ui<-fluidPage(
  fluidRow(
    column(4,
           sliderInput("Barrita1", label = h3("Barrita 1"), min = 0, 
                       max = 100, value = 50)
    ),
    column(4,
           sliderInput("Barrita2", label = h3("Barrita 2"), min = 0, 
                       max = 100, value = c(40, 60))
    )
  ),
  hr(),
  
  fluidRow(
    column(4, verbatimTextOutput("value")),
    column(4, verbatimTextOutput("range"))
  ),
  fluidRow(
    column(4,offset = 8,"Este texto esta a la derecha"),
    column(4,"Este texto esta a la izquierda")
  )
  
)


server<-function(input, output) {
  
  output$value <- renderPrint({ input$Barrita1 })
  
  output$range <- renderPrint({ input$Barrita2 })
}
shinyApp(ui, server)

