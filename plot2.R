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
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()