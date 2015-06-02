##Reading the data
data <- read.table("household_power_consumption.txt", , sep = ";",  skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dataf <- data.frame(data)
dataf[["Date_Time"]] <- paste(dataf[["Date"]], dataf[["Time"]], sep=" ")
dataf[["Date_Time"]] <- strptime(dataf[["Date_Time"]], format= "%d/%m/%Y %H:%M:%S" )


##plot4
png(filename = "plot4.png")
par(mfcol = c(2, 2))
with(dataf,{
        plot(dataf[["Date_Time"]], dataf[["Global_active_power"]], type="l", xlab = "", ylab = "Global Active Power")
{
                with(dataf, plot(Date_Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab =""))
                with(dataf, points(Date_Time, Sub_metering_1,  col = "BLACK", type ="l"))
                with(dataf, points(Date_Time, Sub_metering_2,  col = "RED", type = "l"))
                with(dataf, points(Date_Time, Sub_metering_3,  col = "BLUE", type = "l"))
                legend("topright", col = c("BLACK", "RED", "BLUE"),   lty=c(1,1), cex = 0.9, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        }
plot(dataf[["Date_Time"]], dataf[["Voltage"]], type = "l",  xlab = "datetime", ylab = "Voltage")
plot(dataf[["Date_Time"]], dataf[["Global_reactive_power"]], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

})
dev.off()