## Course Project 1 plot 3

powerall <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
head(powerall); str(powerall)

power <- powerall[((powerall$Date == "1/2/2007") | (powerall$Date == "2/2/2007")),]
head(power); str(power)
power$Date2 <- as.Date(power$Date,"%d/%m/%Y")
datetimechar <- paste(power$Date,power$Time)
power$DateTime <- strptime(datetimechar,"%d/%m/%Y %H:%M:%S")
head(power); str(power)

## Create Plot 3

png(file="plot3.png",width=480,height=480)
plot(power$DateTime,power$Sub_metering_1,type="l", col="black"
     ,xlab=" ", ylab="Energy sub metering")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## dev.copy(png,file = "plot3.png")
dev.off()