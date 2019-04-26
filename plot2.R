elec <- read.table('K:\\Pricing Product General\\Users\\Diana Rivera\\Work\\household_power_consumption.txt', sep = ';', header = TRUE)
elec.1 <- elec[elec$Date %in% c("2/2/2007","1/2/2007"),]

elec.1$Global_active_power <- as.character(elec.1$Global_active_power)
elec.1$Global_active_power <- as.numeric(elec.1$Global_active_power)

elec.1$newdate <- as.Date(elec.1$Date, format='%d/%m/%Y')
elec.1 <- within(elec.1, date.time <- paste(elec.1$newdate, elec.1$Time, sep=" "))
elec.1$date.time <- strptime(elec.1$date.time, format='%Y-%m-%d %H:%M:%S')

png(filename="K:\\Pricing Product General\\Users\\Diana Rivera\\Projects\\Coursera\\plot2.png")
plot(elec.1$date.time, elec.1$Global_active_power, xlab="", ylab = 'Global Active Power (kilowatts)', type="l")
dev.off()