## Shiny app

library(shiny)
template for all Shiny apps. When publishing on server, use app.R file with your app inside it, but this should be in a folder with all the needed data etc. 
You will need to clsose R serevr to by "control c"

ui <- fluidPage(
sliderInput(inputId = "num", label = "Choose Mean of Y", min = 0, max = 100, value = 5),
sliderInput(inputId = "num2", label = "Choose Mean of X", min = 0, max = 100, value = 5), 
plotOutput("plot")
) # Writes the HTMl code for your shiny app

server <- function(input, output){
	output$plot <- renderPlot({
		x <- rnorm(100, input$num2, 1)
		y <- rnorm(100, 0.8*x + input$num, 1)
		plot(x,y, pch = 16, cex = 1.2, las = 1, ylab = "Y variable", xlab = "X variable", font = 2)
		})
} # Tells the server how to change the code to update the us

shinyApp(ui = ui, server = server) # "knits" the server code and html code together so they can talk to each other