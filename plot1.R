## Course Project 1 plot 1

powerall <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
head(powerall); str(powerall)

power <- powerall[((powerall$Date == "1/2/2007") | (powerall$Date == "2/2/2007")),]
head(power); str(power)
power$Date2 <- as.Date(power$Date,"%d/%m/%Y")
datetimechar <- paste(power$Date,power$Time)
power$DateTime <- strptime(datetimechar,"%d/%m/%Y %H:%M:%S")
head(power); str(power)

## Create Plot 1

png(file="plot1.png",width=480,height=480)
hist(power$Global_active_power,col="red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")

## dev.copy(png,file = "plot1.png")
dev.off()