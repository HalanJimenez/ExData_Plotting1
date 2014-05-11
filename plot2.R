##-------Cleaning data-----------
col_classes = c("character", "character", rep("numeric", 7))
data <- read.csv("household_power_consumption.txt", colClasses = col_classes, na.strings=c("?"), sep=";")
data <- within(data, DateTime <- paste(Date, Time, sep=" "))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime = as.POSIXct(strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S"))

##-------Plot-------
png(filename="plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()