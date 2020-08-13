# plot1.R created by Leticia Cunha 
# R code that using the Eletric Power Consumption dataset in the dates 2007-02-01 and 2007-02-02 plots
#   histogram of Global Active Power

#Reading the data
#Data files should already be contained in the current directory
power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power <- power[(power$Date == "1/2/2007"| power$Date == "2/2/2007"),]

#Plot
png('plot1.png')
with(power, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
                 ylab = "Frequency", main = "Global Active Power"))
dev.off()
