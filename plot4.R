df_HPC <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df_HPC$Time <- strptime(paste(df_HPC$Date, df_HPC$Time), "%d/%m/%Y %H:%M:%S")
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
df_HPC <- subset(df_HPC, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
str(df_HPC)

# plot 4
par(mfrow=c(2, 2))
with(df_HPC, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")) 

with(df_HPC, plot(Time, Voltage, type = "l"))

with(df_HPC, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(df_HPC, lines(Time, Sub_metering_2, col="red")) 
with(df_HPC, lines(Time, Sub_metering_3, col="blue")) 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "_")

with(df_HPC, plot(Time, Global_reactive_power, type = "l"))

dev.copy(png, file="plot4.png")
dev.off()