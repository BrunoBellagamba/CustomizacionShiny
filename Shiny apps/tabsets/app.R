

library(shiny)

ui <- fluidPage(
  
  # Titulo de la app
  titlePanel("Tabsets"),
  
  # Usamos un sidebar layout
  sidebarLayout(
    
    # Usamos sidebarPanel para los inputs
    sidebarPanel(
      #Esto crea un boton para seleccionar el tipo de distribucion que se quiere
      radioButtons("dist", "Distribucion:",
                   c("Normal" = "norm",
                     "Uniforme" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponencial" = "exp")),
    
      br(),
      
      # Creamos una barrita para el numero de observaciones
      sliderInput("n",
                  "Numero de observaciones",
                  value = 500,
                  min = 1,
                  max = 1000)
      
    ),
    
    #Panel principal para los outputs
    mainPanel(
      
      #Usamos 3 pestañas para mostrar un grafico, un summary y una tabla
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)


server <- function(input, output) {
  d <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    dist(input$n)
  })
  
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    
    hist(d(),
         main = paste("r", dist, "(", n, ")", sep = ""),
         col = "#75AADB", border = "white")
  })

  output$summary <- renderPrint({
    summary(d())
  })

  output$table <- renderTable({
    d()
  })
  
}

shinyApp(ui, server)

