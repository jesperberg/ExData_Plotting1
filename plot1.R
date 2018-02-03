setwd("SET YOUR WORKING DIRECTORY")

data <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dataset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

plot1 <- hist(dataset$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
