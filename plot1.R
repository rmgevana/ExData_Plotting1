
############################################################
##                                                        ##
##                R codes for "plot1.png"                 ##
##                      by RMGevana                       ##
##                                                        ##
############################################################

library("data.table")

# reads data from file
power <- fread(input = "household_power_consumption.txt", na.strings="?")

# subset data	
subpower<-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# transform Global_active_power to numeric value
subpower$Global_active_power<-as.numeric(as.character(subpower$Global_active_power))

# png file
png("plot1.png", width=480, height=480)

# plotting function
hist(subpower$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red",main="Global Active Power")

dev.off()
