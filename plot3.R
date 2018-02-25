
############################################################
##                                                        ##
##                R codes for "plot3.png"                 ##
##                      by RMGevana                       ##
##                                                        ##
############################################################

library("data.table")

# reads data from file
power <- fread(input = "household_power_consumption.txt", na.strings="?")

# subset data	
subpower<-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# convert variables
subpower$Sub_metering_1<-as.numeric(as.character(subpower$Sub_metering_1))
subpower$Sub_metering_2<-as.numeric(as.character(subpower$Sub_metering_2))
subpower$Sub_metering_3<-as.numeric(as.character(subpower$Sub_metering_3))
subpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# png file
png("plot3.png", width=480, height=480)

# plotting function
plot(x = subpower$dateTime, y = subpower$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(subpower,lines(dateTime,Sub_metering_1))
with(subpower,lines(dateTime,Sub_metering_2,col="red"))
with(subpower,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

dev.off()
