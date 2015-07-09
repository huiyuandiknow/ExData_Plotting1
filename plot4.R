##  This file was created on 7/9/15
##  
##  Description: This is part of Project 1 for Exploratory Data Analysis course on Coursera
##       
##  Variables:
##            Date: Date in format dd/mm/yyyy
##            Time: time in format hh:mm:ss
##            Global_active_power: household global minute-averaged active power (in kilowatt)
##            Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
##            Voltage: minute-averaged voltage (in volt)
##            Global_intensity: household global minute-averaged current intensity (in ampere)
##            Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
##            Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
##            Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
##
##  Source: UCI WEBSITE at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

## set working directory 
setwd("C:/Users/Moo/Documents/Coursera/Data Science Specialization/4. Exploratory Data Analysis/project 1")

## load the data
data<-  read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", quote ="")

## convert dates to select subset of data to use
data$newdate = as.Date(data$Date,"%d/%m/%Y")

## Use data from the dates 2007-02-01 and 2007-02-02 as instructed
data2 <- data[data$newdate == "2007-02-02" | data$newdate == "2007-02-01",]
data2$Date.with.time <- as.POSIXct(paste(data2$newdate, data2$Time), format="%Y-%m-%d %H:%M:%S")

## check if the dates in the new dataset satisfy the restriction 
unique(data2$newdate)


## create plot 4
par(mfrow= c(2,2))

# create subplot 1
data2$Date.with.time <- as.POSIXct(paste(data2$newdate, data2$Time), format="%Y-%m-%d %H:%M:%S")
plot(x=data2$Date.with.time, 
     y=data2$Global_active_power, 
     xlab= "",
     ylab= "Global Active Power (kilowatts)",
     type="l")

# create subplot 2
plot(x=data2$Date.with.time, 
     y=data2$Voltage, 
     xlab= "datetime",
     ylab= "Voltage",
     type="l")

# create subplot 3
plot(x= data2$Date.with.time, 
     y= data2$Sub_metering_1, 
     xlab="", 
     ylab= "Energy sub metering", 
     type ="l")
lines(x= data2$Date.with.time, 
      y= data2$Sub_metering_2, 
      xlab="", 
      type ="l", 
      col="red")
lines(x= data2$Date.with.time, 
      y= data2$Sub_metering_3, 
      xlab="", 
      type ="l", 
      col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col= c("black", "red", "blue"), lty=c(1,1,1), cex=0.7)

# create subplot 4
plot(x=data2$Date.with.time, 
     y=data2$Global_reactive_power, 
     xlab= "datetime",
     ylab= "Global_reactive_power",
     type="l")

dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()
