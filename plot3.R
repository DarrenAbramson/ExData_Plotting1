## Get the data. My computer has sufficient RAM to quickly read the whole file.
powerData <- fread("household_power_consumption.txt");

## Subset to the desired date.
powerData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007");

## Convert required column to numeric.
powerData$Global_active_power <- as.numeric(powerData$Global_active_power);

## Create a vector for normalized date/time POSIX values for the X axis.
dateTime <- strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S");

## Set the graphics device to the desired file.
png(file="Plot3.png", width=480, height=480);


## Convert the desired display data to numeric.
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1);
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2);
powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3);

## Get an appropriately labeled plot set up.
plot(dateTime, powerData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");


## Plot the desired data.
## lines(dateTime, powerData$Sub_metering_1)
lines(dateTime, powerData$Sub_metering_2, col="red")
lines(dateTime, powerData$Sub_metering_3, col="blue")

## Insert a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "blue", "red"));


## Close the graphics device.
dev.off()
