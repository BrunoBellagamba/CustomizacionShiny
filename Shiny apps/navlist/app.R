

ui<-fluidPage(
  
  titlePanel("Ejemplo de Navlist"),
  
  navlistPanel(
    "Nro de panel",
    tabPanel("1",
             h3("Primer panel")
    ),
    tabPanel("2",
             h3("Segundo panel")
    ),
    tabPanel("3",
             h3("Tercer panel")
    )
  )
)

server<-function(input, output) {
  
}

shinyApp(ui, server)

