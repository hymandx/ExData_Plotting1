plot2 <- function (){
  
  # Load the source file
  df <- read.csv('figure/household_power_consumption.txt',sep=";",stringsAsFactors = FALSE)

  # Use only data of interest
  dfsmall <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
  dfsmall$mydate <- as.POSIXct(paste(dfsmall$Date,dfsmall$Time), 
                               format="%d/%m/%Y %H:%M:%S")
  
  # Make plot into PNG file
  png("plot2.png", height=480, width=480)
  plot(dfsmall$Global_active_power~dfsmall$mydate,
       type="l",
       xlab="",
       ylab="Global Active Power (Kilowatts)")
  dev.off()
}