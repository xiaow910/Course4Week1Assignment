getwd()
setwd("//cdc.gov/private/L137/yks5/Data Science/Course 4-Exploratory Data Analysis/week1/assignment/exdata_data_household_power_consumption")
library("data.table")

hausall<-read.table("household_power_consumption.txt",skip=1,sep=";",na.strings = "?")
names(hausall)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
haus<-subset(hausall,hausall$Date=="1/2/2007"|hausall$Date=="2/2/2007") #date,month,year

#convert the Date and Time variables to Date/Time classes
haus$Date<-as.Date(haus$Date,format = "%d/%m/%Y")
haus$DateTime<- strptime(paste(haus$Date,haus$Time),format="%Y-%m-%d %H:%M:%S")
haus$DateTime <- as.POSIXct(haus$DateTime)
head(haus$DateTime)

#Plot 4
par(mfrow=c(2,2))
    with(haus,{
      plot(Global_active_power~DateTime, type="l", 
           xlab="", ylab="Global Active Power (kilowatts)")
      
      plot(Voltage~DateTime, type="l", 
           xlab="datetime", ylab="Voltage")
      
      plot(Sub_metering_1~DateTime, type="l", 
           xlab="", ylab="Energy sub metering")
      lines(haus$Sub_metering_2 ~ haus$DateTime, col = "Red")
      lines(haus$Sub_metering_3 ~ haus$DateTime, col = "Blue")
      legend("topright", lty = 1, col = c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             
      plot(Global_reactive_power~DateTime, type="l", 
           xlab="datetime", ylab="Global_reactive_power")
    })
    
    # Save file
    dev.copy(png, file = "plot4.png", height = 480, width = 480)
    dev.off()