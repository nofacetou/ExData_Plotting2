#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("exdata-data-NEI_data.zip", overwrite=FALSE)
#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balt = NEI[NEI$fips == "24510",]
require("ggplot2")
g = ggplot(balt, aes(x = year, y= Emissions, color = type))
png(file = "ExData_Plotting2/figure/plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
g + geom_line(stat="summary", fun.y="sum") + ylab(expression('total PM'[2.5]*" emission in Baltimore"))
dev.off()