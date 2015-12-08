df_HPC <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df_HPC$Time <- strptime(paste(df_HPC$Date, df_HPC$Time), "%d/%m/%Y %H:%M:%S")
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
df_HPC <- subset(df_HPC, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
str(df_HPC)

# plot 1
par(mfrow=c(1, 1))
hist(df_HPC$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
