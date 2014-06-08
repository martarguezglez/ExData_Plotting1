## Read data. Specify the number of rows to improve the reading performances

data <- read.table ("household_power_consumption.txt",sep=";",nrows=2075259,header=TRUE,na.strings="?")

## Select only the data corresponding to the specific dates

selected_data <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

png (file="plot1.png", width=480, height=480)

## Obtain the histogram

hist (as.numeric(as.character((selected_data$Global_active_power))),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

## Close the PNG device

dev.off()