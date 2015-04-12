pwrData <- read.table("household_power_consumption.txt", sep = ";" , na.strings="?", header=TRUE)

# Formatting Data column
pwrData$Date <- as.Date(pwrData$Date, format="%d/%m/%Y")

# Subsetting from the dates 2007-02-01 and 2007-02-02
pwrData <- subset(pwrData, pwrData$Date >= as.Date("2007-02-01") )
pwrData <- subset(pwrData, pwrData$Date <= as.Date("2007-02-02") )

# Energy Time. Day + Hour
pwrData$Time<-paste(pwrData$Date,pwrData$Time,sep="")
pwrData$Time<-strptime(pwrData$Time,format = "%Y-%m-%d %H:%M:%S")


# Third plot
png("plot3.png",width=480, height=480, units="px")
plot(pwrData$Time,pwrData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=pwrData$Time,y=pwrData$Sub_metering_1,lty="solid")
lines(x=pwrData$Time,y=pwrData$Sub_metering_2,lty="solid", col="red")
lines(x=pwrData$Time,y=pwrData$Sub_metering_3,lty="solid", col="blue")
legend("topright",lty = "solid", col = c("black","blue", "red"), legend=c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
dev.off()
