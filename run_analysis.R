#-----Merges the training and the test sets to create one data set.----------

#read all relevant tables from UCI HAR Dataset directory
dataPath <- file.path('UCI HAR Dataset')
xTest  <- read.table(file.path(dataPath, "test" , "X_test.txt" ),header = FALSE)
xTrain <- read.table(file.path(dataPath, "train", "X_train.txt"),header = FALSE)
yTest <-  read.table(file.path(dataPath, "test" , "y_test.txt" ),header = FALSE)
yTrain <-  read.table(file.path(dataPath, "train" , "y_train.txt" ),header = FALSE)
subjectTest  <- read.table(file.path(dataPath, "test" , "subject_test.txt"),header = FALSE)
subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"),header = FALSE)

#join the tables
xJoined<- rbind(xTest, xTrain)
yJoined<- rbind(yTest, yTrain)
subjectJoined <- rbind(subjectTest, subjectTrain)

#the features file holds  the names of the samsung features in column V2
#we'll replace the names of xJoined with the names of the features
features <- read.table(file.path(dataPath, "features.txt"),head=FALSE)

names(xJoined) <- features$V2
names(yJoined) <- c("Activity")
names(subjectJoined) <- c("Subject")

#merging...
subjectMerged <- cbind(subjectJoined, yJoined)
mergedData <- cbind(xJoined, subjectMerged)

#---Extracts only the measurements on the mean and standard deviation for each measurement-------------#



#-------Uses descriptive activity names to name the activities in the data set-----------#


#-----Appropriately labels the data set with descriptive variable names.--------------#



#--Creates a second, independent tidy data set with the average of each variable for each activity and each subject.----#
