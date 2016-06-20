  Cleaning-Data
Project to clean data
  Read and convert data
```{r}
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
     head(X_train,2)
     head(X_test,2 )
     dim(X_test)
     str(X_train)
     X_train[1:2,560:561]
     dim(X_train)
     View(X_train)
     str(Y_test)
     head(y_train)
     head(Y_test)
     str(y_train)
     
     head(Features)
     dim(Features)
     
     dim(X_train)
     dim(y_train)
     
     head(Subjecttrain,2)
     head(Subjecttest,2)
     
     colnames(X_train) <- t(Features[2])
     colnames(X_test) <- t(Features[2])
     
    ```
    
    1. Merges the training and the test sets to create one data set.
    ```{r}
    ## explore the data
     head(train,2);   head(test,2);   dim(train);   dim(X_train);   dim(train);   dim(test)
     dim(Y_test)
      # train and test data
   train <- cbind(X_train,Subjecttrain,y_train)
   test <- cbind(X_test,Subjecttest,Y_test)
  
   colnames(X_test)
   
   #merging to get data
   data<-rbind(train,test)
   head(data,2)
   ```
   
     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
     ```{r}
   head(Features )
   colnames(Features)<-c("V1","Features" )
   
   #Select all the columns that represent mean or standard deviation 
   #of the measurements with grep order.
   mean_std <- data[,grep(pattern="std|mean", x=Features, ignore.case=TRUE)]
    
   ```
   
   3. Uses descriptive activity names to name the activities in the data set
   Replacing numeric labels of activity in column 2 of the data frame (from 1 to 6) 
   by descriptive strings which come from the file activity_labels.txt.

```{r}
   activity_labels  
   activity_labels <- as.character( activity_labels[,2])
   data$activity <- activity_labels[data$activity]
   ```
   
    4. Appropriately labels the data set with descriptive activity names. 
    ```{r}
   head(Features   )
   tail(Features   )
   Features <- make.names(Features[,"Features"])
   Features[562] = "subject"
   Features[563] = "activity"
   #explore
    colnames(data) <- Features
   length(Features)
    head(data)
   
   ```
   
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    ```{r}
   labels <- colnames(data)[-c(562,563)]
   data2 <- sapply(X=labels, FUN=function(x) tapply(data[[x]], list(data$activity, data$subject), mean))
   names(data2) <- labels
  
    write.table(unlist( data2), file = "tidy_data.txt", row.name=FALSE ) 
  
   data2<- data.frame(unlist( data2) )
 
    head(data2,1)
    str(data2)
    View(data2)
    dim(data)
    ```
   
   
   
