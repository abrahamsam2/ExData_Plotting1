## Plot 1

power_data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE,
  skip = 66636,
  nrows = 2880
)

power_data$DateTime <- strptime(
  paste(power_data$Date, power_data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

png("plot1.png", width = 480, height = 480)

hist(
  power_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.off()