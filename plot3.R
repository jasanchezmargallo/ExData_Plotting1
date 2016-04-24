# Check if the data file exists
if (!file.exists("household_power_consumption.txt")) {
    warning("The data file does not exist")
}

# Load data
file <- "household_power_consumption.txt"
electricPower <- read.table(file, header=T, sep=";", na.strings="?")

# Select the data from 2007-02-01 to 2007-02-02
data <- electricPower[electricPower$Date %in% c("1/2/2007","2/2/2007"),]

# Convert the Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# Plot the data
with(data, {
    plot(DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
})

# Copy the data to a file
dev.copy(png, filename="plot3.png", width=480, height=480, units='px')

# Turn off device
dev.off()