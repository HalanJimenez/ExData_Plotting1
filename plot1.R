##-------Cleaning data-----------
col_classes = c("character", "character", rep("numeric", 7))
data <- read.csv("household_power_consumption.txt", colClasses = col_classes, na.strings=c("?"), sep=";")
data <- within(data, DateTime <- paste(Date, Time, sep=" "))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime = as.POSIXct(strptime(data$DateTime, format = "%d/ %m/%Y %H:%M:%S"))

##-------Plot-------
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()