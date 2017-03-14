#Exploratory Data Analysis
#Course Project 1

#Create Plot 2

#Please set the correct working directory containing your data file

#Reading in complete data, filter by date and the convert/combine date and time in new column
electroData <- read.table("household_power_consumption.txt", header=T, sep=";", dec = ".",na.strings="?")
selectData <- subset(electroData,Date == '1/2/2007' | Date == '2/2/2007')
selectData$DateTime <- as.POSIXct(paste(selectData$Date,selectData$Time), format="%d/%m/%Y %H:%M:%S" )

#Plot 2
par(mfrow = c(1, 1))
with(selectData,plot(DateTime,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab=""))
dev.copy(png, file = "plot2.png") ## Create PNG (default 480 x 480)
dev.off() ## Closing PNG device

