
library(shiny)

ui <- fluidPage(
  titlePanel("Ejemplo de Tabset"),
  tabsetPanel(
    tabPanel("Pestaña 1","Aqui colocamos lo que queremos en la pestaña 1 "),
    tabPanel("Pestaña 2","Aqui colocamos lo que queremos en la pestaña 2 "),
    tabPanel("Pestaña 3","Aqui colocamos lo que queremos en la pestaña 3 ")
  )
)
server <- function(input, output){}
shinyApp(ui = ui, server = server)

