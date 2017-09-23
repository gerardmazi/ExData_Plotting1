#######################################################################################################################################
#
#                                       Coursera - Exploratory Data Analysis - Week 1 Assignment
#                                                               Plot 4
#
#######################################################################################################################################
# Gerard Mazi
# 09/22/2017
# Plot 4

setwd("~//Coursera/ExData_Plotting1")

# Download and unzip files
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "electric.zip")
unzip(zipfile = "electric.zip")

library(data.table)

# Load data into R
electric = fread(input = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Date and time formatting
electric$Date = as.Date(x = electric$Date, format = "%d/%m/%Y")

# Select targeted dates for analysis
electric = electric[electric$Date == "2007-02-01" | electric$Date == "2007-02-02",]

######################################################################################################################################
# Plot 4
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(x = electric$Global_active_power, type = "l", xaxt = 'n', ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side = 1, at = c(1,nrow(electric)/2,nrow(electric)), labels = c("Thu", "Fri", "Sat"))

plot(x = electric$Voltage, type = "l", xaxt = 'n', ylab = "Voltage", xlab = "datetime")
axis(side = 1, at = c(1,nrow(electric)/2,nrow(electric)), labels = c("Thu", "Fri", "Sat"))

plot(x = electric$Sub_metering_1, type = "l", xaxt = 'n', ylab = "Enegry sub metering", xlab = "")
lines(x = electric$Sub_metering_2, col = "red")
lines(x = electric$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1,nrow(electric)/2,nrow(electric)), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

plot(x = electric$Global_reactive_power, type = "l", xaxt = 'n', ylab = "Global Reactive Power", xlab = "datetime")
axis(side = 1, at = c(1,nrow(electric)/2,nrow(electric)), labels = c("Thu", "Fri", "Sat"))

dev.off()
