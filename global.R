library(dplyr)
library(reshape2)
library(tidyr)
library(lubridate)

clean <- function(x) {
  x = tbl_df(read.csv(file=x,head=T))
  x$Time <- mdy_hm(x$Time,tz="America/New_York")
  x$Day <- day(x$Time)
  x$Month <- month(x$Time)
  x$Year <- year(x$Time)
  x$Date <- date(x$Time)
  daily.data <<- x %>%
    group_by(Date) %>%
    summarize(daily.sum=sum(kWh,na.rm=TRUE)) %>%
    mutate(aerator=daily.sum-runif(length(daily.sum),0,2)*1.7) %>%
    mutate(led = daily.sum-runif(length(daily.sum),1,5)*2.4) %>%
    mutate(shower = daily.sum-runif(length(daily.sum),0,1)*1.6) %>%
    gather(key,value,-Date)
} 


