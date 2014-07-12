## Get the data. My computer has sufficient RAM to quickly read the whole file.
powerData <- fread("household_power_consumption.txt");

## Subset to the desired date.
powerData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007");

## Convert required column to numeric.
powerData$Global_active_power <- as.numeric(powerData$Global_active_power);

## Set the graphics device to the desired file.
png(file="Plot1.png", width=480, height=480);

## Plot the histogram with appropriate labels and color.
hist(subsetPowerData$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red");

## Close the graphics device.
dev.off()