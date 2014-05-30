data <- read.table("../household_power_consumption.txt", sep=";", na.strings="?", skip=c(1))
datanames <- readLines("../household_power_consumption.txt",1)
datanames <- strsplit(datanames, ";")
names(data) <- datanames[[1]]

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data <- data[,3:10]

subdata1 <- subset(data, as.Date(data$DateTime) == as.Date("20070201", "%Y%m%d"))
subdata2 <- subset(data,as.Date(data$DateTime) == as.Date("20070202", "%Y%m%d"))

subdata <- rbind(subdata1, subdata2)

png(file="./plot1.png")
hist(gap, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", ylim=c(0,1200), xlim=c(0,6), col="red")
dev.off()


