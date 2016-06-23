# Getting Cleaning Data Course Project

The goal of this project is to prepare tidy data that can be used for future analysis.  
 
This repo contains the following:
1. a tidy data set: 'tidy.txt'
2. 'README.md'
3. 'CodeBook.Rmd'
4. a R script called 'run_analysis.R'

The data for this project is [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# # The R script 'run_analysis.R' does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set called 'tidy.txt' with the average of each variable for each activity and each subject.