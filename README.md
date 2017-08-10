# GettingAndCleaningDataCourseProject
 The goal is to prepare tidy data that can be used for later analysis.
 

# The dataset add to the following files to the existing ones:

- 'run_analysis.R': Perform the analysis detailed on Getting and Cleaning Data Course Project instructions.

- 'meanStandardTrainTest.csv': Extracts only the measurements on the mean and standard deviation for each measurement.

- 'avgByActivitySubject.csv': Data set with the average of each variable for each activity and each subject. 

- 'AvgActivitySubjectVariables.txt': Data varibles of avgByActivitySubject.csv

- 'meanStandardVariables.txt': Data varibles of meanStandardTrainTest.csv

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features_info_merged.txt': Shows information about the variables used on the feature vectors.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


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
  
# Further information about the scipts may be found in the CodeBook.md and run_analysis.R.
