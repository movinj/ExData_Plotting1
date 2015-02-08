##load the data from file
setwd("~/Documents/Learning/DataScience/Course4_Ass1/ExData_Plotting1")
data1 <- read.table(file = '../household_power_consumption.txt', sep=';',header=TRUE, comment.char="")

##zero down to just the two required dates
data1 <- data1[((data1$Date == '1/2/2007') | (data1$Date == '2/2/2007')),]

##clean the data, perform necessary coercions
data1$Global_active_power[data1$Global_active_power == '?'] <- NA
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#draw the plot on png file
png(filename='plot1.png',height=480,width=480,bg="transparent")
hist(data1$Global_active_power, xlab = 'Global Active Power (kilowatts)', 
     main='Global Active Power', col = "red")
dev.off()