##load the data from file
setwd("~/Documents/Learning/DataScience/Course4_Ass1/ExData_Plotting1")
data1 <- read.table(file = '../household_power_consumption.txt', sep=';',header=TRUE, comment.char="")

##zero down to just the two required dates
data1 <- data1[((data1$Date == '1/2/2007') | (data1$Date == '2/2/2007')),]

##clean the data, perform necessary coercions
data1$Global_active_power[data1$Global_active_power == '?'] <- NA
data1$Sub_metering_1[data1$Sub_metering_1 == '?'] <- NA
data1$Sub_metering_2[data1$Sub_metering_2 == '?'] <- NA
data1$Sub_metering_3[data1$Sub_metering_3 == '?'] <- NA
data1$Voltage[data1$Voltage == '?'] <- NA
data1$Global_reactive_power[data1$Global_reactive_power == '?'] <- NA
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
data1$Voltage <- as.numeric(as.character(data1$Voltage))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Date_time <- as.POSIXct(strptime(paste(data1$Date,'/',data1$Time, sep = ""),format="%d/%m/%Y/%T"))

#draw the plot on png file
png(filename='plot4.png',height=480,width=480,bg="transparent")
par(mfcol=c(2,2))
##Top left plot
plot(y=data1$Global_active_power, x = data1$Date_time, type = 'l', xlab="",
     ylab = "Global Active Power")

##Bottom left plot
plot(y = data1$Sub_metering_1, x = data1$Date_time, type = 'l', xlab="",
     ylab = "Energy sub metering",col="black")
lines(y = data1$Sub_metering_2, x = data1$Date_time, col="red")
lines(y = data1$Sub_metering_3, x = data1$Date_time,col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Top right plot
plot(y=data1$Voltage, x = data1$Date_time, type = 'l', xlab="datetime",
     ylab = "Voltage",lwd=1)

##Bottom right plot
plot(y=data1$Global_reactive_power, x = data1$Date_time, type = 'l', xlab="datetime",
     ylab = "Global_reactive_power",lwd=1)

dev.off()