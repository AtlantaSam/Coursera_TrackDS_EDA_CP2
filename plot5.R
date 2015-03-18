## plot5.R
## Question: How have emissions from motor vehicle sources changed 
##           from 1999–2008 in Baltimore City?

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get Baltimore
baltimore <- subset (NEI, fips == "24510" | type == "ON-Road")

#par("mar"=c(5.1, 4.5, 4.1, 2.1))
png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot5.png")
vehicle <- grep("vehicle", SCC$Short.Name, ignore.case = T)
vehicle <- SCC[vehicle, ]
vehicle <- baltimore[baltimore$SCC %in% vehicle$SCC, ]
VehicleEmissions <- aggregate(vehicle$Emissions, list(vehicle$year), FUN = "sum")

plot(VehicleEmissions, type = "l", xlab = "Year", 
     main = "Emissions From Motor Vehicle Sources\n 1999 to 2008 in the City of Baltimore", 
     ylab = expression("Total PM2.5 Emission"))

dev.off()