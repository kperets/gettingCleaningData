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
#the features table has all mean and std features stated with mean()/std() e.g:"fBodyBodyGyroMag-mean()"
#note that () must be escaped in order to get exactly mean() and not features like "fBodyBodyGyroJerkMag-meanFreq()"
featureNames <- features$V2
meanIndices <- grep("mean\\(\\)",features$V2)
stdIndices <- grep("std\\(\\)",features$V2)
meanOrStdIndices <- c(meanIndices,stdIndices)
meanOrStdFeatures <- featureNames[meanOrStdIndices]
selectedNames<-c(as.character(meanOrStdFeatures), "Subject", "Activity" )
mergedData<-subset(mergedData,select=selectedNames)


#-------Uses descriptive activity names to name the activities in the data set-----------#
activityNamesEnum <- read.table(file.path(dataPath, "activity_labels.txt"),header = FALSE)
#activityNamesEnum now holds the enumerations of activities 1-6 in column V2
activityNames <- activityNamesEnum$V2
factorizedData <- factor(mergedData$Activity, labels = activityNames)
mergedData$Activity <- factorizedData

#-----Appropriately labels the data set with descriptive variable names.--------------#
#in week 3: Variable names should be
  # Descriptive (DX vs Diagnosis)
names(mergedData)<-gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData)<-gsub("Mag", "Magnitude", names(mergedData))
names(mergedData)<-gsub("^t", "time", names(mergedData))
names(mergedData)<-gsub("^f", "frequency", names(mergedData))


#--Creates a second, independent tidy data set with the average of each variable for each activity and each subject.----#
#create data without the columns Subject and Activity
len <- length(names(mergedData)) - 2 #omit the Activity and Subject columns
avgData <- ddply(mergedData, c("Subject","Activity"), function(dataset) colMeans(dataset[, 1:len]))
write.table(avgData,"avg_data.txt",row.name=F)
