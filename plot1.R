## Plot 1

# Read in and subset data
alldata <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric", 
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings="?")
d <- subset(alldata, (Date == "1/2/2007" | Date == "2/2/2007"))

# Write histogram to a 480x480 png
png(file = "plot1.png", width = 480, height = 480, units = "px") 
hist(d$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
