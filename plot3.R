fullData <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
theData <- subset(fullData, Date == "1/2/2007"| Date=="2/2/2007" ,select = c(Date, Time, Sub_metering_1,Sub_metering_2,Sub_metering_3))
theData$DateTime <-strptime(paste(theData$Date,theData$Time), format="%d/%m/%Y %T")
png(filename="plot3.png", width=480, height=480)
with(theData, {
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
  lines(DateTime,Sub_metering_2, type="l", col="red")
  lines(DateTime,Sub_metering_3, type="l", col="blue")
  legend("topright", lty = 1,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
})
dev.off()
