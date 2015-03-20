#CodeBook

This CodeBook describes the work and variables used in *run_analysis.R* to acheive the 5 tasks described in
*readme.md* file. 

#Procedures and variables
###Task 1
- *xTest, xTrain, yTest, yTrain, subjectTest, subjectTrain* are the variables holding the data from *X_test.txt, X_train.txt, y_test.txt, y_train.txt, subject_test.txt, subject_train.txt*, which reside in the original data set(refer to *readme.md* for more information)
- Using the *rbind* R function, the train and test sets of each variable are joined to form the variables *xJoined, yJoined, subjectJoined*
- *xJoined* gets the names of the features from *features.txt* from the original data set, *yJoined* represents the activities and named as such, and *subjectJoined* gets the name *Subject*
- These data frames are then joined using the R function *cbind* to form the variable *mergedData*

###Task 2
- To extract only the mean and std measurements we use the *grep* function to find all feature names which contains exactly the string *mean()* or *std()*
- We then subset *mergedData* with *select=c(std or mean feature names, Subject, Activity)*

###Task 3

-The map between activity number and its name is defined in *activity_labels.txt* from the original data set:
  -1 WALKING
  -2 WALKING_UPSTAIRS
  -3 WALKING_DOWNSTAIRS
  -4 SITTING
  -5 STANDING
  -6 LAYING
-
