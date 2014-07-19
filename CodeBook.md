SamsungDataAnalysis
===================

Coursera Project for Getting and Cleansing Data: Cleanse the accelerometer data from Samsung Galaxy S smartphones

===================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

===================
To produce the Clean data set, the following files were loaded from the zip file

- "UCI HAR Dataset/features.txt"            ==> The Text Labels for the 561 Observations
- "UCI HAR Dataset/activity_labels.txt"     ==> The Text Labels for the 6 Activities
- "UCI HAR Dataset/test/X_test.txt"         ==> The Observation Data
- "UCI HAR Dataset/test/subject_test.txt"   ==> The Subject being measures from 1-30 
- "UCI HAR Dataset/test/y_test.txt"         ==> The Activity being performed from 1-6
- "UCI HAR Dataset/train/X_train.txt"       ==> The Observation Data
- "UCI HAR Dataset/train/subject_train.txt" ==> The Subject being measures from 1-30 
- "UCI HAR Dataset/train/y_train.txt"       ==> The Activity being performed from 1-6

The Test and Train data is concatentated together one after the other.  Only columns that contain Mean or Standard Deviation metrics were maintained  the Subject and Activity data was prefixed to each row as part of the first dataset.

===================
For each record the Clean data set contains:
- Subject: A number representing the person being tested
- Activity: A number representing the activity being performed (Sitting, Standing, ...)
- Activity Labal: The activity being performed (Sitting, Standing, ...)
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 

===================
To produce the Aggregate data set, the Clean data group by the first three columns and all the remaining columns were averaged by this grouping

===================
For each record the Aggregate data set contains 1 row for each of the following groups:
- Subject: A number representing the person being tested
- Activity: A number representing the activity being performed (Sitting, Standing, ...)
- Activity Labal: The activity being performed (Sitting, Standing, ...)

with an Average of the following measures:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, 
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its 
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
