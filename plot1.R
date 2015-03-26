file_path = "./hpc.txt"

dat = subset(read.table(file = file_path, header = T, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric",
                                "numeric")), Date == '2/2/2007' | Date == '3/2/2007')
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")
dat = transform(dat, Day = weekdays(dat$Date))
dat$Time = strptime(dat$Time, format = "%H:%M:%S")

png("plot1.png")
par(cex.axis = 1.2, cex.lab = 1.3, cex.main = 1.4, mar = c(5, 4, 3, 1),
    font = 2, col = "red")
hist(dat[,3], xlab = "Global active power (kilowatts)",
    col = "red", main = "Global active power")

dev.off()