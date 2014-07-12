## Get the data. My computer has sufficient RAM to quickly read the whole file.
powerData <- fread("household_power_consumption.txt");

## Subset to the desired date.
powerData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007");

## Convert required columns to numeric.
powerData$Global_active_power <- as.numeric(powerData$Global_active_power);
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1);
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2);
powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3);
powerData$Voltage <- as.numeric(powerData$Voltage);
powerData$Global_reactive_power <- as.numeric(powerData$Global_reactive_power);

## Create a vector for normalized date/time POSIX values for the X axis.
dateTime <- strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S");

## Set the graphics device to the desired file.
png(file="Plot4.png", width=480, height=480);

## Set up for multiple plots on the graphics device.
par(mfrow=c(2,2));

# PLOT 1,1

  plot(dateTime, powerData$Global_active_power, type="l", xlab="", ylab="Global Active Power");
  
# PLOT 1, 2

  plot(dateTime, powerData$Voltage, type="l",ylab="Voltage", xlab="datetime");

# PLOT 2,1

  ## Get an appropriately labeled plot set up.
  plot(dateTime, powerData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");

  ## Plot the desired data.
  ## lines(dateTime, powerData$Sub_metering_1)
  lines(dateTime, powerData$Sub_metering_2, col="red")
  lines(dateTime, powerData$Sub_metering_3, col="blue")

  ## Insert a legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "blue", "red"));

# PLOT 2,2

  plot(dateTime, powerData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime");

## Close the graphics device.
dev.off()
