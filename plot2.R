fullData <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
theData <- subset(fullData, Date == "1/2/2007"| Date=="2/2/2007" ,select = c(Date, Time, Global_active_power))
theData$DateTime <-strptime(paste(theData$Date,theData$Time), format="%d/%m/%Y %T")
png(filename="plot2.png", width=480, height=480)
with(theData, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()