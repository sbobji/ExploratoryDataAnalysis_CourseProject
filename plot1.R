## Reading rds
summarySCC_PM25 <- readRDS("summarySCC_PM25.rds")

str(summarySCC_PM25)
names(summarySCC_PM25)[5:6]<-c("Type", "Year")
head(summarySCC_PM25)

sourceClassificationCode <- readRDS("Source_Classification_Code.rds")
str(sourceClassificationCode)
head(sourceClassificationCode)

dtEmissions<-tapply(summarySCC_PM25$Emissions,summarySCC_PM25$Year, sum)
png(filename = "plot1.png")
plot(names(dtEmissions), dtEmissions, col="blue", type='l', xaxt="n", xlab="Year", ylab="Total Emissions (tons)", main=expression(paste("PM"[2.5]," Emissions in USA")))
axis(1, at=names(dtEmissions), labels=names(dtEmissions))
dev.off()









dev.off()