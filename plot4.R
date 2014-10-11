## Plot 4

# Read in and subset data
alldata <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric", 
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings="?")
d <- subset(alldata, (Date == "1/2/2007" | Date == "2/2/2007"))

png(file = "plot4.png", width = 480, height = 480, units = "px") 
par(mfcol = c(2, 2))

# sub plot 1
plot(d$Global_active_power, type="l", ylab="Global Active Power", xaxt = "n", xlab="")
numItems <- length(d$Global_active_power)
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))

# sub plot 2
plot(d$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt = "n", xlab="")
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
legend("topright", col = c("black", "blue", "red"), lty=1, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#sub plot 3
plot(d$Voltage, type="l", ylab="Voltage", xaxt = "n", xlab="datetime")
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))

#sub plot 4
plot(d$Global_reactive_power, type="l", ylab="Global_reactive_power", xaxt = "n", xlab="datetime")
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))

# Close and write to png
dev.off()

