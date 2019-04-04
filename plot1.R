getwd()
setwd("//cdc.gov/private/L137/yks5/Data Science/Course 4-Exploratory Data Analysis/week1/assignment/exdata_data_household_power_consumption")
library("data.table")

hausall<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(hausall)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
haus<-subset(hausall,hausall$Date=="1/2/2007"|hausall$Date=="2/2/2007") #date,month,year

#convert the Date and Time variables to Date/Time classes
haus$Date<-as.Date(haus$Date)
class(haus$Date)

haus$Time<-strptime(haus$Time,format="%Y-%m-%d %H:%M:%S")
class(haus$Time)

#Plot 1
haus$Global_active_power<-as.numeric(haus$Global_active_power)
summary(haus$Global_active_power)
haus$plot1<-haus$Global_active_power/1000
summary(haus$plot1)
hist(haus$plot1,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
axis(side = 1, at = seq(0, 6, by = 2))
     
# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()








