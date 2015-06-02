##Reading the data
data <- read.table("household_power_consumption.txt", , sep = ";",  skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dataf <- data.frame(data)
dataf[["Date_Time"]] <- paste(dataf[["Date"]], dataf[["Time"]], sep=" ")
dataf[["Date_Time"]] <- strptime(dataf[["Date_Time"]], format= "%d/%m/%Y %H:%M:%S" )


##plot2
png(filename = "plot2.png")
plot(dataf[["Date_Time"]], dataf[["Global_active_power"]], type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()