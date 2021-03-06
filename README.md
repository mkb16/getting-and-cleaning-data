## Getting-and-cleaning-data course project

## Goal
The goal is to prepare tidy data that can be used for later analysis. 
The follwing files are included:
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
4) README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## What the code does
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Working of the code
1.	Necessary packages are downloaded 
2.	The file is unzipped and the files are listed
3.	Train and test data set are loaded 
4.	The data set is merged using the rbind() and cbind() function
5.	Features names are loaded into R
6.	Using grep()  function, only the measurements on the mean and standard deviation for each measurement are extracted 
7.	The activity names are read from feature.txt file
8.	These names are used to name the activities in the data set
9.	All the data set are merged
10.	Using the lapply() function , a second, independent tidy data set with the average of each variable for each activity and each subject is created 
11.	This is written as clean.txt file using write.table()

