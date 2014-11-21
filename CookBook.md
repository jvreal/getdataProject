## Coursera Getting and Cleaning Data Course Project
### Cookbook file for explaination of data, variables, and transformations performed

Input data is retrieved from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More information on this input data was provided from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


With data extracted to director called "data" in same directory as runanalysis.R, that script
can be used to provide tidy data set.  

Step 1 - Merge the training and the test data sets to create one data set.

Follow input data is merged

7352 observations for training  data set
Subject Id data for training data set retrieved from 'train/subject_train.txt'
Activity label for the training data set retrieved from 'train/X_train.txt': Training set.
Training data set measurements retrieved from 'train/y_train.txt': Training labels.

2947 observations from test data set
Subject Id data for test data set retrieved from 'test/subject_test.txt'
Activity label for test data set retrieved from 'test/X_test.txt': Test set.
Test data set measurements retrieved from 'test/y_test.txt': Test labels.

Subject Id, Activity label, and variable measurement for each observation for each data set were bound,
and then the test and training data sets were bound to create single data set of test and training data.

Step 2 - Extract only the measurements on the mean and standard deviation for each measurement

Of the initial 561 variable measuments on variables with mean() and std() for only triaxial measurements 
were retained.  So I decide as part of the exercise to tidy the data for this analysis to subset to those 
variables with mean()-X, mean()-Y, mean()-Z and std()-X, std()-Y, std()-Z to provide 48 
measurements per observation

Step 3 - Uses descriptive activity names to name the activities in the data set

'activity_labels.txt': Links the class labels with their activity name.

and the activity names were substituted for data in the y_train and y_test data.

Step 4 - Appropriately labels the data set with descriptive variable names

For this transformation the variable names were retrieved from features.txt file.  Text editing was perform to
attempt to provide more meaningful description and to follow a variable name convention.

Step 5 - From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject

Here the data is shaped to provide a tidy set with only the average of each available for each activity
and subject.

