shinyUI(fluidPage(
  titlePanel("Your Personalized Energy Savings!"),
  
  sidebarLayout(
    sidebarPanel(
      p("Select a measure of interest from the list below"),
      p("Each measure will alter your expected energy consumption and update
        your expected monthly bill amount"),
      
      radioButtons("radio", label = h2("Available Measures"), 
                         choices = list("None" = 0,
                                        "LED Lightbulbs"=1,
                                        "Faucet Aerator"=2,
                                        "Low Flow Showerhead"=3),
                         selected = NULL),
      h2("Add a trend line?"),
      checkboxInput("checkbox", label = "See your trend?", value = FALSE)
      
      ),
    mainPanel(
      h3("This is an example of 8 months of consumption data"),
      textOutput("text1"),
      textOutput("text2"),
      plotOutput("plot1")
    )
  )
))