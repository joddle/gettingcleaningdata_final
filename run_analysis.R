## This is the Getting and Cleaning Data Course Project
## By Derek O'Connor 
## June 2, 2019

library(dplyr)

## setwd("/Users/derek/Desktop/R Programming/Coursera — Getting & Cleaning Data")
filename <- "dataset.zip"
if(!file.exists(filename)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,destfile="dataset.zip",method="curl")
}
if(!file.exists("UCI HAR Dataset")) {
  unzip("dataset.zip")
}

trainDataObs <- read.table("./UCI HAR Dataset/train/X_train.txt") 
trainActivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trainActivities) <- "activity"
colnames(trainSubjects) <- "subject"

features <- read.table("./UCI HAR Dataset/features.txt")
dataVariableNames <- as.character(features[,2])
## create a vector of dataframe variable names

colnames(trainDataObs) <- dataVariableNames

testDataObs <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(testActivities) <- "activity"
colnames(testSubjects) <- "subject"
colnames(testDataObs) <- dataVariableNames

## bind the subjects, activities, and observations together
## ... for both the training data and test data
## ... then merge the two data sets
trainData <- cbind(trainSubjects,trainActivities,trainDataObs)
testData <- cbind(testSubjects,testActivities,testDataObs)
mergedData <- rbind(trainData,testData)
## merge together training and test sets to create one data set
## 

## clean up the column names by eliminating special characters: "-", "()"
## gsub("-","",names(mergedData))
## gsub("\\(\\)","",names(mergedData))

## any variable names including mean() or std() is a measure of mean or standard deviation
## ... we will eliminate all other variables

meanCols <- grep("mean\\(\\)",names(mergedData))
stdCols <- grep("std\\(\\)",names(mergedData))
keepCols <- sort(c(1,2,meanCols,stdCols))

mergedData <- mergedData[,keepCols]

## Rename the activity names (descriptive instead of numerical)
## 1 = walking, 2 = walking upstairs, 3 = walking downstairs
## 4 = sitting, 5 = standing, 6 = laying

mergedData$activity <- sub("1","walking",mergedData$activity)
mergedData$activity <- sub("2","walking upstairs",mergedData$activity)
mergedData$activity <- sub("3","walking downstairs",mergedData$activity)
mergedData$activity <- sub("4","sitting",mergedData$activity)
mergedData$activity <- sub("5","standing",mergedData$activity)
mergedData$activity <- sub("6","laying",mergedData$activity)

## label the data set with descriptive names...

## eliminate unnecessary special characters
names(mergedData) <- sub("-","",names(mergedData))
names(mergedData) <- sub("\\(\\)","",names(mergedData))
names(mergedData) <- sub("-"," ",names(mergedData))
## this last line gets the second instances of "-" in the variable names

## write out abbreviations for clarity
names(mergedData) <- sub("^t","time ",names(mergedData))
names(mergedData) <- sub("^f","frequency ",names(mergedData))
names(mergedData) <- sub("Acc","acceleration ",names(mergedData))
names(mergedData) <- sub("Mag","magnitude ",names(mergedData))
names(mergedData) <- sub("Gyro","gyroscope ",names(mergedData))
names(mergedData) <- sub("X","in the x direction",names(mergedData))
names(mergedData) <- sub("Y","in the y direction",names(mergedData))
names(mergedData) <- sub("Z","in the z direction",names(mergedData))

names(mergedData) <- sub("Gravity","gravity ",names(mergedData))
names(mergedData) <- sub("Jerk","jerk ",names(mergedData))
names(mergedData) <- gsub("Body","body ",names(mergedData))

mergedData$subject <- as.factor(mergedData$subject)
mergedData$activity <- as.factor(mergedData$activity)

## final tidy data set created

## creates an independent tidy data set with...
## ... average of each variable for each activity and for each subject

sortedData <- cbind(paste(mergedData$subject,mergedData$activity),mergedData[,3:ncol(mergedData)])
names(sortedData)[1] <- "subject and activity"
meanData <- aggregate(sortedData[2:ncol(sortedData)], by=list(sortedData$'subject and activity'), FUN=mean)
names(meanData)[1] <- "subject and activity"
names(meanData)[2:ncol(meanData)] <- paste("mean of",names(meanData)[2:ncol(meanData)])

write.table(meanData,file = "meanData.txt",row.names = FALSE)

