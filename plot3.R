## Reading rds
summarySCC_PM25 <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
sourceClassificationCode <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(data.table)
library(ggplot2)

dt <- data.table(summarySCC_PM25[summarySCC_PM25$fips=="24510",])
dtEmissions <- dt[,list(emissions=sum(Emissions)),by=c("type","year")]

g <- ggplot(data=dtEmissions,aes(x=year,y=emissions, color=type,group=type))+geom_line() 
print(g);

dev.copy(png, file = "plot3.png")
dev.off()