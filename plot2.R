##load the data from file
setwd("~/Documents/Learning/DataScience/Course4_Ass1/ExData_Plotting1")
data1 <- read.table(file = '../household_power_consumption.txt', sep=';',header=TRUE, comment.char="")

##zero down to just the two required dates
data1 <- data1[((data1$Date == '1/2/2007') | (data1$Date == '2/2/2007')),]

##clean the data, perform necessary coercions
data1$Global_active_power[data1$Global_active_power == '?'] <- NA
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Date_time <- as.POSIXct(strptime(paste(data1$Date,'/',data1$Time, sep = ""),format="%d/%m/%Y/%T"))

#draw the plot on png file
png(filename='plot2.png',height=480,width=480,bg="transparent")
plot(y=data1$Global_active_power, x = data1$Date_time, type = 'l', xlab="",
     ylab = "Global Active Power (kilowatts)")
dev.off()