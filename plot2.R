pwrData <- read.table("household_power_consumption.txt", sep = ";" , na.strings="?", header=TRUE)


pwrData$Date <- as.Date(pwrData$Date, format="%d/%m/%Y")


pwrData <- subset(pwrData, pwrData$Date >= as.Date("2007-02-01") )
pwrData <- subset(pwrData, pwrData$Date <= as.Date("2007-02-02") )


pwrData$Time<-paste(pwrData$Date,pwrData$Time,sep="")
pwrData$Time<-strptime(pwrData$Time,format = "%Y-%m-%d %H:%M:%S")


png("plot2.png",width=480, height=480, units="px")
plot(pwrData$Time,pwrData$Global_active_power, type="l", ylab="Global Active Power (kilowats)", xlab="")
dev.off()

