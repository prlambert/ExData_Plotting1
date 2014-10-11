## Plot 2

# Read in and subset data
alldata <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric", 
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings="?")
d <- subset(alldata, (Date == "1/2/2007" | Date == "2/2/2007"))

# Write line graph to a 480x480 png, with appropriate X axis labels
png(file = "plot2.png", width = 480, height = 480, units = "px") 
plot(d$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xaxt = "n", xlab="")
numItems <- length(d$Global_active_power)
axis(1, at=c(0, numItems/2, numItems), labels=c("Thu", "Fri", "Sat"))
dev.off()

