#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("exdata-data-NEI_data.zip", overwrite=FALSE)
#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the datase to keep Baltimore Motor related data only
balt = NEI[NEI$fips == "24510",]
moto=SCC[grepl("Moto",SCC$Short.Name),1]
balt_moto = balt[balt$SCC %in% moto,]
require("ggplot2")
g = ggplot(balt_moto, aes(x = year, y= Emissions))
png(file = "ExData_Plotting2/figure/plot5.png", width = 480, height = 480, units = "px", bg = "transparent")
g + geom_line(stat="summary", fun.y="sum") + ylab(expression('Total PM'[2.5]*" emission from motor vehicle sources in Baltimore"))
dev.off()