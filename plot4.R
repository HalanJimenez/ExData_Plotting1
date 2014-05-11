##-------Cleaning data-----------
col_classes = c("character", "character", rep("numeric", 7))
data <- read.csv("household_power_consumption.txt", colClasses = col_classes, na.strings=c("?"), sep=";")
data <- within(data, DateTime <- paste(Date, Time, sep=" "))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime = as.POSIXct(strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S"))

##-------Plot-------
png(filename="plot4.png", width = 480, height = 480)
par(mfrow=(c(2,2)))

# Upper Left
plot(data$DateTime, data$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power")

# Upper Right
plot(data$DateTime, data$Voltage, col="black", type="l", xlab="datetime", ylab="Voltage")

# Bottom Left
plot(data$DateTime, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red", type="l")
lines(data$DateTime, data$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")

# Bottom Right
plot(data$DateTime, data$Global_reactive_power, col="black", type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()