This repository contains two files:
- run_analysis.R is an R script that tidies data from the accelerometers from the Samsung Galaxy S smartphone. The script assumes that the unzipped Samsung data is in your working directory.
- CodeBook.md is a Markdown file that describes each column in the data frame variable "meansByActivityAndSubject" set by running run_analysis.R

The R script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set produced in step 4 is stored in the variable "allData". The data set produced in step 5 is stored in the variable "meansByActivityAndSubject".

