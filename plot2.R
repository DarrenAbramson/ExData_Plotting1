## Get the data. My computer has sufficient RAM to quickly read the whole file.
powerData <- fread("household_power_consumption.txt");

## Subset to the desired date.
powerData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007");

## Convert required column to numeric.
powerData$Global_active_power <- as.numeric(powerData$Global_active_power);

## Create a vector for normalized date/time POSIX values for the X axis.
dateTime <- strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S");

## Set the graphics device to the desired file.
png(file="plot2.png", width=480, height=480);

## Plot the graph with appropriate labels and color.
plot(dateTime, powerData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");

## Close the graphics device.
dev.off()
