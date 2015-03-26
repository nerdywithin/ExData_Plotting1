file_path = "./hpc.txt"

dat = subset(read.table(file = file_path, header = T, sep = ";", na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric",
                                       "numeric", "numeric", "numeric", "numeric",
                                       "numeric")), Date == '2/2/2007' | Date == '3/2/2007')
dates <- paste(dat$Date, dat$Time)
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")
dat = transform(dat, Day = weekdays(dat$Date))
dat$Time = strptime(dates, format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")

par(cex.axis = 1.2, cex.lab = 1.3, cex.main = 1.4, mar = c(5, 4, 3, 1),
    font = 2)
plot(dat$Time, dat$Global_active_power,  type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()