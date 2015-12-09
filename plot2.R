##This script reads household_power_consumption.txt, subsets it between the dates of
##Feb. 1 & 2 2007 and plots global active power as a function of time

#Read data, format 2nd column as times & dates, subset it for desired date range
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdatasubset <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ]

##Set graphics device, plot using lines, close device
png("plot2.png", width=480, height=480)
plot(x=powerdatasubset$Time, y=powerdatasubset$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
