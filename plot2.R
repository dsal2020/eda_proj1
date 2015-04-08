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

plot(electric_data$Time,electric_data$Global_active_power, type="l"
     ,ylab="Global Active Power(kilowatts)", xlab="")

dev.copy(png,file="plot2.png")
dev.off()



