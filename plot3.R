#importing the txt file
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#converting Date variable to date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
#subsetting data to just 1/2/2007 and 2/2/2007
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert to days of week
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#draw plot
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
#adding legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = .50)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
