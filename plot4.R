setwd("SET YOUR WORKING DIRECTORY")

data <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dataset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

dataset$Datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))
par(xpd=TRUE)

myPlot4 <- function(){
        with(dataset, {
        plot(dataset$Datetime, dataset$Global_active_power,
             type="l", ylab="Global Active Power", xlab="")
        plot(dataset$Datetime, dataset$Voltage, ylab="Voltage", xlab="datetime", type="l")
        with(dataset, plot(Datetime, Sub_metering_1,
                           type="l",
                           col="black",
                           ylab="Energy sub metering",
                           xlab=""))
        with(dataset, points(Datetime, Sub_metering_2, type="l", col="red"))
        with(dataset, points(Datetime, Sub_metering_3, type="l", col="blue"))
        legend("top", inset = 0.008, box.lty = 0, box.lwd = 6, pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(dataset$Datetime, dataset$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
})
}


myPlot4()
dev.copy(png, "plot4.png")
dev.off()
