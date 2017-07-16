# Import datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate and plot total PM2.5 emission from all Baltimore city sources (1999 - 2008)

Baltimore<- NEI[NEI$fips=="24510",]
total_Baltimore <- aggregate(Emissions ~ year, Baltimore,sum)

png(filename="~/Coursera/plot2.png")

par(mar=c(5.1, 5.1, 4.1, 4.2))
plot(total_Baltimore$year, total_Baltimore$Emissions,xaxt="n",yaxt="n",xlab="",ylab="", ylim=c(0,3500),
     type="b", main="Total PM2.5 Emissions from all Baltimore city sources (1999-2008)")
axis(side=1,at=seq(1999,2008,3),tcl=0.4,lwd.ticks=3,mgp=c(0,0.5,0))
mtext(side=1,text="Year",line=1.5) 
axis(side=2,at=seq(0,3500,500), las=2)
mtext(side=2,text="Emissions (tons)",line=3.8)


dev.off()