## Reading rds
summarySCC_PM25 <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
sourceClassificationCode <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(data.table)
library(ggplot2)

coalScc <- sourceClassificationCode[grep("Coal",sourceClassificationCode$Short.Name),]
coalAndCombScc <- coalScc[grep("Comb",coalScc$Short.Name),]

mergedSummary<- merge(summarySCC_PM25, coalAndCombScc, by="SCC", all=FALSE)
dt <- data.table(mergedSummary)
dtEmissions <- dt[,list(emissions=sum(Emissions)),by=c("year")]

g <- ggplot(data=dtEmissions,aes(x=year,y=emissions))+geom_line() 
print(g);

dev.copy(png, file = "plot4.png")
dev.off()