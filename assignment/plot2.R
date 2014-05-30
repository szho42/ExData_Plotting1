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

png(file="./plot2.png")

plot(subdata$DateTime, subdata$Global_active_power, pch=20, type="l",xlab="",ylab="Global Active Power(kilowatts)")

dev.off()
