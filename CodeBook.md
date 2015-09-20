####This is the Code Book for the analysis I have run for the Coursera's Getting and Cleaning data course project.####

######The Variables######
The dataset provided by Coursera for this project comes from an experiment involving 30 subjects, wearing a Samsung smartphone. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

561 variables were recorded for each subject, performing each of the six activities mentioned above.

**A detailed description of the experiment can be found here:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**The Dataset Provided by Coursera.**
The full dataset provided for this project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

######The Assignement######
We were asked to create an R script to:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

######Files needed to do the assignment######
Not all the files provided by Coursera were needed to do the assignment.

The relevant files were:

1. README.txt: an overview of the experiment and the data 
2. features.txt: a list of the 561 signals collected for each subject in each activity
3. features_info.txt: a decription of the variables collected for each signal
4. activity_labels.txt: the numeric label for each one of the six activities performed by each subject
5. the training dataset: it contains 3 files needed for this assignment. x_train.txt(the variables collected), y_train.txt(the numeric activity label) and subject_train.txt(the subjects' identifiers). The sub-folder Inertial Signals was not needed for this assignment.
6. the test dataset: it contains 3 files needed for this assignment. x_test.txt(the variables collected), y_test.txt(the numeric activity label) and subject_test.txt(the subjects' identifiers). The sub-folder Inertial Signals was not needed for this assignment.

######The Variables######
For each of the 561 signals were recorded the following variables:
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

######The work done to the data######
In the run_analysis.R file enclosed in this repo you will find a step-by-step decription of all the operation I have done to the data. In essence the following tasks were performed, as requested:
1. the relevant files, described above, features.txt, activity_labels.txt, and the 3 files in the train and test datasets were loaded into R studio, using the read.table function
2. the files were explored for their class and dimensions, then merged together with the appropriate decritptive labels
3. the measurements corresponding to mean and standard devation were extracted
4. a second, independent tidy data set was created with the average of each variable for each activity and each subject, and saved as a txt file with the write.table function as requested.

