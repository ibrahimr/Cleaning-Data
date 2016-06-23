* Information about Source Data Experment
The experiments have been carried out with a group of volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing 

* Structure of Data present in source data folders
README.txt: Details of all the files in downloaded folder
features_info.txt: Shows information about the variables used on the feature vector.
features.txt: List of all features.i.e list of all measurement variables
activity_labels.txt: Lists the activity Id with their corresponding activity name.
train/X_train.txt: Training set.
train/y_train.txt: Training activity Id Labels
train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
test/X_test.txt: Test set.
test/y_test.txt: Test activity Id Labels
test/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* Details about Files to be used in analysis from Source Data

Common Files - features.txt: 561 rows of 2 varibles (feature Identifier and feature Name) - activity_labels.txt: 6 rows of 2 variables (activity identifier and activity name)

Test Dataset - xTest.txt: 2947 rows of 561 measurement variables. These are measurement variables listed in features.txt - yTest.txt: 2947 rows of 1 variables. This is the activity Identifier - subjectTest.txt: 2497 rows of 1 variable (subject Identifier)

Training Dataset - xTrain.txt: 7352 rows of 561 measurement variables. These are measurement variables listed in features.txt - yTrain.txt: 7352 rows of 1 variables. This is the activity Identifier - subjectTrain.txt: 7352 rows of 1 variable (subject Identifier)


* Aggregated Data

Variable Names	subjectId	activityId	(variable names from features.txt)
data	                subjectTest.txt	yTest.txt	xTest.txt
data                	subjectTrain.txt	yTrain.txt	xTrain.txt

* run_analysis.R script has the following requirements to perform transformation on UCI HAR Dataset.

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive activity names.
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
* Detailed Functions of run_analysis.R Script
* 
- Downloads the dataset  
- Imports "test" and "train" datsets and creates data frames from then and then Merges the training and the test sets
  to create one data frame.
 - Extracts a subset of data with only the measurements on the mean "mean()" and standard deviation "std()" for each measurement.  resulting in 10299 observations and 66 measurement variables.
 - Updates the variable names in dataframe variable names for data frame to improve readibility
- labels the data set with descriptive activity names in place of activity Ids
Reshapes dataset to create a data frame with average of each measurement variable for each activity and each subject
Writes new tidy data frame to a text file to create the required tidy data set file of 180 observations and 68 columns (2 columns for activityName and subjectID and 66 columns for measurement variables)

  
  
