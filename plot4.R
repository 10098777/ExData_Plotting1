##Code for plot4
setwd("E:/statistics/coursera/repository/exploratorydataanalysis/project1")
alldata<-read.csv2("household_power_consumption.txt")
alldata$Date<-as.Date(as.character(alldata$Date),format="%d/%m/%Y")
subsetdata<-alldata[alldata$Date=="2007-2-1"|alldata$Date=="2007-2-2",]
y<-character()
y<-paste(as.character(subsetdata$Date),as.character(subsetdata$Time),sep=",")
subsetdata$Time<-strptime(y,"%Y-%m-%d,%H:%M:%S")
subsetdata$Time<-as.POSIXct(subsetdata$Time)
subsetdata$Sub_metering_1<-as.numeric(levels(subsetdata$Sub_metering_1)[subsetdata$Sub_metering_1])
subsetdata$Sub_metering_2<-as.numeric(levels(subsetdata$Sub_metering_2)[subsetdata$Sub_metering_2])
subsetdata$Sub_metering_3<-as.numeric(levels(subsetdata$Sub_metering_3)[subsetdata$Sub_metering_3])
par(mar=c(5.5,5.1,4,1.5),mfrow=c(2,2))
subsetdata$Global_active_power<-as.numeric(levels(subsetdata$Global_active_power)[subsetdata$Global_active_power])
{with(subsetdata,plot(subsetdata$Time,subsetdata$Global_active_power,xaxt="n",xlab="",ylab="Global Value Power(kilowatts)",type="n"))
axis(1,at=c(4,5,6),labels=c("Thur","Fri","Sat"))
lines(subsetdata$Time,subsetdata$Global_active_power)}
subsetdata$Voltage<-as.numeric(levels(subsetdata$Voltage)[subsetdata$Voltage])
{
    with(subsetdata,plot(subsetdata$Time, subsetdata$Voltage,xaxt="n",xlab="Datetime",ylab="Voltage",type="l"))
    axis(1,at=c(4,5,6),labels=c("Thur","Fri","Sat"))
}
energy_sub_metering<-c(subsetdata$Sub_metering_1,subsetdata$Sub_metering_2,subsetdata$Sub_metering_3)
{with(subsetdata,plot(subsetdata$Time, subsetdata$Sub_metering_1,xaxt="n",xlab="",ylab="Energy sub metering",type="l"))
points(subsetdata$Time,energy_sub_metering[1:2880],type="l")
points(subsetdata$Time,energy_sub_metering[2881:5760],type="l",col="Red")
points(subsetdata$Time,energy_sub_metering[5761:8640],type="l",col="Blue")
axis(1,at=c(4,5,6),labels=c("Thur","Fri","Sat"))}
subsetdata$Global_active_power<-as.numeric(levels(subsetdata$Global_reactive_power)[subsetdata$Global_reactive_power])
{
    with(subsetdata,plot(subsetdata$Time, subsetdata$Global_reactive_power,xaxt="n",xlab="Datetime",ylab="Global_reactive_power",type="l"))
    axis(1,at=c(4,5,6),labels=c("Thur","Fri","Sat"))
}
dev.copy(png,file="plot4.png")
dev.off()