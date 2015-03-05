#Preparation
install.packages("lubridate")#to save some efforts playing with time= =
library(lubridate)

#create device

png(filename="C:/Users/Jianyi/Documents/DS4/ProjectI/plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))

#Load the data
data=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data$Date= dmy(data$Date)

#extract subset data relevant to this project, stored them under the name "mydata"
mydata=subset(data,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))
mydata=mydata[complete.cases(mydata$Global_active_power),]

#extract data that related to the plot task
x_axis=strptime(ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time))),"%Y-%m-%d %H:%M:%S")#playing with time always hard= =

#do the plotting
  #sub_plot_1
plot(x_axis,as.numeric(mydata$Global_active_power),type="l",xlab="",ylab="Global Active Power")
  #sub_plot_2
plot(x_axis,as.numeric(mydata$Voltage),xlab="datetime",ylab="Voltage",type="l",col="black")
  #sub_plot_3
plot(x_axis,as.numeric(mydata$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",col="black")
lines(x_axis,as.numeric(mydata$Sub_metering_2),type="l",col="red" )
lines(x_axis,as.numeric(mydata$Sub_metering_3),type="l",col="blue" )
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1),lty =c(1,1,1),pt.cex = 1, bty = "n")
  #sub_plot_4
plot(x_axis,as.numeric(mydata$Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l",col="black")


#Close device
dev.off()

