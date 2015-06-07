# read file
dataFile <- "./data/household_power_consumption.txt"
dataFull <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

# get subset of data from 2007-02-01 to 2007-02-02
data <- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007"), ]

# convert date and time to datetime
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# create plot2
plot(datetime, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# save as plot2.png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()