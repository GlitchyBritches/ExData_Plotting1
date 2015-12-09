##This script reads household_power_consumption.txt, subsets it between the dates of
##Feb. 1 & 2 2007 and plots a histogram of global active power

#Read Data & Format Date Column as date
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#Set grapics device, make histogram plot, turn off device
png("plot1.png", width=480, height=480)
hist(powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02", ]$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab="Frequency",col="Red",main="Global Active Power")
dev.off()