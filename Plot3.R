#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("exdata-data-NEI_data.zip", overwrite=FALSE)
#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the datase to keep coal combustion-related data only
coalSCC <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE) & grepl("(?=.*coal)(?=.*comb)", SCC$EI.Sector, ignore.case=TRUE, perl=TRUE),1]
coal = NEI[NEI$SCC %in% coalSCC,]
require("ggplot2")
g = ggplot(balt, aes(x = year, y= Emissions))
png(file = "ExData_Plotting2/figure/plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
g + geom_line(stat="summary", fun.y="sum") + ylab(expression('Total Coal Combustion-related PM'[2.5]*" emission "))
dev.off()