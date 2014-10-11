## Plot 3

# Read in and subset data
alldata <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric", 
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings="?")
d <- subset(alldata, (Date == "1/2/2007" | Date == "2/2/2007"))

# Write colored line graphs to a 480x480 png, with appropriate X axis labels
png(file = "plot3.png", width = 480, height = 480, units = "px") 
plot(d$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt = "n", xlab="")
numItems <- length(d$Global_active_power)
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
legend("topright", col = c("black", "blue", "red"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


