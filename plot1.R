elec <- read.table('K:\\Pricing Product General\\Users\\Diana Rivera\\Work\\household_power_consumption.txt', sep = ';', header = TRUE)
elec.1 <- elec[elec$Date %in% c("2/2/2007","1/2/2007"),]

elec.1$Global_active_power <- as.character(elec.1$Global_active_power)
elec.1$Global_active_power <- as.numeric(elec.1$Global_active_power)
png(filename="K:\\Pricing Product General\\Users\\Diana Rivera\\Projects\\Coursera\\plot1.png")
glob <- hist(elec.1$Global_active_power, col = 2, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()