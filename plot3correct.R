##R code for plot3
setwd("E:/statistics/coursera/repository/exploratorydataanalysis/project1")
##I ommitted the downloading and unzipping process here because the household_power_consumption.txt  
##already exists in the working directory due to plot1 generation.
alldata<-read.csv2("household_power_consumption.txt")
alldata$Date<-as.Date(as.character(alldata$Date),format="%d/%m/%Y")
subsetdata<-alldata[alldata$Date=="2007-2-1"|alldata$Date=="2007-2-2",]
x<-paste(as.character(subsetdata$Date),as.character(subsetdata$Time),sep=",")
subsetdata$Time<-as.POSIXct(strptime(x,"%Y-%m-%d,%H:%M:%S"))
y<-(strptime(x,"%Y-%m-%d,%H:%M:%S"))$wday
z<-length(y[y==4])
m<-z+1
##change the three variables Sub_metering_1,2,3 from factor class into numeric class
subsetdata$Sub_metering_1<-as.numeric(levels(subsetdata$Sub_metering_1)[subsetdata$Sub_metering_1])
subsetdata$Sub_metering_2<-as.numeric(levels(subsetdata$Sub_metering_2)[subsetdata$Sub_metering_2])
subsetdata$Sub_metering_3<-as.numeric(levels(subsetdata$Sub_metering_3)[subsetdata$Sub_metering_3])
par(mar=c(5.5,5.1,4,1.5))
with(subsetdata,plot(subsetdata$Time, subsetdata$Sub_metering_1,xaxt="n",xlab="",ylab="Energy sub metering",type="n"))
lines(subsetdata$Time,subsetdata$Sub_metering_1)
lines(subsetdata$Time,subsetdata$Sub_metering_2,col="Red")
lines(subsetdata$Time,subsetdata$Sub_metering_3,col="Blue")
axis(1,at=c((subsetdata$Time)[1],(subsetdata$Time)[m],(subsetdata$Time)[length(y)]),labels=c("Thur","Fri","Sat"))
legend("topright",lty=1,cex=0.8,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()