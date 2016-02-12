#Getting and Cleaning Data

	This is the course project for the Getting and Cleaning Data Coursera course.
 	The R script, run_analysis.R, does the following:
 	
 	1. First I set my working directory
 	2. Than I Read data from test and train folders, also data that contains in features.txt
 	    and activity_labels.txt
 	3. Than I give labels to the columns of all read data, considering key "activityId" column
 	4. Than the data was merged
 	5. An Indicator(logical vector) was created that would turn true in required columns.
 	   That was done to subset the original merged dataset to the required one.
 	6. Columns names in the subset were edited so as to become more user understandable
 	7. Aggregation was applied on the resulting dataset. As a result I got independent tidy
 	   data set with the average of each variable for each activity and each subject.