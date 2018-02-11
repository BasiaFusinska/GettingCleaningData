# Feature Selection

The dataset was obtained based on the data were retrieved from the [UCI Human Activity Recognition Using Smartfones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original dataset contains 561 variables for the 10299 signals readings.

To create the new dataset only measurements for mean and standard deviation were chosen whichc resulted in 68 variables. To select the variables the followin regular expression was used: *"mean\\(\\)|std\\(\\)"*.

# Features Aggregation

The resulting dataset was obtained by applying activities labels and subjects to the data. Next step was to aggregate the data by activity name and the subject and getting mean values for all the variables.

# Variables

Except aggregating variables (activity and subject) all the features' names contain "mean()" or "std()" to indicate storing either mean or standard value for the specific reading. Variables with the "-XYZ" in the name denote the 3-axial signals in the X, Y and Z directions. The actual name contains only one dimention.

For instance the tBodyAcc-XYZ indicates that there are 6 variables there:

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z

And for the tBodyAccMag 2 variables:

* tBodyAccMag-mean()
* tBodyAccMag-std()

Name | Position | Description 
--- | --- | ---
activity | 1 | Activity name
subject | 2 | Subject Id
tBodyAcc-XYZ | 3-8 | Body Acceleration signals
tGravityAcc-XYZ | 9-14 | Gravity Acceleration signals
tBodyAccJerk-XYZ | 15-20 | Body Acceleration Jerk signals
tBodyGyro-XYZ | 21-26 | Body Gyroscopic signals
tBodyGyroJerk-XYZ | 27-32 | Body Gyroscopic Jerk signals
tBodyAccMag | 33-34 | Body Acceleration Magnitude signals
tGravityAccMag | 35-36 | Gravity Acceleration Magnitute signals
tBodyAccJerkMag | 37-38 | Body Acceleration Jerk Magnitute signals
tBodyGyroMag | 39-40 | Body Gyroscopic Magnitute signals
tBodyGyroJerkMag | 41-42 | Body Gyroscopic Magnitute Jerk signals
fBodyAcc-XYZ | 43-48 | FFT Body Acceleration signals
fBodyAccJerk-XYZ | 49-54 | FFT Body Acceleration Jerk signals
fBodyGyro-XYZ | 55-60 | FFT Body Gyroscopic signals
fBodyAccMag | 61-62 | FFT Body Acceleration Magnitude signals
fBodyAccJerkMag | 63-64 | FFT Body Acceleration Jerk Magnitute signals
fBodyGyroMag | 65-66 | FFT Body Gyroscopic Magnitute signals
fBodyGyroJerkMag | 67-68 | FFT Body Gyroscopic Magnitute Jerk signals

The next section is the detailed variables description.

## Orinal dataset Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
