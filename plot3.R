require(lubridate)
# reads only data for Feb 1-2 2007 and the column names 
electric_data<-read.table("household_power_consumption.txt",sep=";",
                          na.strings="?",skip=66637,nrows=2880, header = FALSE)

colnames<-read.table("household_power_consumption.txt",sep=";",nrows=1, 
                     header = FALSE)
# assign column names to dataset
colnames<-t(colnames)
names(electric_data)<-colnames

# reclass Date & Time columns

electric_data$Time<-paste(electric_data$Date,electric_data$Time) # so time stamp is accurate
electric_data$Date<-dmy(electric_data$Date) 
electric_data$Time<-strptime(electric_data$Time,"%d/%m/%Y %H:%M:%S")

plot(electric_data$Time,electric_data$Sub_metering_1, 
     type="l",ylab="Energy sub metering",xlab="")
lines(electric_data$Time,electric_data$Sub_metering_2,col="red")
lines(electric_data$Time,electric_data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
              "Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.copy(png,file="plot3.png")
dev.off()



