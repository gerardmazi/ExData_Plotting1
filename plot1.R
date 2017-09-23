#######################################################################################################################################
#
#                                       Coursera - Exploratory Data Analysis - Week 1 Assignment
#                                                               Plot 1
#
#######################################################################################################################################
# Gerard Mazi
# 09/22/2017
# Plot 1

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
# Plot 1
png(filename = "plot1.png", width = 480, height = 480)

hist(x = electric$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     col = "red")

dev.off()
