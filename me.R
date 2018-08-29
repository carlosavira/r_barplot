getwd()   #get current working directory
setwd("/Users/carlosabiera/Desktop/R/")  #set working directory

hh <- read.csv("household2015/data.csv")  #importing csv files to current wd
hh
head(hh) #shows top part of df
tail(hh) #shows bottom part of df
str(hh) #structure of df
summary(hh) #summary of df
names(hh) #shows df header
help(hist) #shows manual how to use hist function

##### HIST: Population by Age #####

hist(hh$age,
     main=paste("Histogram of Population Age"),
     xlab="Age", ) #shows the frequency age  

##### BAR: Population by Region #####
library(ggplot2)
region<-as.data.frame(table(substr(hh$w_regn, start = 1, stop = 10))) #remove string from region
ggplot(region, aes(x=region$Var1, y=region$Freq)) + geom_bar(stat="identity") + 
  labs(x="Region", y="Population")


##### BAR: Population by Region #####
# Stacked Bar Plot with Colors and Legend
library(plyr)
library(reshape2)

jobs<-as.data.frame(count(hh, c("w_regn", "job")))
job_plot <-ggplot(data = jobs, 
       aes(x = jobs$w_regn, y = jobs$freq, fill = jobs$job)) + geom_bar(stat = "identity")


##### BAR: Region with Electricity #####
# Stacked Bar Plot with Colors and Legend

hh$electric
rgn_elec<-as.data.frame(table(hh$w_regn,hh$electric))
xlab("Region")

ylab("Population")

ggtitle("label", subtitle = NULL)


elect_plot <-ggplot(data = rgn_elec, 
                  aes(x = rgn_elec$Var1, y = rgn_elec$Freq, fill = rgn_elec$Var2)) + geom_bar(stat = "identity") +
  labs(x="Region", y="Population", fill="Legend") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))



