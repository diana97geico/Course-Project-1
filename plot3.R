elec <- read.table('K:\\Pricing Product General\\Users\\Diana Rivera\\Work\\household_power_consumption.txt', sep = ';', header = TRUE)
elec.1 <- elec[elec$Date %in% c("2/2/2007","1/2/2007"),]

elec.1$newdate <- as.Date(elec.1$Date, format='%d/%m/%Y')
elec.1 <- within(elec.1, date.time <- paste(elec.1$newdate, elec.1$Time, sep=" "))
elec.1$date.time <- strptime(elec.1$date.time, format='%Y-%m-%d %H:%M:%S')

png(filename="K:\\Pricing Product General\\Users\\Diana Rivera\\Projects\\Coursera\\plot3.png")
elec.1$Sub_metering_1 <- as.character(elec.1$Sub_metering_1)
elec.1$Sub_metering_1 <- as.numeric(elec.1$Sub_metering_1)
elec.1$Sub_metering_2 <- as.character(elec.1$Sub_metering_2)
elec.1$Sub_metering_2 <- as.numeric(elec.1$Sub_metering_2)
elec.1$Sub_metering_3 <- as.character(elec.1$Sub_metering_3)
elec.1$Sub_metering_3 <- as.numeric(elec.1$Sub_metering_3)
eng <- plot(elec.1$date.time, elec.1$Sub_metering_1, col = "black", type = "l", xlab = "", ylab="Energy sub metering")
lines(elec.1$date.time, elec.1$Sub_metering_2, col = "red", type = "l")
lines(elec.1$date.time, elec.1$Sub_metering_3, col = "blue", type = "l")
legend("topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), horiz=FALSE, lty=1, cex = 0.8)
dev.off()