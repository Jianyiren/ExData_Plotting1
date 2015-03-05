#Preparation
install.packages("lubridate")#to save some efforts playing with time= =
library(lubridate)

#create device
png(filename="C:/Users/Jianyi/Documents/DS4/ProjectI/plot2.png",width=480,height=480,bg="transparent")

#Load the data
data=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data$Date= dmy(data$Date)

#extract subset data relevant to this project, stored them under the name "mydata"
mydata=subset(data,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))
mydata=mydata[complete.cases(mydata$Global_active_power),]

#extract data that related to the plot task
x_axis=strptime(ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time))),"%Y-%m-%d %H:%M:%S")#playing with time always hard= =

y_axis=(mydata$Global_active_power)
y_axis=as.numeric(y_axis)

#plot
plot(x_axis,y_axis,type="l",xlab="",ylab="Global Active Power (kilowatts)" )

dev.off()