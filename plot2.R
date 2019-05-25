# load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

# Plot emissions from all Baltimore City Sources
barplot(
       aggTotalsBaltimore$Emissions,
       names.arg=aggTotalsBaltimore$year,
       xlab="Year",
       ylab="PM2.5 Emissions (Tons)",
       main="Total PM2.5 Emissions From all Baltimore City Sources"
)
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()