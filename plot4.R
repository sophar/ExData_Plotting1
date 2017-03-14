#Exploratory Data Analysis
#Course Project 1

#Create Plot 4

#Please set the correct working directory containing your data file

#Reading in complete data, filter by date and the convert/combine date and time in new column
electroData <- read.table("household_power_consumption.txt", header=T, sep=";", dec = ".",na.strings="?")
selectData <- subset(electroData,Date == '1/2/2007' | Date == '2/2/2007')
selectData$DateTime <- as.POSIXct(paste(selectData$Date,selectData$Time), format="%d/%m/%Y %H:%M:%S" )


#Plot 4
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2, 2))
#Panel 1
with(selectData,plot(DateTime,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab=""))

#Panel 2
with(selectData,plot(DateTime,Voltage,type = "l", ylab = "Voltage"))

#Panel 3
with(selectData,plot(DateTime,Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab=""))
with(selectData, lines(DateTime,Sub_metering_2, col = "red"))
with(selectData, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), cex = 0.75)

#Panel 4
with(selectData,plot(DateTime,Global_reactive_power,type = "l"))

dev.copy(png, file = "plot4.png") ## Create PNG (default 480 x 480)
dev.off() ## Closing PNG device

