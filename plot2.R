setwd("SET YOUR WORKING DIRECTORY")

data <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dataset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

par(mfrow = c(1,1))

dataset$Datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

plot2 <- plot(dataset$Datetime, dataset$Global_active_power,
      type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
