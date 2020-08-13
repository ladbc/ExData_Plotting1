# plot3.R created by Leticia Cunha 
# R code that using the Eletric Power Consumption dataset in the dates 2007-02-01 and 2007-02-02 plots
#   histogram of Global Active Power

#Reading the data
#Data files should already be contained in the current directory
power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power <- power[(power$Date == "1/2/2007"| power$Date == "2/2/2007"),]

#Creating a veriable in the dataset for date and time
library(dplyr)
power <- mutate(power, Date_Time = paste(power$Date, power$Time, sep = " "))
power$Date_Time <- strptime(power$Date_Time, format = "%d/%m/%Y %H:%M:%S") 

#Plot
png('plot3.png', width = 480, height = 480, units = "px")
par(mfrow = c(1,1), mar = c(6,5,2,2))
with(power, plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(power, points(Date_Time, Sub_metering_1, type = "l"))
with(power, points(Date_Time, Sub_metering_2, col="red", type = "l"))
with(power, points(Date_Time, Sub_metering_3, col="blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1, cex=0.6)
dev.off()