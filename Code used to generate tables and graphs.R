instasetwd("C:/Users/steph/Documents/AVR/Consumer Report data/Data/raw_data")
data<-read.csv("Raw results (original download).csv")

#prints table of total patients, survival % and complication % incl min, max, mean, and median, as well as # of NAs
summary(data[,4:6])

#Creating new variable of No complication rate added to survival rate
Aggregate_score<-data_present$No.complication + data_present$Survival

#Removing NA values in order to plot
data_present<-data[complete.cases(data),]

#Stats on data present
summary(data_present[,4:6])

#plotting individually
plot(data_present$Survival)
plot(data_present$No.complication)

#Fitting a regression line for survival plotted against total patients
plot(data_present$Survival, data_present$Total.Patients, pch = 16, col = "blue", main = "Survival plotted against total patients", xlab = "survival (30 day)", ylab = "Total patients undergoing AVR 2011-2014")
abline(lm(data_present$Total.Patients ~ data_present$Survival))

#Fitting a regression line for 30 day no-complication rate plotted against total patients
plot(data_present$No.complication, data_present$Total.Patients, pch = 16, col = "red", main = "No complication rate plotted against total patients", xlab = "No complication rate", ylab = "Total patients undergoing AVR 2011-2014")
abline(lm(data_present$Total.Patients ~ data_present$No.complication))

#Fitting a regression line for Aggregate score plotted against total patients
plot(data_present$Total.Patients, Aggregate_score, pch = 16, cex = 1.3,col = "green", main = "Aggregate score plotted against total patients", ylab = "Aggregate Score", xlab = "Total patients undergoing AVR 2011-2014")
abline(lm(Aggregate_score ~ data_present$Total.Patients))

