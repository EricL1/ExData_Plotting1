## Course Project 1 plot 4

powerall <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
head(powerall); str(powerall)

power <- powerall[((powerall$Date == "1/2/2007") | (powerall$Date == "2/2/2007")),]
head(power); str(power)
power$Date2 <- as.Date(power$Date,"%d/%m/%Y")
datetimechar <- paste(power$Date,power$Time)
power$DateTime <- strptime(datetimechar,"%d/%m/%Y %H:%M:%S")
head(power); str(power)

## Create Plot 4 2 by 2 multiplot

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1))

## Row 1 Col 1
plot(power$DateTime,power$Global_active_power,type="l"
     ,xlab=" ", ylab="Global Active Power")

## Row 1 Col 2
plot(power$DateTime,power$Voltage,type="l"
     ,xlab="datetime", ylab="Voltage")

## Row 2 Col 1
plot(power$DateTime,power$Sub_metering_1,type="l", col="black"
     ,xlab=" ", ylab="Energy sub metering")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Row 2 Col 2
plot(power$DateTime,power$Global_reactive_power,type="l"
     ,xlab="datetime",ylab="Global_reactive_power")

## dev.copy(png,file = "plot4.png")
dev.off()






