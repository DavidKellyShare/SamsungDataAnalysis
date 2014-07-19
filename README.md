SamsungDataAnalysis
===================

Coursera Project for Getting and Cleansing Data: Cleanse the accelerometer data from Samsung Galaxy S smartphones


Description:
===================
This repository contains code to create a cleansed version of the Human Activity Recognition Using Smartphones Dataset Version 1.0.  

This data set was originally provided by
  ===================
  Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
  Smartlab - Non Linear Complex Systems Laboratory
  DITEN - Università degli Studi di Genova.
  Via Opera Pia 11A, I-16145, Genoa, Italy.
  activityrecognition@smartlab.ws
  www.smartlab.ws
  ===================
and can be found at the link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

As part of the Coursera Course Getting and Cleansing Data the following zip file was provided which was originally sourced from the above data set.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This repository contains an R program and the above zip file which when used together creates a "tidy" subset of the original data as well as a "tidy" grouped aggregrate.  

File Contents:
===================
getdata_projectfiles_UCI HAR Dataset.zip: This file contains the original data and documentation for the provided data set.

CodeBook.md: This file contains a description of how the data was loaded, transformed and saved for future analysis.

run_analysis.R: This program reads portions of the original data set and produces CSV files that contain the output described in  CodeBook.md

Clean UCI HAR Dataset.csv: This file contains the first "tidy" data set
Average UCI HAR Dataset by Subject by Activity.csv: This file contains the average(mean) of the first data set grouped by Test Subject and Subjects activity.

