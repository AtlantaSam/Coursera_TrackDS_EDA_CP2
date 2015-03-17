## plot2.R
## Question: Have total emissions from PM2.5 decreased in the 
##           Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##           Use the base plotting system to make a plot answering this question.

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset dataset
baltimore <- subset (NEI, fips == "24510")
total.PM25yr <- tapply(baltimore$Emissions, baltimore$year, sum)

## Plot to png
png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot2.png")
plot(names(total.PM25yr), total.PM25yr, type = "l", xlab="Year", 
     ylab= expression("Total" ~ PM2.5 ~ "Emissions (tons)"), 
     main=expression("Total for Baltimore" ~ PM2.5 ~ "Emissions by Year"), col = "blue")
dev.off()  