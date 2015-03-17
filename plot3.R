## plot3.R
## Question: Of the four types of sources indicated by the type 
## (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
## system to make a plot answer this question.

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Libraries
library(ggplot2)
library(plyr)

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data
baltimore <- subset (NEI, fips == "24510")
typePM25.year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

## Rename column
colnames(typePM25.year)[3] <- "Emissions"

## Plot to png
png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot3.png") 
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + 
  ggtitle(expression("Baltimore" ~ PM2.5 ~ "Emmission by Source, Type and Year")) + 
  xlab("Year") + ylab(expression("Total" ~ PM2.5 ~ "Emissions (tons)"))
dev.off()