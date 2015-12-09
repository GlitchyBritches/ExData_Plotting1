##This script reads household_power_consumption.txt, subsets it between the dates of
##Feb. 1 & 2 2007 and plots global active power, submetering, voltage and global
##reactive power as a function of time in 4 separate graphs

#Read data, format 2nd column as times & dates, subset it for desired date range
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdatasubset <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ]

#Active graphics device, set number off graphs, graph data in each graph, close graphics device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(x=powerdatasubset$Time, y=powerdatasubset$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
plot(x=powerdatasubset$Time, y=powerdatasubset$Voltage,type="l",xlab="datetime",ylab = "Voltage")
plot(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_2,col="Red")
lines(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_3,col="Blue")
plot(x=powerdatasubset$Time, y=powerdatasubset$Global_reactive_power,type="l",xlab="datetime",ylab = "Global_reactive_power")
dev.off()