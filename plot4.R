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
png("plot4.png", width=480, height=480)
##to plot 4 figures in a plot,we should set corresponding 
##parameters with par
par(mfrow=c(2,2), mar=c(5,4,4,2), oma=c(0,0,2,0))
##again,to simplify the input,we use the with function to evaluate 
##an environment constructed from data
with(dfun, {
      plot(Global_active_power~Datetime, type="l", 
           ylab="Global Active Power", xlab="")
      plot(Voltage~Datetime, type="l", 
           ylab="Voltage", xlab="datetime")
      plot(Sub_metering_1~Datetime, type="l", 
           ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
      legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
      plot(Global_reactive_power~Datetime, type="l", 
           ylab="Global_rective_power",xlab="datetime")
})
dev.off()

