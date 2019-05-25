# load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum of the total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

# Plot emissions from all US Sources

barplot(
       (aggTotals$Emissions)/10^6,
       names.arg=aggTotals$year,
       xlab="Year",
       ylab="PM2.5 Emissions (10^6 Tons)",
       main="Total PM2.5 Emissions From All US Sources"
)
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


