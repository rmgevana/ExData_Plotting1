
############################################################
##                                                        ##
##                R codes for "plot4.png"                 ##
##                      by RMGevana                       ##
##                                                        ##
############################################################

library("data.table")

# reads data from file
power <- fread(input = "household_power_consumption.txt", na.strings="?")

# subset data	
subpower<-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# convert variables
subpower$Global_active_power<-as.numeric(as.character(subpower$Global_active_power))
subpower$Global_reactive_power<-as.numeric(as.character(subpower$Global_reactive_power))
subpower$Voltage<-as.numeric(as.character(subpower$Voltage))
subpower$Sub_metering_1<-as.numeric(as.character(subpower$Sub_metering_1))
subpower$Sub_metering_2<-as.numeric(as.character(subpower$Sub_metering_2))
subpower$Sub_metering_3<-as.numeric(as.character(subpower$Sub_metering_3))
subpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))


# plotting function

# graph no. 1
plot(x = subpower$dateTime, y = subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# graph no. 2
plot(x = subpower$dateTime, y = subpower$Voltage, type="l",xlab="datetime", ylab="Voltage")

# graph no. 3
plot(x = subpower$dateTime, y = subpower$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(subpower,lines(dateTime,Sub_metering_1))
with(subpower,lines(dateTime,Sub_metering_2,col="red"))
with(subpower,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1),bty="n", cex=.6)

# graph no. 4
plot(x = subpower$dateTime, y = subpower$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()
