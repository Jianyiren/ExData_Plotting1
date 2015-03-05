#Preparation
install.packages("lubridate")#to save some efforts playing with time= =
library(lubridate)

#create device
png(filename="C:/Users/Jianyi/Documents/DS4/ProjectI/plot3.png",width=480,height=480,bg="transparent")

#Load the data
data=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data$Date= dmy(data$Date)

#extract subset data relevant to this project, stored them under the name "mydata"
mydata=subset(data,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))
mydata=mydata[complete.cases(mydata$Global_active_power),]

#extract data that related to the plot task
x_axis=strptime(ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time))),"%Y-%m-%d %H:%M:%S")#playing with time always hard= =

y_axis_1=mydata$Sub_metering_1
y_axis_1=as.numeric(y_axis_1)

y_axis_2=(mydata$Sub_metering_2)
y_axis_2=as.numeric(y_axis_2)

y_axis_3=(mydata$Sub_metering_3)
y_axis_3=as.numeric(y_axis_3)


#do the plotting
plot(x_axis,y_axis_1,type="l",xlab="", ylab="Energy sub metering",col="black")
lines(x_axis,y_axis_2,type="l",col="red" )
lines(x_axis,y_axis_3,type="l",col="blue" )
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1),lty =c(1,1,1),pt.cex = 1)


dev.off()

