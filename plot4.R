## plot4.R
## Question: Across the United States, how have emissions from coal 
##           combustion-related sources changed from 1999–2008?

## Set working directory
setwd("~/Documents/data/coursera/EDA_CP2")

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("/Users/samedgemon/GitHub/Coursera_EDA_CP/Coursera_TrackDS_EDA_CP2/plot4.png")
coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Emissions from Coal Combustion Sources\n 1999 to 2008", 
     ylab = expression("PM2.5 Emission"))

dev.off()
