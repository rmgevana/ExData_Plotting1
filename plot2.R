
############################################################
##                                                        ##
##                R codes for "plot2.png"                 ##
##                      by RMGevana                       ##
##                                                        ##
############################################################

library("data.table")

# reads data from file
power <- fread(input = "household_power_consumption.txt", na.strings="?")

# subset data	
subpower<-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# convert Global_active_power, Date and Time variables
subpower$Global_active_power<-as.numeric(as.character(subpower$Global_active_power))
subpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# png file
png("plot2.png", width=480, height=480)

# plotting function
plot(x = subpower$dateTime, y = subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
