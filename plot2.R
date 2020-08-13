# plot2.R created by Leticia Cunha 
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
png('plot2.png')
with(power, plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()