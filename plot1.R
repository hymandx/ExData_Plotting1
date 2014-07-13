plot1 <- function (){
  
  # Load the source file
  df <- read.csv('figure/household_power_consumption.txt',sep=";",stringsAsFactors = FALSE)

  # Use only data of interest
  dfsmall <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
  dfsmall$mydate <- as.POSIXct(paste(dfsmall$Date,dfsmall$Time), 
                               format="%d/%m/%Y %H:%M:%S")
  
  # Make plot into PNG file
  png("plot1.png", height=480, width=480)
  hist(as.numeric(dfsmall$Global_active_power), 
       col="red", 
       xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  dev.off()
}