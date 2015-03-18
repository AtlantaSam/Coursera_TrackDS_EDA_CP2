## plot6.R
## Question: Compare emissions from motor vehicle sources in Baltimore City 
##           with emissions from motor vehicle sources in Los Angeles County, 
##           California (fips == "06037"). Which city has seen greater changes 
##           over time in motor vehicle emissions?

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Libraries
library(ggplot2)
library(plyr)

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get Baltimore and Los Angeles and Combine
geoLoc <- subset (NEI, fips == "24510" | fips == "06037")
#baltimore <- subset (NEI, fips == "24510")
#losAngeles <- subset (NEI, fips == "06037")
#geoComb <- rbind(baltimore, losAngeles)

## Get Emmissions due to motor vehicles in each location
vehicles <- SCC[grepl("*Vehicles", SCC$EI.Sector),]
geoLocV <- geoLoc[geoLoc$SCC %in% vehicles$SCC,]
geoSum <- ddply(geoLocV, c("year", "fips"), summarise, Emissions = sum(Emissions))
geoLabel <- ifelse(geoSum$fips == "06037", "Los Angeles", "Baltimore")

# Step 5: plotting to png
png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot6.png")
qplot(main="Question 6\n 1998 to 2014",
      sub="1998 to 2014",
      data=geoSum,
      x=year, 
      xlab="Year",
      y=Emissions, 
      ylab="Emissions",
      color=geoLabel,
      geom="line")
dev.off()


# Step 5: plotting to png
png("plot6.png")
qplot(year, Emissions, data=geoSum, 
      geom="line", color=geoLabel) + 
      ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) + 
      xlab("Year") + 
      ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
dev.off()




