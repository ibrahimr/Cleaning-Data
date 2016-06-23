 

# Read and convert data

#training data
X_train <-  read.table (".\\data\\UCIHARDataset\\train\\X_train.txt")
y_train <-  read.table (".\\data\\UCIHARDataset\\train\\y_train.txt")
#test data
X_test <- read.table (".\\data\\UCIHARDataset\\test\\X_test.txt")
Y_test<- read.table (".\\data\\UCIHARDataset\\test\\Y_test.txt")

Features <- read.table(  ".\\data\\UCIHARDataset\\features.txt" ,header=FALSE, stringsAsFactors=FALSE) 

Subjecttrain <- read.table(  ".\\data\\UCIHARDataset\\train\\subject_train.txt") 
Subjecttest <- read.table(  ".\\data\\UCIHARDataset\\test\\subject_test.txt") 

activity_labels <- read.table(".\\data\\UCIHARDataset\\activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)

colnames(X_train) <- t(Features[2])
colnames(X_test) <- t(Features[2])
     
    
   # 1. Merges the training and the test sets to create one data set.
    ## explore the data
      
      # data
   train <- cbind(X_train,Subjecttrain,y_train)
   test <-  cbind(X_test,Subjecttest,Y_test)
   #merging to get data
   data<-rbind(train,test)
   dim(data)
    
   # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
   colnames(Features)<-c("V1","Features" )
   
   #Select all the columns that represent mean or standard deviation 
   # of the measurements with grep order.
 
    
   means_and_stds = data[, grepl( '(-mean\\(\\)|-std\\(\\))', Features$Features )]
   names(means_and_stds)
   dim(means_and_stds)
   
   
   head(means_and_stds)
    
  head(Features[grepl("std|mean)", names(data)), ])
  tail(Features[grepl("std|mean)", names(data)), ])
  
  
   # 3. Uses descriptive activity names to name the activities in the data set
   
   
   #Replacing numeric labels of activity in column 2 of the data frame (from 1 to 6) 
   #by descriptive strings which come from the file activity_labels.txt.
  
  names(means_and_stds)[68]<-  "activity"
  names(means_and_stds)[67]<-  "subject"
 
  means_and_stds$ activity = factor(means_and_stds$activity, levels=c(1,2,3,4,5,6), 
                                         labels=activity_labels$V2)
  
   str(means_and_stds)
   # 4. Appropriately labels the data set with descriptive activity names. 
  names(means_and_stds)<-gsub("Acc", "Accelerometer", names(means_and_stds))
  names(means_and_stds)<-gsub("Gyro", "Gyroscope", names(means_and_stds))
  names(means_and_stds)<-gsub("BodyBody", "Body", names(means_and_stds))
  names(means_and_stds)<-gsub("Mag", "Magnitude", names(means_and_stds))
  names(means_and_stds)<-gsub("^t", "Time", names(means_and_stds))
  names(means_and_stds)<-gsub("^f", "Frequency", names(means_and_stds))
  names(means_and_stds)<-gsub("tBody", "TimeBody", names(means_and_stds))
  names(means_and_stds)<-gsub("-mean()", "Mean", names(means_and_stds), ignore.case = TRUE)
  names(means_and_stds)<-gsub("-std()", "STD", names(means_and_stds), ignore.case = TRUE)
  names(means_and_stds)<-gsub("-freq()", "Frequency", names(means_and_stds), ignore.case = TRUE)
  names(means_and_stds)<-gsub("angle", "Angle", names(means_and_stds))
  names(means_and_stds)<-gsub("gravity", "Gravity", names(means_and_stds))
   
   # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  library(data.table)
   
   #use sugject as factor
   means_and_stds$subject <- as.factor(means_and_stds$subject)
   means_and_stds <- data.table(means_and_stds)
   
   tidyData <- aggregate(. ~subject + activity, means_and_stds, mean)
   tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]
   write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
   
   
    
