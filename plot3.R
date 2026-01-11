## Plot 3 — Multi-line Sub-metering

# Read the data (only the 2 days needed)
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

# Combine Date + Time into DateTime
power_data$DateTime <- strptime(
  paste(power_data$Date, power_data$Time),
  "%d/%m/%Y %H:%M:%S"
)

# Open PNG graphics device
png("plot3.png", width = 480, height = 480)

# Plot Sub_metering_1
with(power_data, {
  plot(DateTime, Sub_metering_1, type = "l",
       ylab = "Energy sub metering",
       xlab = "",
       col = "black")
  
  # Add Sub_metering_2 and Sub_metering_3
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  
  # Add legend
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1)
})

# Close the graphics device
dev.off()