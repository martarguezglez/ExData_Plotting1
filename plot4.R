## Read data. Specify the number of rows to improve the reading performances

data <- read.table ("household_power_consumption.txt",sep=";",nrows=2075259,header=TRUE,na.strings="?")

## Select only the data corresponding to the specific dates

selected_data <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

## Add a new column including time (date and time)

datetimes_aux <- paste (selected_data[,1],selected_data[,2])

selected_data$Datetimes <- strptime(datetimes_aux,"%d/%m/%Y %H:%M:%S")

png (file="plot4.png", width=480, height=480)

## Obtain the plot

par(mfcol = c(2,2))

with(selected_data,plot(Datetimes,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power"))

with(selected_data,plot(Datetimes,as.numeric(as.character(Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering"))

legend("topright",lwd=1, lty=c(1,1,1),pch = c(NA,NA,NA),col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

with(selected_data,lines(Datetimes,as.numeric(as.character(Sub_metering_1),type="l")))

with(selected_data,lines(Datetimes,as.numeric(as.character(Sub_metering_2),type="l"),col="red"))

with(selected_data,lines(Datetimes,as.numeric(as.character(Sub_metering_3),type="l"),col="blue"))

with(selected_data,plot(Datetimes,as.numeric(as.character(Voltage)),type="l",xlab="datetime",ylab="Voltage"))

with(selected_data,plot(Datetimes,as.numeric(as.character(Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power",lty=1))

## Close the PNG device
dev.off()