data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',
                   stringsAsFactors=FALSE, dec='.')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'), ]

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
Voltage <- as.numeric(data$Voltage)
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
globalReactivePower <- as.numeric(data$Global_reactive_power)

png('plot4.png', width=480, height=480)

par(mfrow=c(2,2))

plot(datetime, globalActivePower, type='l', 
     xlab='', ylab='Global Active Power (kilowatts)')

plot(datetime, Voltage, type='l', 
     xlab='', ylab='Voltage')

plot(datetime, Sub_metering_1, type='n', 
     xlab='datetime', ylab='Energy sub metering')
lines(datetime, Sub_metering_1, col='black')
lines(datetime, Sub_metering_2, col='red')
lines(datetime, Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(datetime, globalReactivePower, type='l', 
     xlab='datetime', ylab='Global_reactive_power')

dev.off()
