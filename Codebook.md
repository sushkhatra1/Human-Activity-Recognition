	                                    ##  COURSERA/GETTING AND CLEANING DATA/4TH-LAST WEEK PROJECT
	                                      

This document describes the variables, the data, and any transformations or work that I performed to clean up the data

###Source

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### Data Set Information:
 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training
data and 30% the test data.  The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features
was obtained by calculating variables from the time and frequency domain.

###Attribute Information
For each record in the dataset it is provided:
.Point 1 Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*  Triaxial Angular velocity from the gyroscope.
*  A 561-feature vector with time and frequency domain variables.
*  Its activity label.
*  An identifier of the subject who carried out the experiment.


So the idea was to write R-script that does the fallowing 

###1.Merges the training and the test sets to create one data set.
 
 Firstly I read to R all given files with data, assigning them to fallowing variables
*subjecttest
*xTest 
*yTest
*subjectTrain
*xTrain
*yTrain
*features
*activityType

Then they were merged in appropriate way and variable  "MergedData" was created

###2.Extracts only the measurements on the mean and standard deviation for each measurement.
I created a logical vector "Indicator"  that contains TRUE values for the ID, mean and stdev columns and 
FALSE values for the others.  After that, I subseted the data to keep only the necessary columns.

###3.Uses descriptive activity names to name the activities in the data set
I merged data subset with the activityType table to inlude the descriptive activity names the result was assigned to a variable called "MergedData"

###4.Appropriately labels the data set with descriptive variable names
 gsub function was used to clean up the data.
 
 ###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 The aim of this part was reached by using "agregate" function, so tidydata object was created, that was containing the average of each 
  variable for each activity and each subject
 
 