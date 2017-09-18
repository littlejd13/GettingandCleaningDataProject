> setwd("~/CourseRA/CleanDatawk4/data")
> library(plyr)
> if(!file.exists("./data")){dir.create("./data")}
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(fileUrl,destfile="./data/Dataset.zip")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
downloaded 59.7 MB

> unzip(zipfile="./data/Dataset.zip",exdir="./data")
> # Reading the tables labelled Training
> x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
> y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
> subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
> # Reading the tables labelled Testing
> x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
> y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
> subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
> # Read the vector
> features <- read.table('./data/UCI HAR Dataset/features.txt')
> # Read the activity description labels
> activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
> # Assigns column names
> colnames(x_train) <- features[,2] 
> colnames(y_train) <-"activityId"
> colnames(subject_train) <- "subjectId"
> 
> colnames(x_test) <- features[,2] 
> colnames(y_test) <- "activityId"
> colnames(subject_test) <- "subjectId"
> 
> colnames(activityLabels) <- c('activityId','activityType')
> # Merges data into one primary set
> mrg_train <- cbind(y_train, subject_train, x_train)
> mrg_test <- cbind(y_test, subject_test, x_test)
> setAllInOne <- rbind(mrg_train, mrg_test)
> # Extracts mean and standard dev. for measurements
> colNames <- colnames(setAllInOne)
> mean_and_std <- (grepl("activityId" , colNames) | 
+                      grepl("subjectId" , colNames) | 
+                      grepl("mean.." , colNames) | 
+                      grepl("std.." , colNames) 
+ )
> setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]
> setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
+                               by='activityId',
+                               all.x=TRUE)
> # Establishes a secondary dataset
> twoTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
> twoTidySet <- twoTidySet[order(twoTidySet$subjectId, twoTidySet$activityId),]
> write.table(twoTidySet, "twoTidySet.txt", row.name=FALSE)