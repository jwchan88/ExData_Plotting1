# read file
dataFile <- "./data/household_power_consumption.txt"
dataFull <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

# get subset of data from 2007-02-01 to 2007-02-02
data <- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007"), ]

# convert date and time to datetime
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# create plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, as.numeric(data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub metering")
lines(datetime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")

plot(datetime, as.numeric(data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# save as plot4.png - note: dev.copy leads to differences in formatting
# dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()