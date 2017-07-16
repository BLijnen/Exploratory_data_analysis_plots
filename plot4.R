# Import datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset coal combustion related sources
sub_coal<- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
emissions<- aggregate(Emissions ~ year, data=sub_coal, FUN=sum)

# Plot emissions from coal combustion related sources from 1999-2008 across the United States

png("plot4.png")

library(ggplot2)

x<-ggplot(emissions, aes(year, Emissions))
x<-x + geom_point(shape=18, col="blue", size=3)
x<-x + scale_shape_manual(values = 22:25) + geom_line(col="blue", size=1.3) 
x<-x + scale_x_continuous(breaks = unique(emissions$year))
x<-x + xlab("Year") + ylab("Total Emissions (tons)")
x<-x + ggtitle("Emissions of PM2.5 accross the US (1999-2008)\nfrom coal combustion related sources")
x<-x + theme(plot.title = element_text(hjust = 0.5))
x
dev.off()