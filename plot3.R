# Import datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create subset voor Baltimore data and calculate emissions by type and year

Baltimore<- NEI[NEI$fips=="24510",]
type_year<- aggregate(Emissions ~ type * year, data = Baltimore, FUN = sum)

# Plot total emissions in Baltimore from 1999-2008 for the four types of sources indicated by the type variable

png(filename="~/Coursera/plot3.png")
library(ggplot2)
x<-ggplot(type_year, aes(year, Emissions))
x<- x + geom_point(size = 3, aes(color = type, shape = type, fill = type))
x<-x + scale_shape_manual(values = 22:25) + geom_line(aes(color = type)) 
x<-x + scale_x_continuous(breaks = unique(Baltimore$year))
x<-x + xlab("Year") + ylab("Total Emissions (tons)")
x<-x + ggtitle("Emissions of PM2.5 in the Baltimore City by Four Types of Sources")
x

dev.off()