## Course Project 1 plot 2

powerall <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
head(powerall); str(powerall)

power <- powerall[((powerall$Date == "1/2/2007") | (powerall$Date == "2/2/2007")),]
head(power); str(power)
power$Date2 <- as.Date(power$Date,"%d/%m/%Y")
datetimechar <- paste(power$Date,power$Time)
power$DateTime <- strptime(datetimechar,"%d/%m/%Y %H:%M:%S")
head(power); str(power)

## Create Plot 2

png(file="plot2.png",width=480,height=480)
plot(power$DateTime,power$Global_active_power,type="l"
     ,xlab=" ", ylab="Global Active Power (kilowatts)")

## dev.copy(png,file = "plot2.png")
dev.off()