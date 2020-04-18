setwd("D:/Alt/Desktop/Sweetrolls/Uni/Master/Research Project/Isotopen")
data <- read.csv("isotopen.csv",sep=";",dec = ",")

pixel <- read.csv("pixelhoehe.csv", sep=";", header = FALSE)
rownames(pixel)<-pixel[,1]
pixel<- pixel[c(1:7,12,13,15:45),c(2,3)]

rownames(data) <- data[,1]
data <- data[c(1:7,12,13,15:45),c(2,3)]

#C isotopes, O isotopes, C & O of rocks, C & O of bigger shells
Cdata <- cbind(data[,1],pixel[,2])
Cdata <- Cdata[order(Cdata[,2]),]

Odata <- cbind(data[,2],pixel[,2])
Odata <- Odata[order(Odata[,2]),]

x11()
par(mfrow=c(1,2))
plot(Cdata, 
     main = "Carbon Isotopes", xlab = "d13C", yaxt= 'n', ylab = "")
abline(v=c(-42.5+(1:20)*2.5), lty=3, col= "lightgrey")
plot(Odata, 
     main = "Oxygen Isotopes", xlab = "d18O", yaxt= 'n', ylab = "")
abline(v=c(-8+(0:15)*0.5), lty=3, col= "lightgrey")
