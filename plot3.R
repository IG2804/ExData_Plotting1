getwd()
setwd("C:/Ishani/Learning R/Exploratory Data Analysis/Week1")
elec_cons_dat <- read.table("C:/Ishani/Learning R/Exploratory Data Analysis/Week1/household_power_consumption.txt",
header = TRUE, row.names = NULL, sep = ";", quote=NULL, comment='')


#Convert Date field to a date variable
 elec_cons_dat$Date <- as.Date(elec_cons_dat$Date, "%d/%m/%Y")
 d1 <- as.Date("2007-02-01")
 d2 <- as.Date("2007-02-02")
 d <- seq(d1, d2, by = "days")
 elec_cons_dat2 <- subset(elec_cons_dat, Date %in% d)


 #Convert Time to a time variable
 # elec_cons_dat2$Time <- format(elec_cons_dat2$Time, "%H:%M:%S" )
 # elec_cons_dat1$Time <- strptime(elec_cons_dat1$Time, "%H:%M:%S")
 
 elec_cons_dat2$newtime <- paste(elec_cons_dat2$Date, elec_cons_dat2$Time)
 elec_cons_dat2$newtime <- strptime( elec_cons_dat2$newtime, "%Y-%m-%d %H:%M:%S" )
 
 elec_cons_dat2$Global_active_power <- as.numeric(as.character(elec_cons_dat2$Global_active_power))
 elec_cons_dat2$Sub_metering_1 <- as.numeric(as.character(elec_cons_dat2$Sub_metering_1))
 elec_cons_dat2$Sub_metering_2 <- as.numeric(as.character(elec_cons_dat2$Sub_metering_2))
 elec_cons_dat2$Sub_metering_3 <- as.numeric(as.character(elec_cons_dat2$Sub_metering_3))
 
 png("plot3.png",  width = 480, height = 480)
 
 plot(elec_cons_dat2$newtime, elec_cons_dat2$Sub_metering_1, type = "l", xlab = "" , ylab = "Energy sub metering")
 lines(elec_cons_dat2$newtime, elec_cons_dat2$Sub_metering_2, type = "l", col ="Red")
 lines(elec_cons_dat2$newtime, elec_cons_dat2$Sub_metering_3, type = "l", col = "Blue")
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red","blue"))
 dev.off()
 
 