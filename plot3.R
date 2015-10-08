# Read data - assumes that the unzipped data file (household_power_consumption.txt) is in 
# the same directory as the R script

data<-read.table("household_power_consumption.txt",sep=";",header=T,na.string="?")

# Combine and convert date and time columns (factors) into a single POSIXlt date/time field
data$datetime=strptime(paste(as.character(data$Date),as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")

# Subset the two days of interest, replacing the original data object
data<-data[data$datetime>="2007-02-01" & data$datetime<"2007-02-03" & !is.na(data$datetime),]

# Plot figure: N.B. The default png size (480x480) matches the required size, but included for completeness
png("plot3.png",width=480,height=480)
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(datetime,Sub_metering_2,type="l",col="red"))
with(data,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
