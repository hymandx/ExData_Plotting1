plot4 <- function (){
  
  # Load the source file
  df <- read.csv('figure/household_power_consumption.txt',sep=";",stringsAsFactors = FALSE)
  
  # Use only data of interest
  dfsmall <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
  dfsmall$mydate <- as.POSIXct(paste(dfsmall$Date,dfsmall$Time), 
                               format="%d/%m/%Y %H:%M:%S")
  
  # Make plot into PNG file
  png("plot4.png", height=480, width=480)
  par(mfrow = c(2,2))
  plot(dfsmall$Global_active_power~dfsmall$mydate,type="l",xlab="",ylab="Global Active Power")
  plot(dfsmall$Voltage~dfsmall$mydate,type="l",xlab="",ylab="Voltage")
  plot(dfsmall$Sub_metering_1~dfsmall$mydate,type="l",xlab="",ylab="Energy sub metering")
  lines(dfsmall$Sub_metering_2~dfsmall$mydate,type="l",col="red")
  lines(dfsmall$Sub_metering_3~dfsmall$mydate,type="l",col="blue")
  legend(
         "topright",
         lty = c(1,1,1),
         col = c(
           "black","red","blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(dfsmall$Global_reactive_power~dfsmall$mydate,type="l",xlab="",ylab="Global_reactive_power")
  
  dev.off()
}