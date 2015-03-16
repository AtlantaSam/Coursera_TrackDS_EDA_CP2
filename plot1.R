## plot1.R
## Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##           Using the base plotting system, make a plot showing the total PM2.5 emission from 
##           all sources for each of the years 1999, 2002, 2005, and 2008.

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tot.PM25yr <- tapply(NEI$Emissions, NEI$year, sum)

### Plot to png
png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot1.png")
plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM2.5 ~"Emissions (tons)"), main = expression("Total US" ~ 
                                                                  PM2.5 ~ "Emissions by Year"), col="Blue")
dev.off()