ui<-(fluidPage(
  
  titlePanel("Sidebars"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("obs", "Numero de observaciones",  
                  min = 1, max = 1000, value = 500)
    ),
    
    mainPanel(
      plotOutput("hist")
    )
  )
))
server <- function(input, output){
  output$hist <- renderPlot({
    dat<- data.frame(normales=rnorm(input$obs))
    ggplot(dat,aes(normales)) + geom_histogram()})
}
shinyApp(ui,server)
