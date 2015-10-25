## run_analysis.R
## Script that have the procedure to cover the Project Assigment for "Getting Cleaning Data Course"


## 1. Merges the training and the test sets to create one data set.

## Read "features" table that have the Columns names, assume that the files are in "UCI HAR Dataset" directory

dt_features <- read.table("./UCI HAR Dataset/features.txt", sep = "", col.names= c("feature_id", "feature_name"))


## Read the Training Sets


dt_training <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", col.names = dt_features$feature_name)

## Read the Test Sets

## dt_subject_test <- read.table("./P3/UCI HAR Dataset/test/subject_test.txt", sep = "") 

dt_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", col.names = dt_features$feature_name)


## Merge two dt to create one Set, the "training" and "test" have the same information, so use rbind

dt1 <- rbind(dt_training, dt_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Check which variables are related with "mean" or "standard deviation"

features_mean_standard <- grepl("mean\\(|std\\(",dt_features[,2])

## Create a new data set with only those columns

dt2 <- dt1[features_mean_standard]


## 3. Uses descriptive activity names to name the activities in the data set

## Read Activity Labels

dt_activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", col.names= c("activity_id", "activity_name"))

## Read Activity labels for Training & Test Sets

dt_training_activity_label <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", col.names=c("activity_id"))
dt_test_activity_label <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", col.names=c("activity_id"))


## Merge two Activity Labels Dataset and Merge with Activity Labels to get Descriptive names

dt_activity_by_names <- rbind(dt_training_activity_label, dt_test_activity_label)
dt_activity_by_names <- merge(dt_activity_by_names, dt_activity_label, "activity_id")


## Merge this new vector with previous dataset (dt2) to create the new one, change the new colun name

dt3 <- cbind(dt2,dt_activity_by_names$activity_name)

colnames(dt3)[67] <- "activity_name"


## 4. Appropriately labels the data set with descriptive variable names. 

## The dataset already have the descriptive variable names, at the beginning was read and feature names was assigned. Check step 1


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Read the subject information and proceed as Step 3

## Read Subject labels for Training & Test Sets

dt_training_subject_label <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", col.names=c("subject_id"))
dt_test_subject_label <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", col.names=c("subject_id"))


## Merge the two Activity Labels Dataset and Merge with Activity Labels to get Descriptive names

dt_subject <- rbind(dt_training_subject_label, dt_test_subject_label)

## Create a new dataset using the previous one and the subject labels

dt5 <- cbind(dt3,dt_subject)

## Create a new Dataset that consider the mean by subject and activity_name

dt5 <- aggregate(dt5,by=list(dt5$subject_id,dt5$activity_name),FUN=mean)

write.table(dt5,"table.txt",row.name=FALSE)

