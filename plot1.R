# Check if the data file exists
if (!file.exists("household_power_consumption.txt")) {
    warning("The data file does not exist")
}

# Load data
file <- "household_power_consumption.txt"
electricPower <- read.table(file, header=T, sep=";", na.strings="?")

# Select the data from 2007-02-01 to 2007-02-02
data <- electricPower[electricPower$Date %in% c("1/2/2007","2/2/2007"),]

# Plot data
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Copy the data to a file
dev.copy(png, filename="plot1.png", width=480, height=480, units='px')

# Turn off device
dev.off()