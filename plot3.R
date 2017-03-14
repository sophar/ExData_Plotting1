#Exploratory Data Analysis
#Course Project 1

#Create Plot 3

#Please set the correct working directory containing your data file

#Reading in complete data, filter by date and the convert/combine date and time in new column
electroData <- read.table("household_power_consumption.txt", header=T, sep=";", dec = ".",na.strings="?")
selectData <- subset(electroData,Date == '1/2/2007' | Date == '2/2/2007')
selectData$DateTime <- as.POSIXct(paste(selectData$Date,selectData$Time), format="%d/%m/%Y %H:%M:%S" )

#Plot 3
par(mfrow = c(1, 1))
with(selectData,plot(DateTime,Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab=""))
with(selectData, lines(DateTime,Sub_metering_2, col = "red"))
with(selectData, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
dev.copy(png, file = "plot3.png") ## Create PNG (default 480 x 480)
dev.off() ## Closing PNG device
