library(graphics)
df <- read.table("data.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";") #read data
date_time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") #combine data and time column
df <- cbind(date_time,df) # add new date and time column
df$Date <- as.Date(df$Date, "%d/%m/%Y") #convert char date to date class
febdate <- subset(df, Date > "2007-01-31" & Date < "2007-02-03") # get only the feb 1 and 2 2003 dates
febdate$Global_active_power <- as.numeric(febdate$Global_active_power ) #covert column to num
febdate$Global_reactive_power <- as.numeric(febdate$Global_reactive_power ) #covert column to num
febdate$Voltage <- as.numeric(febdate$Voltage ) #covert column to num
febdate$Global_intensity <- as.numeric(febdate$Global_intensity ) #covert column to num
febdate$Sub_metering_1 <- as.numeric(febdate$Sub_metering_1 ) #covert column to num
febdate$Sub_metering_2 <- as.numeric(febdate$Sub_metering_2 ) #covert column to num
#plot2
png(filename="plot2.png")
with(febdate, plot(date_time,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
