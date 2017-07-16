# Import datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset motor vehicle sources in Baltimore and calculate total emissions by year
motor<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
LA_BAL <- c("24510","06037")
motor2<-subset(motor,fips %in% LA_BAL)

# Plot emissions from motor vehicle sources in Baltimore

png("plot6.png")

library(ggplot2)

x<-ggplot(motor2,aes(year,Emissions,color=fips))
x<-x + geom_line(stat = "summary",fun.y="sum")+ scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))
x<-x + scale_x_continuous(breaks = unique(motor2$year))
x<-x + xlab("Year") + ylab("Emissions from motor vehicle (tons)")
x<-x + ggtitle("Emissions of PM2.5 from motor vehicle sources \nin Baltimore and LA (1999-2008)")
x<-x + theme(plot.title = element_text(hjust = 0.5))
x

dev.off()