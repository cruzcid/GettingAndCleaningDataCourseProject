run_analysis <- function(){
  require(data.table)
  
  ## Read  Training and Test data from sensors as a data frame
  dfXTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE, sep = "")
  dfXTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE, sep = "")
  
  ## Read  activity  performed corresponding to Training and Test datameasurements as a data frame
  dfXTrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE, sep = "")
  dfXTestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE, sep = "")
  
  ## Read  subject corresponding to Training and Test datameasurements as a data frame
  dfXTrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE, sep = "")
  dfXTestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE, sep = "")
  
  ## Change name of V1 column to "subject"
  names(dfXTrainSubject)[names(dfXTrainSubject) == "V1"] = "subject"
  names(dfXTestSubject)[names(dfXTestSubject) == "V1"] = "subject"
  
  ## Transform dataFrame to data.table by reference instead of by copy
  dtXTest <- setDT(dfXTest)
  dtXTrain <- setDT(dfXTrain)
  
  dtXTrainActivity <- setDT(dfXTrainActivity)
  dtXTestActivity <- setDT(dfXTestActivity)
  
  dtXTrainSubject <- setDT(dfXTrainSubject)
  dtXTestSubject <- setDT(dfXTestSubject)
  
  
  #################################################################################
  ##    3.- Uses descriptive activity names to name the activities in the data set.
  #################################################################################
  
  ## Vector wich contains the activity description 
  a <-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  
  ## Return the description of the activity performed 
  describeActivity <- function(activity) {
    a[activity]
  }
  
  dtXTrainActivity[, activityDescription := dtXTrainActivity[,describeActivity(V1)]]
  dtXTestActivity[, activityDescription := dtXTestActivity[,describeActivity(V1)]]
  
  ## Delete column "V1"
  dtXTrainActivity[,V1:=NULL]
  dtXTestActivity[,V1:=NULL]
  
  ## Add activity description to tables
  dtXTrain <- cbind(dtXTrain, dtXTrainActivity )
  dtXTest <- cbind(dtXTest, dtXTestActivity )
  
  ## Add subject which performs test/train to tables  
  dtXTrain <- cbind(dtXTrain, dtXTrainSubject )
  dtXTest <- cbind(dtXTest, dtXTestSubject )
  
  ########################################################################
  ##    1.- Merges the training and the test sets to create one data set.
  ########################################################################
  dtXTrainTest <- merge(dtXTest, dtXTrain, all = TRUE)
  
  
  #################################################################################
  ##    4.- Appropriately labels the data set with descriptive variable names.
  #################################################################################
  
  ## Obtain the names of the features to asign them to the Train and Test data.table
  featuresDf <- read.table("./UCI HAR Dataset/features.txt",header = FALSE, sep = "")
  featuresTitles <- as.character(featuresDf$V2)
  featuresTitles <- append( featuresTitles, c("activityDescription","subject"))
  featuresTitles <- gsub("[-,]","_",featuresTitles)
  featuresTitles <- gsub("([\\()])", "", featuresTitles)
  
  setnames(dtXTrainTest, names(dtXTrainTest), featuresTitles)
  
  #################################################################################################
  ##    2.- Extracts only the measurements on the mean and standard deviation for each measurement.
  #################################################################################################
  
  ## Selects only the mean and standard deviation matches from the table
  meanStandard <- grep("mean$|std$", featuresTitles, perl=TRUE, value=TRUE)
  ## Extracts only the measurements on the mean and standard deviation for each measurement.
  meanStandardDT <- dtXTrainTest[, ..meanStandard]
  
  ## Export data to csv file
  write.csv(meanStandardDT,file = "UCI\ HAR\ Dataset/meanStandardTrainTest.csv")
  
  #################################################################################################
  ##    5.- From the data set in step 4, creates a second, independent tidy data set with the 
  ##        average of each variable for each activity and each subject.
  #################################################################################################
  
  
  varAvgByActivitySubject <- dtXTrainTest[,lapply(.SD,mean(),na.rm=TRUE),by=.(activityDescription,subject)]
  ## Export data to csv file
  write.csv(varAvgByActivitySubject,file = "UCI\ HAR\ Dataset/avgByActivitySubject.csv")
  
}
