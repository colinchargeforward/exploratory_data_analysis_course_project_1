##read data
df <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
##set date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
##create subset by the logical conditions on date
dfun <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##create a new variable combines date and time
datetime <- paste(dfun$Date, dfun$Time)
dfun$Datetime <- as.POSIXct(datetime)

##specify a file to which we will add elements
png("plot2.png", width=480, height=480)
##plot
plot(dfun$Datetime, dfun$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
