setwd("SET YOUR WORKING DIRECTORY")

data <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dataset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

dataset$Datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

with(dataset, plot(Datetime, Sub_metering_1,
                   type="l",
                   col="black",
                   ylab="Energy sub metering",
                   xlab=""))
with(dataset, points(Datetime, Sub_metering_2, type="l", col="red"))
with(dataset, points(Datetime, Sub_metering_3, type="l", col="blue"))

dev.copy(png, "plot3.png", width=480, height=480)
legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
