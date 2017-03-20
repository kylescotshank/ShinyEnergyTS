require(graphics) 

shinyServer(function(input, output, session) {
  output$tsplot <- renderPlot({
    x <- as.numeric(strsplit(input$text, split = ",")[[1]])
    ts.obj <- ts(x)
    lowess.obj <- lowess(ts.obj, f = 10)
    plot.ts(x, main = "Sample Time Series", xlab = "Time")
    points(x)
    lines(lowess.obj$y, col = "red")
    legend("top", legend = "Loess Smoother", col = "red", lty = 1)
  })
})