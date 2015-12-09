##This script reads household_power_consumption.txt, subsets it between the dates of
##Feb. 1 & 2 2007 and plots all submetering data as a function of time

#Read data, format 2nd column as times & dates, subset it for desired date range
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdatasubset <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ]

##Set graphics device, plot all submetering data, close device
png("plot3.png", width=480, height=480)
plot(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_2,col="Red")
lines(x=powerdatasubset$Time, y=powerdatasubset$Sub_metering_3,col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
