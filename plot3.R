file_path = "File Path Here"

dat = subset(read.table(file = file_path, header = T, sep = ";", na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric",
                                       "numeric", "numeric", "numeric", "numeric",
                                       "numeric")), Date == '1/2/2007' | Date == '2/2/2007')
dates <- paste(dat$Date, dat$Time)
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")
dat = transform(dat, Day = weekdays(dat$Date))
dat$Time = strptime(dates, format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(dat$Time, dat$Sub_metering_1,  type = "l", xlab = "",
     ylab = "Energy sub metering")
points(dat$Time, dat$Sub_metering_2,  type = "l", col = 'red')
points(dat$Time, dat$Sub_metering_3,  type = "l", col = 'blue')
legend("topright", col = c("black", "red", "blue"),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 2, bty = "n", cex = 0.8)

dev.off()
