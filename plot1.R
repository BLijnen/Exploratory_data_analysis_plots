# Import datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate and plot total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

total_pm2.5 <- aggregate(Emissions ~ year,NEI, sum)

png(filename="~/Coursera/plot1.png")

plot(total_pm2.5$year, total_pm2.5$Emissions/(10^6),xaxt="n",yaxt="n",xlab="",ylab="", ylim=c(0,8), 
     type="b", main="Total PM2.5 Emissions for all US sources (1999-2008)")
axis(side=1,at=seq(1999,2008,3),tcl=0.4,lwd.ticks=3,mgp=c(0,0.5,0))
mtext(side=1,text="Year",line=1.5) 
axis(side=2,at=seq(0,8,1))
mtext(side=2,text=expression("Emissions in 10"^6 * "tons"),line=2.2)

dev.off()

