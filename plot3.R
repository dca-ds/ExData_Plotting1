data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',
                   stringsAsFactors=FALSE, dec='.')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'), ]

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
png('plot3.png', width=480, height=480)
plot(datetime, Sub_metering_1, type='n', 
     xlab='', ylab='Energy sub metering')
lines(datetime, Sub_metering_1, col='black')
lines(datetime, Sub_metering_2, col='red')
lines(datetime, Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
