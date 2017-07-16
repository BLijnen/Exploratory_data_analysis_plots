# Import datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset motor vehicle sources in Baltimore and calculate total emissions by year
motor<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]
emissions<- aggregate(Emissions ~ year, data=motor, FUN=sum)


# Plot emissions from motor vehicle sources in Baltimore

png("plot5.png")

library(ggplot2)

x<-ggplot(emissions, aes(year, Emissions))
x<-x + geom_point(shape=18, col="orange", size=3)
x<-x + scale_shape_manual(values = 22:25) + geom_line(col="orange", size=1.3) 
x<-x + scale_x_continuous(breaks = unique(emissions$year))
x<-x + xlab("Year") + ylab("Total Emissions (tons)")
x<-x + ggtitle("Emissions of PM2.5 from motor vehicle sources \nin Baltimore (1999-2008)")
x<-x + theme(plot.title = element_text(hjust = 0.5))
x
dev.off()