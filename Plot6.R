#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("exdata-data-NEI_data.zip", overwrite=FALSE)
#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the datase to keep Baltimore Motor related data only
balt_LA = NEI[NEI$fips == "24510"|NEI$fips == "06037",]
moto=SCC[grepl("Moto",SCC$Short.Name),1]
balt_LA_moto = balt_LA[balt$SCC %in% moto,]
require("ggplot2")
g = ggplot(balt_LA_moto, aes(x = year, y= Emissions, color = fips))
png(file = "ExData_Plotting2/figure/plot6.png", width = 480, height = 480, units = "px", bg = "transparent")
g + geom_line(stat="summary", fun.y="sum") + ylab(expression('Total PM'[2.5]*" emission from motor vehicle sources in Baltimore and LA")) 
+  scale_colour_discrete(name  ="City", label=c("Los Angeles","Baltimore"))
dev.off()