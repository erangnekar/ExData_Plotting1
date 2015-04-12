pwrData <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
pwrData$Date <- as.Date(pwrData$Date, format="%d/%m/%Y")
    
    # Subsetting from the dates 2007-02-01 and 2007-02-02
pwrData <- subset(pwrData, pwrData$Date >= as.Date("2007-02-01") ) 
pwrData <- subset(pwrData, pwrData$Date <= as.Date("2007-02-02") )
pwrData$Time<-paste(pwrData$Date,pwrData$Time,sep="")
pwrData$Time<-strptime(pwrData$Time,format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", width= 480, height = 480, units = "px")

hist(pwrData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()

