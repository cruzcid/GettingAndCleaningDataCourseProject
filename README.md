# GettingAndCleaningDataCourseProject
 The goal is to prepare tidy data that can be used for later analysis.
 
# The dataset add to the following files to the existing ones:

- 'run_analysis.R': Perform the analysis detailed on Getting and Cleaning Data Course Project instructions.

- 'meanStandardTrainTest.csv’: Extracts only the measurements on the mean and standard deviation for each measurement.

- 'avgByActivitySubject.csv': Data set with the average of each variable for each activity and each subject. 

# How scripts work and how they are connected.
  The run_analysis.R script reads "UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/test/X_test.txt"  as a data.table
  and a ssociate them with their respectiv activity and subject from "UCI HAR Dataset/train/y_train.txt",
  "UCI HAR Dataset/test/y_test.txt", "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/train/subject_train.txt" files.
    
  Uses descriptive activity names to name the activities in the data set by applying a function which replace 
  numbers with the correspondant descriptive name.
  
  Merges the training and the test sets to create one data set.  
  
  Appropriately labels the data set with descriptive variable names by obtaining
  the names of the features to asign them to the Train and Test data.table. 
  
  By this point a general data set is obtained to proceed with further analisys. 
  
  Extracts only the measurements on the mean and standard deviation for each measurement and export 
  data to csv file "UCI HAR Dataset/meanStandardTrainTest.csv".
    
  From the general data set, creates a second, independent tidy data set with the 
  average of each variable for each activity and each subject.
  Export data to csv file "UCI HAR Dataset/avgByActivitySubject.csv".
  
# Further information about the scipts may be found in the CodeBook.md, README.txt and run_analysis.R.
