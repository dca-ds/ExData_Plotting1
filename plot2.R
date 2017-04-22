data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',
                   stringsAsFactors=FALSE, dec='.')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'), ]

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
png('plot2.png', width=480, height=480)
plot(datetime, globalActivePower, type='n', 
     xlab='', ylab='Global Active Power (kilowatts)')
lines(datetime, globalActivePower)
dev.off()
