library(shiny)
library(tidyverse)
# Define UI for random distribution app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      sliderInput("n",
                  "Number of observations:",
                  value = 500,
                  min = 1,
                  max = 1000)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {
  # Generate a plot of the data ----
  # Also uses the inputs to build the plot label. Note that the
  # dependencies on the inputs and the data reactive expression are
  # both tracked, and all expressions are called in the sequence
  # implied by the dependency graph.
  output$plot <- renderPlot({
    d<-data.frame(normales=rnorm(input$n))
    ggplot(d,aes(normales)) + geom_histogram()
  })
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    d<-rnorm(input$n)
    summary(d)
  })
  
  # Generate an HTML table view of the data ----
  output$table <- renderTable({
    d<-rnorm(input$n)
    d
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
