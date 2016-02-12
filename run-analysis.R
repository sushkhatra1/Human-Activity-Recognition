##Coursera:Getting&Cleaning Data
##Final project
##Here are the data for the project:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##I should create one R script called run_analysis.R that does the following.
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names.
## 5.From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

##1 Setting working directory
setwd("/Users/shushanikgasparyan/Desktop/Coursera/UCIHARDataset")

##2.reading the data from test folder
subjecttest=read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)
##reading from train folder
subjectTrain= read.table('./train/subject_train.txt',header=FALSE)
xTrain= read.table('./train/x_train.txt',header=FALSE)
yTrain= read.table('./train/y_train.txt',header=FALSE)

##reading remaining data
features = read.table('./features.txt',header=FALSE); 
activityType = read.table('./activity_labels.txt',header=FALSE); 

##Giving names to columns
colnames(activityType)  = c('activityId','activityType')
colnames(subjectTrain)  = "subjectId"
colnames(xTrain)        = features[,2] 
colnames(yTrain)        = "activityId"
colnames(subjecttest) = "subjectId"
colnames(xTest)       = features[,2]
colnames(yTest)       = "activityId"

##Creating one dataset for all traindata
trainData=cbind(yTrain,subjectTrain,xTrain)

##Creating one dataset for all testdata
testData = cbind(yTest,subjecttest,xTest)

##Now completing first part of the assignment:
##Merging the training and the test sets to create one data set
MergedData = rbind(trainData,testData)

###
ColumnsNames<-colnames(MergedData)

##this vector helps me to indicate the required columns
Indicator<-(grepl("activityId",ColumnsNames) | grepl("subjectId",ColumnsNames) | grepl("-mean..",ColumnsNames) & !grepl("-meanFreq..",ColumnsNames) & !grepl("mean..-",ColumnsNames) | grepl("-std..",ColumnsNames) & !grepl("-std()..-",ColumnsNames))
 
## Now subsetting our dataset to only required columns with help of Indicator
##this is actualy the second part of assignment
MergedData=MergedData[Indicator==TRUE]

##Now to complete the 3d part we need to join Mergeddata with activityType using the common activityID
MergedData = merge(MergedData,activityType,by='activityId',all.x=TRUE)

## 4th requirment is about giving proper labeles to the variables we have in MergedData
ColumnsNames1<-colnames(MergedData)
for(i in 1:length(ColumnsNames1))
{
        ColumnsNames1[i]=gsub("-std$","StandartDeviation",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("\\()","",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("^t","time",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("^f","frequency",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("BodyBody","Body",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("Gyro","Gyroscope",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("Mag","Magnitude",ColumnsNames1[i])
        ColumnsNames1[i]=gsub("Acc","Accelerometer",ColumnsNames1[i])
}

colnames(MergedData)=ColumnsNames1

##now to fifth step:
SubMergedData  = MergedData[,names(MergedData) != 'activityType'];
tidydata    = aggregate(SubMergedData[,names(SubMergedData) != c('activityId','subjectId')],by=list(activityId=SubMergedData$activityId,subjectId = SubMergedData$subjectId),mean);
tidydata    = merge(tidydata,activityType,by='activityId',all.x=TRUE);

head(tidydata)

