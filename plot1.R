##R code for plot1
setwd("E:/statistics/coursera/repository/exploratorydataanalysis/project1")
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
alldata<-read.csv2("household_power_consumption.txt")
alldata$Date<-as.Date(as.character(alldata$Date),format="%d/%m/%Y")
subsetdata<-alldata[alldata$Date=="2007-2-1"|alldata$Date=="2007-2-2",]
subsetdata$Global_active_power<-as.numeric(levels(subsetdata$Global_active_power)[subsetdata$Global_active_power])
par(mar=c(5.1,5.1,4.1,1.5))
hist(subsetdata$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()