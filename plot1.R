# setwd('./ExData_Plotting1/')
library(data.table)
library(lubridate)

## Read in the data
all.data <- fread("../household_power_consumption.txt" , header = TRUE , sep = ";" , na.strings = "?")

## Convert Date column from character to POSIXt
all.data$Date <- dmy(all.data$Date)

## Subset Data to just the two specified dates
two.days <- subset(all.data , Date == ymd("2007-02-01") | Date == ymd("2007-02-02") )

## Convert Date and Time columns to DateTime column
DateTime <- ymd_hms(paste( two.days$Date , two.days$Time , sep = " "))
two.days <- cbind(two.days , DateTime )

## Convert other character-class columns to numeric
two.days$Global_active_power <- as.numeric(two.days$Global_active_power)
two.days$Global_reactive_power <- as.numeric(two.days$Global_reactive_power)
two.days$Voltage <- as.numeric(two.days$Voltage)
two.days$Global_intensity <- as.numeric(two.days$Global_intensity)
two.days$Sub_metering_1 <- as.numeric(two.days$Sub_metering_1)
two.days$Sub_metering_2 <- as.numeric(two.days$Sub_metering_2)
two.days$Sub_metering_3 <- as.numeric(two.days$Sub_metering_3)

## Create the PNG on which to plot
png(filename = "plot1.png")

##  Plot
hist(two.days$Global_active_power, col = "red" , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")

## Close plotting device
dev.off()
