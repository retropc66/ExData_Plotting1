
# Read data
data<-read.table("household_power_consumption.txt",sep=";",header=T,na.string="?")

# Combine and convert date and time columns (factors) into a single POSIXlt date/time field
data$datetime=strptime(paste(as.character(data$Date),as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")

# Subset the two days of interest, replacing the original data object
data<-data[data$datetime>="2007-02-01" & data$datetime<"2007-02-03" & !is.na(data$datetime),]

# Plot figure: N.B. The default png size (480x480) matches the required size
png("plot1.png")
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
