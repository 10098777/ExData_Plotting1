##Code for plot4
setwd("E:/statistics/coursera/repository/exploratorydataanalysis/project1")
alldata<-read.csv2("household_power_consumption.txt")
alldata$Date<-as.Date(as.character(alldata$Date),format="%d/%m/%Y")
subsetdata<-alldata[alldata$Date=="2007-2-1"|alldata$Date=="2007-2-2",]
x<-character()
x<-paste(as.character(subsetdata$Date),as.character(subsetdata$Time),sep=",")
subsetdata$Time<-as.POSIXct(strptime(x,"%Y-%m-%d,%H:%M:%S"))
y<-(strptime(x,"%Y-%m-%d,%H:%M:%S"))$wday
z<-length(y[y==4])
m<-z+1
par(mar=c(5.5,5.1,4,1.5),mfrow=c(2,2))
subsetdata$Global_active_power<-as.numeric(levels(subsetdata$Global_active_power)[subsetdata$Global_active_power])
{
    with(subsetdata,plot(subsetdata$Time,subsetdata$Global_active_power,xaxt="n",xlab="",ylab="Global Value Power(kilowatts)",type="n"))
    lines(subsetdata$Time,subsetdata$Global_active_power)
    axis(1,at=c((subsetdata$Time)[1],(subsetdata$Time)[m],(subsetdata$Time)[length(y)]),labels=c("Thur","Fri","Sat"))
}
subsetdata$Voltage<-as.numeric(levels(subsetdata$Voltage)[subsetdata$Voltage])
{
    with(subsetdata,plot(subsetdata$Time, subsetdata$Voltage,xaxt="n",xlab="Datetime",ylab="Voltage",type="l"))
    axis(1,at=c((subsetdata$Time)[1],(subsetdata$Time)[m],(subsetdata$Time)[length(y)]),labels=c("Thur","Fri","Sat"))
}
subsetdata$Sub_metering_1<-as.numeric(levels(subsetdata$Sub_metering_1)[subsetdata$Sub_metering_1])
subsetdata$Sub_metering_2<-as.numeric(levels(subsetdata$Sub_metering_2)[subsetdata$Sub_metering_2])
subsetdata$Sub_metering_3<-as.numeric(levels(subsetdata$Sub_metering_3)[subsetdata$Sub_metering_3])
{
    with(subsetdata,plot(subsetdata$Time, subsetdata$Sub_metering_1,xaxt="n",xlab="",ylab="Energy sub metering",type="l"))
    lines(subsetdata$Time,subsetdata$Sub_metering_1)
    lines(subsetdata$Time,subsetdata$Sub_metering_2,col="Red")
    lines(subsetdata$Time,subsetdata$Sub_metering_3,col="Blue")
    axis(1,at=c((subsetdata$Time)[1],(subsetdata$Time)[m],(subsetdata$Time)[length(y)]),labels=c("Thur","Fri","Sat"))
    legend("topright",lty=1,lwd=0.4,cex=0.5,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
subsetdata$Global_active_power<-as.numeric(levels(subsetdata$Global_reactive_power)[subsetdata$Global_reactive_power])
{
    with(subsetdata,plot(subsetdata$Time, subsetdata$Global_reactive_power,xaxt="n",xlab="Datetime",ylab="Global_reactive_power",type="l"))
    axis(1,at=c((subsetdata$Time)[1],(subsetdata$Time)[m],(subsetdata$Time)[length(y)]),labels=c("Thur","Fri","Sat"))
}
dev.copy(png,file="plot4.png")
dev.off()