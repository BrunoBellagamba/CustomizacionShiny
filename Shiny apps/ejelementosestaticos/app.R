
ui <- fluidPage(
  "Este es un texto comun y corriente, le podesmos cambiar el tamaño utilizando
  los tags h1() - h6()",
  tags$h1("Este es un texto grande"),
  tags$h2("Este es un texto algo grande"),
  tags$h3("Este es un texto mediano"),
  tags$h6("Este es un texto chiquito"),
  "Podemos añadir un link con el tag a()",
  tags$a(href="https://www.google.com.uy/","Si me das click voy a google"),
  tags$p("Tambien podemos escribir usando parrafos"),
  tags$p("Utilizando el tag p()"),
  tags$em("Este es un texto mas lindo en italica"),
  tags$br(),
  tags$hr(),
  tags$p(tags$code("ERROR 420 EMPEZANDO AUTODESTRUCCION")),
  tags$img(height=1000,width=1000,src="http://www.onlygfx.com/wp-content/uploads/2017/01/comic-boom-explosion-2-1017x1024.png")
)
server <- function(input, output)
shinyApp(ui = ui, server = server)
  