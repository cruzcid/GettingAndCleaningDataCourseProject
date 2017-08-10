# GettingAndCleaningDataCourseProject
 The goal is to prepare tidy data that can be used for later analysis.
 

# The dataset add the following files to the existing ones:

- 'run_analysis.R': Perform the analysis detailed on Getting and Cleaning Data Course Project instructions.

- 'meanStandardTrainTest.csv': Extracts only the measurements on the mean and standard deviation for each measurement.

- 'avgByActivitySubject.csv': Data set with the average of each variable for each activity and each subject. 

- 'AvgActivitySubjectVariables.txt': Data varibles of avgByActivitySubject.csv

- 'meanStandardVariables.txt': Data varibles of meanStandardTrainTest.csv


# Original dataset files:

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


# How "run_analysis.R" script works and how the readed files are connected.

  1.- The  script reads the following files as data frames:
      Feature measurements:
      - "UCI HAR Dataset/train/X_train.txt"
      - "UCI HAR Dataset/test/X_test.txt"  
      Activity:
      - "UCI HAR Dataset/train/y_train.txt"
      - "UCI HAR Dataset/test/y_test.txt"
      Subject:
      - "UCI HAR Dataset/train/subject_train.txt"
      - "UCI HAR Dataset/test/subject_test.txt"
      Features names:
      - "UCI HAR Dataset/features.txt"
  2.- Uses a function which replace numbers of the activities with their correspondant descriptive name on activities data           frames.  
   
  3.- Merges the "training" as with its respective "activity" and "subject" set adding them as a column, apply same process to       "test" set.

  4.- Assign the features labels to the "train" and "test" set after formatting each feature label. 

  5.- Merges the "training" and "test" set by rows.
      By this point a general data set is obtained to proceed with further analisys. 
  
  6.- Extracts only the measurements on the mean and standard deviation for each measurement and export 
      data to csv file "UCI HAR Dataset/meanStandardTrainTest.csv".
    
  7.- From the general data set obtained in step 5, creates a second, independent tidy data set with the 
      average of each variable for each activity and each subject.
      Export data to csv file "UCI HAR Dataset/avgByActivitySubject.csv".
  
# Further information about the scipts may be found in the CodeBook.md and run_analysis.R.
