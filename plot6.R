## Reading rds
summarySCC_PM25 <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
sourceClassificationCode <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(data.table)
library(ggplot2)

vehScc <- sourceClassificationCode[grep("Vehicle",sourceClassificationCode$Short.Name),]


mergedSummary<- merge(summarySCC_PM25[summarySCC_PM25$fips %in% c("24510","06037"),], vehScc, by="SCC", all=FALSE)
dt <- data.table(mergedSummary)
dtEmissions <- dt[,list(emissions=sum(Emissions)),by=c("fips","year")]

g <- ggplot(data=dtEmissions,aes(x=year,y=emissions,color=fips, group=fips))+geom_line() 
print(g);

dev.copy(png, file = "plot6.png")
dev.off()