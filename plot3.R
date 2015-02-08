##load the data from file
setwd("~/Documents/Learning/DataScience/Course4_Ass1/ExData_Plotting1")
data1 <- read.table(file = '../household_power_consumption.txt', sep=';',header=TRUE, comment.char="")

##zero down to just the two required dates
data1 <- data1[((data1$Date == '1/2/2007') | (data1$Date == '2/2/2007')),]

##clean the data, perform necessary coercions
data1$Sub_metering_1[data1$Sub_metering_1 == '?'] <- NA
data1$Sub_metering_2[data1$Sub_metering_2 == '?'] <- NA
data1$Sub_metering_3[data1$Sub_metering_3 == '?'] <- NA
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
data1$Date_time <- as.POSIXct(strptime(paste(data1$Date,'/',data1$Time, sep = ""),format="%d/%m/%Y/%T"))

#draw the plot on png file
png(filename='plot3.png',height=480,width=480,bg="transparent")
plot(y = data1$Sub_metering_1, x = data1$Date_time, type = 'l', xlab="",
     ylab = "Energy sub metering",col="black")
lines(y = data1$Sub_metering_2, x = data1$Date_time, col="red")
lines(y = data1$Sub_metering_3, x = data1$Date_time,col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
