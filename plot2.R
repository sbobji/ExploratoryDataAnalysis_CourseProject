## Reading rds
summarySCC_PM25 <- readRDS("summarySCC_PM25.rds")
str(summarySCC_PM25)
names(summarySCC_PM25)[5:6]<-c("Type", "Year")
head(summarySCC_PM25)

sourceClassificationCode <- readRDS("Source_Classification_Code.rds")
str(sourceClassificationCode)
head(sourceClassificationCode)

dt<-summarySCC_PM25[summarySCC_PM25$fips=="24510",]
dtEmissions<-tapply(dt$Emissions, dt$Year, sum)
png(filename = "plot2.png")
plot(names(dtEmissions), dtEmissions, col="blue", type='l', xaxt="n", xlab="Year", ylab="Total Emissions (tons)", main=expression(paste("PM"[2.5], "Emissions in Baltimore City, Maryland")))
axis(1, at=names(dtEmissions), labels=names(dtEmissions))
dev.off()








