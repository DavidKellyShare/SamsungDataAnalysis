## run_analysis.R
## 
## Load in the Samsung accelerometer Data and Labels and construct "tidy" data sets.
## Save the data sets as CSV files
##
## Instructions: 
## Download this file and the following zip file to the same directory
##
## getdata_projectfiles_UCI HAR Dataset.zip
## 
## Source this program and execution will automatically start 
## 
## The data will be loaded, cleansed and saved into two files
##    Clean UCI HAR Dataset.csv  ==> All Rows in Data Set with Mean and Standard Deviation Columns 
##    Average UCI HAR Dataset by Subject by Activity.csv ==> Clean Data set Grouped and Averaged
##    
## 

## Function zipinfo
## 
## List the contents of a zip file. Used for Analysis Only
## 

zipinfo <- function(zipname="getdata_projectfiles_UCI HAR Dataset.zip") {
  
  zipfileinfo <-unzip(zipname,list=TRUE)

}

## Function loaddata
## 
## Load a file from a zip file.  Default load.table options are used
## 

loaddata <- function(zipname="getdata_projectfiles_UCI HAR Dataset.zip",
                     filename
                     ) {
  
  data <- read.table(unz(zipname,filename))

}

## Function mergedata
## 
## Create a data set that contains the required columns.  Can be used for Test or Train Data
## 

mergedata <- function(zipname, featurename, activitylabelname, dataname, subjectname, activityname){
  
  # Load the Feature Names (Measures)
  features<-loaddata(zipname, filename=featurename)
  
  # Load the Data (Measures), assign the Columns Names
  # Keep columns that contain "mean(" or "std" in the name
  data<-loaddata(zipname, filename=dataname)
  colnames(data)<-features$V2
  data <- subset(data,select=grep("mean\\(|std",features$V2,value=TRUE))

  # Load the Subject Number (1-30) associates with each data row
  subject<-loaddata(zipname, filename=subjectname)
  colnames(subject)<-"subject"
  
  # Load the Activity Number (1-6) associated with each data row 
  # Load the Activity Number to Activity Label data
  # Merge Activity Number and Activity Label where the Label's Number matches
  activity<-loaddata(zipname, filename=activityname)
  activitylabel<-loaddata(zipname, filename=activitylabelname)
  activitymerge<-merge(activity,activitylabel,by.x="V1",by.y="V1")
  colnames(activitymerge)<-c("activity","activitylabel")
  
  # create complete rows by merging the Subject, Activity and Data Together 
  data.frame(subject,activitymerge,data)
  
}

## Function savedata
## 
## Write a CSV file from the provided data set
## 

savedata <- function(data, filename){
 
  write.csv(data, file=filename)
  
}

#############################################
#############################################
## 
## Main Program
## 
#############################################
#############################################

# Assign Zip File Name
zipname = "getdata_projectfiles_UCI HAR Dataset.zip"

# Create Consolidated and Filtered Test Data Set
testData <-mergedata(zipname, 
                     "UCI HAR Dataset/features.txt",
                     "UCI HAR Dataset/activity_labels.txt",
                     "UCI HAR Dataset/test/X_test.txt",
                     "UCI HAR Dataset/test/subject_test.txt",
                     "UCI HAR Dataset/test/y_test.txt")

# Create Consolidated and Filtered Train Data Set
trainData <-mergedata(zipname, 
                     "UCI HAR Dataset/features.txt",
                     "UCI HAR Dataset/activity_labels.txt",
                     "UCI HAR Dataset/train/X_train.txt",
                     "UCI HAR Dataset/train/subject_train.txt",
                     "UCI HAR Dataset/train/y_train.txt")

# Combine Test and Train Data into one Set
allData <- rbind(testData,trainData)
remove(testData)
remove(trainData)

# Save Cleansed Data
savedata(allData, "Clean UCI HAR Dataset.csv")

# Aggregate and Group Data
aggData <- aggregate(allData[,4:69],
                     by = list(allData$subject,allData$activity,allData$activitylabel),
                     FUN="mean")

# Assign Column Names
colnames(aggData) <- colnames(allData)

# Save Aggregate Data
savedata(aggData, "Average UCI HAR Dataset by Subject by Activity.csv")


