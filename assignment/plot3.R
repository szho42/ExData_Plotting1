data <- read.table("../../household_power_consumption.txt", sep=";", na.strings="?", skip=c(1))
datanames <- readLines("../../household_power_consumption.txt",1)
datanames <- strsplit(datanames, ";")
names(data) <- datanames[[1]]

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data <- data[,3:10]

subdata1 <- subset(data, as.Date(data$DateTime) == as.Date("20070201", "%Y%m%d"))
subdata2 <- subset(data,as.Date(data$DateTime) == as.Date("20070202", "%Y%m%d"))

subdata <- rbind(subdata1, subdata2)

png(file="./plot3.png")

plot(subdata$DateTime, subdata$Sub_metering_1, pch=20, type="l",xlab="",ylab="Energy sub metering")
points(subdata$DateTime, subdata$Sub_metering_2, pch=20, type="l",col="red")
points(subdata$DateTime, subdata$Sub_metering_3, pch=20, type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red","blue"))
dev.off()
