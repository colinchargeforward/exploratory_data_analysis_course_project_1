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
png("plot3.png", width=480, height=480)
##here we use the with syntax,to simplify the input
with(dfun, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
##add the legend to the topright with a appropriate parameter "cex'
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=2,cex = 0.75)
dev.off()
