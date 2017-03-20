shinyUI(
  pageWithSidebar(   
    headerPanel("Time Series"),   sidebarPanel(
      textInput("text", label = h6("Input comma delimited data"), value = "1.3, 2.9, 0.5, 2.1, 4.3")
    ),
    mainPanel(
      plotOutput('tsplot')   
    ) 
  )
)