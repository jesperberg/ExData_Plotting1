setwd("D:/Program/RStudio/Projects/Coursera/Exploratory Data Analysis/W1/Project/Data")

dataset <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)

plot1 <- hist(dataset$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()