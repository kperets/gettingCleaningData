#CodeBook

This CodeBook describes the work and variables used in *run_analysis.R* to acheive the 5 tasks described in
*readme.md* file. 

#Procedures and variables
###Task 1
- **xTest, xTrain, yTest, yTrain, subjectTest, subjectTrain** are the variables holding the data from *X_test.txt, X_train.txt, y_test.txt, y_train.txt, subject_test.txt, subject_train.txt*, which reside in the original data set(refer to *readme.md* for more information)
- Using the *rbind* R function, the train and test sets of each variable are joined to form the variables **xJoined, yJoined, subjectJoined**
- *xJoined* gets the names of the features from *features.txt* from the original data set, *yJoined* represents the activities and named as such(**Activity**), and *subjectJoined* gets the name **Subject**
- These data frames are then joined using the R function *cbind* to form the variable **mergedData**

###Task 2
- To extract only the mean and std measurements we use the *grep* function to find all feature names which contains exactly the string *mean()* or *std()*
- We then subset *mergedData* with **select=c(std or mean feature names, Subject, Activity)**

###Task 3
- The map between activity number and its name is defined in *activity_labels.txt* from the original data set:
  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING
- The activity column is fetched using **mergedData$Activity** and the activity description is fetched using **activityNamesEnum$V2**, where *activityNamesEnum* is the data frame read from *activity_labels.txt*.
- We then use the *factor* function with *mergedData$Activity* data and *activityNamesEnum$V2* as labels.
- Finally, we replace the *mergedData$Activity* column with the result of the previous step.

###Task 4
- In week 3 we've learned that descriptive variable names should have their full names (e.g, DX vs Diagnosis)
- For that, using regular expressions and *gsub* function, we changed the following:
 
 * Variables with *Acc* in their name were changed to *Accelerometer* in their name.
 * Variables with *Mag* in their name were changed to *Magnitude* in their name.
 * Variables with *f* prefix were changed to *frequency* prefix.
 * Variables with *t* prefix were changed to *time* prefix.

###Task 5
- To create independent tidy data set with the average of each variable for each activity and each subject, we define **len** variable which holds the length of our data set minus 2 (Activity and Subject column are of no use for us)
- We then the apply the function *colMeans* on each and every row of our data set using the *ddply* function from *plyr* package
- The output of the last step is then written to a text file called **avg_data.txt**
 
