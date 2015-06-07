# read file
dataFile <- "./data/household_power_consumption.txt"
dataFull <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

# get subset of data from 2007-02-01 to 2007-02-02
data <- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007"), ]

# create plot1
hist(as.numeric(data$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# save as plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()