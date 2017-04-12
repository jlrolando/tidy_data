-----------------------------------------------------------------  
Jose L. Rolando  
2017  
-----------------------------------------------------------------  
# Read me run_analysis.R script  
## Script description  
The present script: i. loads the train and test data frames of "Human Activity Recognition Using Smartphones Dataset" v.1.0 (Anguita et al., 2012) into R, ii. merges them, iii. give proper variables (column) names, iv. subsets the merged data set into subject and activity, v. and provides the mean and standard deviation of each subset in a final tidy table.

## Codebook  
### Variable names  

When "-XYZ" is anotated, 3 different variables are present in the Dataset, one for each dimension.  
The mean (mean) and standard deviation (std) of the Dataset are explained as Anguita et al (2012):  

<i>"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.</i>  

<i>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).</i>  

<i>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."</i>  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag 

<i>"Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable"</i>  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean

From each variable, the average mean and std per subject and activity is presented in the "tidy_dataset.txt" table.
