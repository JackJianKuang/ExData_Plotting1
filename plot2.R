df_HPC <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df_HPC$Time <- strptime(paste(df_HPC$Date, df_HPC$Time), "%d/%m/%Y %H:%M:%S")
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
df_HPC <- subset(df_HPC, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
str(df_HPC)

# plot 2
par(mfrow=c(1, 1))
with(df_HPC, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")) 
dev.copy(png, file="plot2.png")
dev.off()