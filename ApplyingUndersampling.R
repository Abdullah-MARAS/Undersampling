
#Installing Packages
install.packages('unbalanced')
library(unbalanced)
#Install data
data(ubIonosphere)

#Columns number of dataset
n <- ncol(ubIonosphere)
#Separating target and predictive attributes
output <- ubIonosphere[ ,n]
input <- ubIonosphere[ ,-n]
#Frequency Distribution
set.seed(1234)
table(ubIonosphere$Class)

#Applying Oversampling
data <- ubBalance(X=input, Y=output, type="ubOver", k=0)
#Oversampled dataset
overData <- data.frame(data$X, Class=data$Y)
#Summary statistics of oversampled data
summary(overData$Class)

#Applying Undersampling
data <- ubBalance(X=input, Y=output, type="ubUnder", perc=50, method="percPos")
#Undersampled Data
underData <- data.frame(data$X, Class=data$Y)
#Summary statistics of undersampled data
summary(underData$Class)

