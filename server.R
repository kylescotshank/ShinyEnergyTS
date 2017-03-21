library(ggplot2)
library(dplyr)
library(RCurl)
library(scales)
source("global.R")


shinyServer(function(input, output) {
  
  output$text1 <- renderText({
    daily.data <- clean("example.csv")
    real.val <- round(sum(filter(daily.data,key=="daily.sum")$value)*0.02,2)
    if (input$radio == 0) {
    value <- round(sum(filter(daily.data,key=="daily.sum")$value)*0.02,2)
    } else if (input$radio == 1) {
      value <- round(sum(filter(daily.data,key=="led")$value)*0.02,2)
    } else if (input$radio == 2) {
      value <- round(sum(filter(daily.data,key=="aerator")$value)*0.02,2)
    } else if (input$radio == 3) {
      value <- round(sum(filter(daily.data,key=="shower")$value)*0.02,2)
    }
    paste("You will pay approximately", paste("$",value,sep=""), "a month for your electricity",sep=" ")
  })
  
  output$text2 <- renderText({
    v.1 <- round(sum(filter(daily.data,key=="led")$value)*0.02,2)
    v.2 <- round(sum(filter(daily.data,key=="aerator")$value)*0.02,2)
    v.3 <- round(sum(filter(daily.data,key=="shower")$value)*0.02,2)
    if (input$radio == 0){
    } else if (input$radio == 1){
      paste("You will save approximately", paste("$",round(real.val-v.1,2),sep=""), "a year on your electricity bill", sep= " ")
    } else if (input$radio == 2){
      paste("You will save approximately", paste("$",round(real.val-v.2,2),sep=""), "a year on your electricity bill", sep= " ")
    } else if (input$radio == 3){
      paste("You will save approximately", paste("$",round(real.val-v.3,2),sep=""), "a year on your electricity bill", sep= " ")
    }
  })
  
  output$plot1 <- renderPlot({
    daily.data <- clean("example.csv")
  
    if (input$radio == 0) {
      p <- ggplot(subset(daily.data,key=="daily.sum"),aes(Date,value)) + 
        geom_line(color="black") + 
        theme_bw() +
        scale_x_date(labels = date_format("%m/%Y")) + 
        xlab("Date") + 
        ylab("Daily Total kWh")
      if (input$checkbox == FALSE) {
        print(p)
      } else {
        p <- p+stat_smooth(span=0.2) 
        print(p)
      }
    } else if (input$radio == 1) {
      p <- ggplot(subset(daily.data,key=="led"),aes(Date,value)) + 
        geom_line(aes(Date,value),subset(daily.data,key=="daily.sum"),color="grey") +
        geom_line(color="red") + 
        theme_bw() +
        scale_x_date(labels = date_format("%m/%Y")) + 
        xlab("Date") + 
        ylab("Daily Total kWh") 
      if (input$checkbox == FALSE) {
        print(p)
      } else {
        p <- p+stat_smooth(span=0.2) 
        print(p)
    }
    } else if (input$radio == 2) {
      p <- ggplot(subset(daily.data,key=="aerator"),aes(Date,value)) + 
        geom_line(aes(Date,value),subset(daily.data,key=="daily.sum"),color="grey") +
        geom_line(color="purple") + 
        theme_bw() +
        scale_x_date(labels = date_format("%m/%Y")) + 
        xlab("Date") + 
        ylab("Daily Total kWh") 
      if (input$checkbox == FALSE) {
        print(p)
      } else {
        p <- p+stat_smooth(span=0.2) 
        print(p)
      }
    } else if (input$radio == 3) {
      p <- ggplot(subset(daily.data,key=="shower"),aes(Date,value)) + 
        geom_line(aes(Date,value),subset(daily.data,key=="daily.sum"),color="grey") +
        geom_line(color="green") + 
        theme_bw() +
        scale_x_date(labels = date_format("%m/%Y")) + 
        xlab("Date") + 
        ylab("Daily Total kWh") 
      if (input$checkbox == FALSE) {
        print(p)
      } else {
        p <- p+stat_smooth(span=0.2) 
        print(p)
      }
    }
  })

})