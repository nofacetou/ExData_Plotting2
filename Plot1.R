#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("exdata-data-NEI_data.zip", overwrite=FALSE)
#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
m = aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)
png(file = "ExData_Plotting1/figure/plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(m$Group.1, m$x, type = "l", ylab = expression('total PM'[2.5]*" emission"), xlab = "Year")
dev.off()