png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))  # set layout + margins

with(power_data, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, bty = "n", col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()