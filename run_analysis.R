## Hello. This is my "run_analysis.R" script to execute the assignment fo the Getting and Cleaning Data course.
## The code below will do the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Many thanks for your time and feedback.

## Here starts the script:

library(data.table)

## load and explore the "features" file. 
## It contains the descriptive headers for the variables of the "x_train" and "x_test" datasets.
features <- read.table("../UCI HAR Dataset/features.txt")
class(features)
dim(features)
head(features, 3)
tail(features, 3)

## Start with the "train" datasest: load and explore the relevant files of the "train" datasets 
x_train <- read.table("../UCI HAR Dataset/train/X_train.txt")
class(x_train)
dim(x_train)
head(x_train, 3)[1:5]
tail(x_train, 3)[1:5]

y_train <- read.table("../UCI HAR Dataset/train/y_train.txt")
class(y_train)
dim(y_train)
head(y_train, 3)
tail(y_train, 3)

## Give a descriptive name to the column header
names(y_train) = "activity"

subject_train <- read.table("../UCI HAR Dataset/train/subject_train.txt")
class(subject_train)
dim(subject_train)
head(subject_train, 3)
tail(subject_train, 3)

## Give a descriptive name to the column header
names(subject_train) = "subject"

## Move on to the "test" datasets: load and explore the relevant files of the "test" datasets 
x_test <- read.table("../UCI HAR Dataset/test/X_test.txt")
class(x_test)
dim(x_test)
head(x_test, 3)[1:5]
tail(x_test, 3)[1:5]

y_test <- read.table("../UCI HAR Dataset/test/y_test.txt")
class(y_test)
dim(y_test)
head(y_test, 3)
tail(y_test, 3)

## Give a descriptive name to the column header
names(y_test) = "activity"

subject_test <- read.table("../UCI HAR Dataset/test/subject_test.txt")
class(subject_test)
dim(subject_test)
head(subject_test, 3)
tail(subject_test, 3)

## Give a descriptive name to the column header
names(subject_test) = "subject"

## Give descriptive column names to the x_train and x_test files, as contained in the "features" file
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]

## Identify the columns containg "mean" and "std" variables in the x_train and x_tests datasets.
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_test_cut <- x_test[, mean_and_std]
x_train_cut <- x_train[, mean_and_std]

## merge the three files in the "train" datasets and explore it
train <- cbind(subject_train, y_train, x_train_cut)
class(train)
dim(train)
head(train, 3)[1:5]
tail(train, 3)[1:5]

## merge the three files in the "test" datasets and explore it
test <- cbind(subject_test, y_test, x_test_cut)
class(test)
dim(test)
head(test, 3)[1:5]
tail(test, 3)[1:5]

## merge the "train" and "test" datasets and explore the output
merged_data <- rbind(test, train)
class(merged_data)
dim(merged_data)
head(merged_data, 3)[1:5]
tail(merged_data, 3)[1:5]

## load the file with the descriptive labels for the cativities
activity_labels <- read.table("../UCI HAR Dataset/activity_labels.txt")

## replace the "activity" column with the decriptive labels
merged_data[, 2] <- activity_labels[merged_data[, 2], 2]

## check that merged_data has been correctly updated with the descriptive activity labels
head(merged_data, 3)[1:5]
tail(merged_data, 3)[1:5]

## load the plyr package to use the ddply function 
library(plyr)

## use the ddply function to store the average of each variable for each activity for each subject in a new "tidy_data" table
tidy_data <- ddply(merged_data, .(subject, activity), function(x) colMeans(x[, 3:66]))

## check the newly created tidy_data dataset
class(tidy_data)
dim(tidy_data)
head(tidy_data, 3)[1:5]
tail(tidy_data, 3)[1:5]

## The tidy_data table looks in order. Go ahead and create a separate dataset for the average of each variable for each activity and each subject.
write.table(tidy_data, "averages_data.txt", row.name=FALSE)