
R version 3.1.1 (2014-07-10) -- "Sock it to Me"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> getwd()
[1] "C:/Users/Khushil/Documents"
> data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
+                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
> data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
> data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
> rm(data_full)
> datetime <- paste(as.Date(data$Date), data$Time)
> data$Datetime <- as.POSIXct(datetime)
> par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
> with(data, {
+     plot(Global_active_power~Datetime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     plot(Voltage~Datetime, type="l", 
+          ylab="Voltage (volt)", xlab="")
+     plot(Sub_metering_1~Datetime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~Datetime,col='Red')
+     lines(Sub_metering_3~Datetime,col='Blue')
+     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
+            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
+     plot(Global_reactive_power~Datetime, type="l", 
+          ylab="Global Rective Power (kilowatts)",xlab="")
+ })
> dev.copy(png, file="plot4.png", height=480, width=480)
png 
  4 
> dev.off()
RStudioGD 
        2 
