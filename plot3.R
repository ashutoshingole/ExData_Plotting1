data3 <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data3 <- data3[data3$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(data3$Global_active_power)
SM1 <- as.numeric(data3$Sub_metering_1)
SM2 <- as.numeric(data3$Sub_metering_2)
SM3 <- as.numeric(data3$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

