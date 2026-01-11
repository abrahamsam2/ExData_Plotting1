## Plot 2 — Line plot of Global Active Power vs Time

# Read the data (only the required 2 days)
power_data <- read.table(
  "household_power_consumption.txt",
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE,
  skip = 66636,
  nrows = 2880,
  col.names = c(
    "Date", "Time",
    "Global_active_power", "Global_reactive_power", "Voltage",
    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
  )
)

# Combine Date and Time into DateTime
power_data$DateTime <- strptime(
  paste(power_data$Date, power_data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Open PNG graphics device
png("plot2.png", width = 480, height = 480)

# Create the line plot
with(power_data, plot(
  DateTime,
  Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
))

# Close the graphics device
dev.off()