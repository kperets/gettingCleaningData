# Getting and cleaning data - March 2015

This repository holds the course project from the coursera course https://class.coursera.org/getdata-012.
The script *run_analysis.R* operates on a data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script essentially does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Running the script
- Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Extract the zip file and verify that you have a directory called *UCI HAR Dataset*
- Place *run_analysis.R* in the same directory where you put *UCI HAR Dataset*
- Import the script to R Studio and run it
- The artifact of this script would be a file called *avg_data.txt*- a data set with the average of each variable for each activity and each subject
