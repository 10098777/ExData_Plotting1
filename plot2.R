##R code for plot2
setwd("E:/statistics/coursera/repository/exploratorydataanalysis")
alldata<-read.csv2("household_power_consumption.txt")
alldata$Date<-as.Date(as.character(alldata$Date),format="%d/%m/%Y")
subsetdata<-alldata[alldata$Date=="2007-2-1"|alldata$Date=="2007-2-2",]
subsetdata$Global_active_power<-as.numeric(as.character(subsetdata$Global_active_power))
x<-character()
x<-paste(as.character(subsetdata$Date),as.character(subsetdata$Time),sep=",")
subsetdata$Time<-as.POSIXct(strptime(x,"%Y-%m-%d,%H:%M:%S"))
y<-(strptime(x,"%Y-%m-%d,%H:%M:%S"))$wday
z<-length(y[y==4])
m<-z+1
par(mar=c(5.1,5.1,4,1.5))
with(subsetdata,plot(subsetdata$Time,subsetdata$Global_active_power,xaxt="n",xlab="",ylab="Global Value Power(kilowatts)",type="n"))
lines(subsetdata$Time,subsetdata$Global_active_power)
axis(1,at=c(1,m,length(y)),labels=c("Thur","Fri","Sat"),col="Black")
dev.copy(png,file="plot2.png")
dev.off()



