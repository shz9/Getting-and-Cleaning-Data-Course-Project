Pre-Processed Human Activity Recognition Dataset Codebook
========================================================
Author: Shadi Zabad,
Getting and Cleaning Data Course,
21 June 2014

## Introduction

This file contains essential information about the original as well as the output datasets and the transformation that took place in between. Since this is mainly pre-processing an existing dataset that was provided by another group of researchers, I reprocude their description of the experimental design here and include a description of the transformations that I did on the raw data. 

## The Original Dataset

This is a description of the raw Human Activity Recognition Dataset as provided by its creators. For more information or to download the dataset, please visit its entry on the UCI Machine learning repository: [Human Activity Recognition Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Experimental design: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## The Output Dataset (tidy_data.txt)

This section contains general information about the various transformations that were applied to the raw Human Activity Recognition Dataset, and the type of variables in the output file that the pre-processing script generates.

### Experimental design: 

After obtaining the raw dataset that was described above, I combined the training and testing subsets into 1 uniform dataset that includes all the variables needed for the transformation (i.e. the subject as well as the activity columns). From the combined dataset, I extracted the subject column, activity column, and every column that has the string "mean()" or "std()" in it. The dimensions of the dataset at this point were **68cols x 679734rows**.

Then I melted the dataset and cast it into a dataframe, taking the mean (average) of every variable for every subject and activity pair (e.g., all the measurements that were taken for subject 1 while his/her activity was "LAYING"). The dimensions of this final tidy dataset were **68cols x 180rows**. Which makes sense, since we had 6 activities and 30 subjects, and 6*30=180 rows in total. 

(For a thorough discussion of the different steps taken, please see the README.md file)

### Code book: Variable Names & Units

- **Subject:** An ID number from 1:30 corresponding to each one of the 30 subjects that participated in the study. 
- **Activity:** A description of the activity that the subject performed when the measurement was taken. 
- **Avg_tBodyAcc_mean_X :** Average of all the measurements for tBodyAcc_mean_X for a specific subject and activity pair.
- **Avg_tBodyAcc_mean_Y :** Average of all the measurements for tBodyAcc_mean_Y for a specific subject and activity pair.
- **Avg_tBodyAcc_mean_Z :** Average of all the measurements for tBodyAcc_mean_Z for a specific subject and activity pair.
- **Avg_tBodyAcc_std_X :** Average of all the measurements for tBodyAcc_std_X for a specific subject and activity pair.
- **Avg_tBodyAcc_std_Y :** Average of all the measurements for tBodyAcc_std_Y for a specific subject and activity pair.
- **Avg_tBodyAcc_std_Z :** Average of all the measurements for tBodyAcc_std_Z for a specific subject and activity pair.
- **Avg_tGravityAcc_mean_X :** Average of all the measurements for tGravityAcc_mean_X for a specific subject and activity pair.
- **Avg_tGravityAcc_mean_Y :** Average of all the measurements for tGravityAcc_mean_Y for a specific subject and activity pair.
- **Avg_tGravityAcc_mean_Z :** Average of all the measurements for tGravityAcc_mean_Z for a specific subject and activity pair.
- **Avg_tGravityAcc_std_X :** Average of all the measurements for tGravityAcc_std_X for a specific subject and activity pair.
- **Avg_tGravityAcc_std_Y :** Average of all the measurements for tGravityAcc_std_Y for a specific subject and activity pair.
- **Avg_tGravityAcc_std_Z :** Average of all the measurements for tGravityAcc_std_Z for a specific subject and activity pair.
- **Avg_tBodyAccJerk_mean_X :** Average of all the measurements for tBodyAccJerk_mean_X for a specific subject and activity pair.
- **Avg_tBodyAccJerk_mean_Y :** Average of all the measurements for tBodyAccJerk_mean_Y for a specific subject and activity pair.
- **Avg_tBodyAccJerk_mean_Z :** Average of all the measurements for tBodyAccJerk_mean_Z for a specific subject and activity pair.
- **Avg_tBodyAccJerk_std_X :** Average of all the measurements for tBodyAccJerk_std_X for a specific subject and activity pair.
- **Avg_tBodyAccJerk_std_Y :** Average of all the measurements for tBodyAccJerk_std_Y for a specific subject and activity pair.
- **Avg_tBodyAccJerk_std_Z :** Average of all the measurements for tBodyAccJerk_std_Z for a specific subject and activity pair.
- **Avg_tBodyGyro_mean_X :** Average of all the measurements for tBodyGyro_mean_X for a specific subject and activity pair.
- **Avg_tBodyGyro_mean_Y :** Average of all the measurements for tBodyGyro_mean_Y for a specific subject and activity pair.
- **Avg_tBodyGyro_mean_Z :** Average of all the measurements for tBodyGyro_mean_Z for a specific subject and activity pair.
- **Avg_tBodyGyro_std_X :** Average of all the measurements for tBodyGyro_std_X for a specific subject and activity pair.
- **Avg_tBodyGyro_std_Y :** Average of all the measurements for tBodyGyro_std_Y for a specific subject and activity pair.
- **Avg_tBodyGyro_std_Z :** Average of all the measurements for tBodyGyro_std_Z for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_mean_X :** Average of all the measurements for tBodyGyroJerk_mean_X for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_mean_Y :** Average of all the measurements for tBodyGyroJerk_mean_Y for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_mean_Z :** Average of all the measurements for tBodyGyroJerk_mean_Z for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_std_X :** Average of all the measurements for tBodyGyroJerk_std_X for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_std_Y :** Average of all the measurements for tBodyGyroJerk_std_Y for a specific subject and activity pair.
- **Avg_tBodyGyroJerk_std_Z :** Average of all the measurements for tBodyGyroJerk_std_Z for a specific subject and activity pair.
- **Avg_tBodyAccMag_mean :** Average of all the measurements for tBodyAccMag_mean for a specific subject and activity pair.
- **Avg_tBodyAccMag_std :** Average of all the measurements for tBodyAccMag_std for a specific subject and activity pair.
- **Avg_tGravityAccMag_mean :** Average of all the measurements for tGravityAccMag_mean for a specific subject and activity pair.
- **Avg_tGravityAccMag_std :** Average of all the measurements for tGravityAccMag_std for a specific subject and activity pair.
- **Avg_tBodyAccJerkMag_mean :** Average of all the measurements for tBodyAccJerkMag_mean for a specific subject and activity pair.
- **Avg_tBodyAccJerkMag_std :** Average of all the measurements for tBodyAccJerkMag_std for a specific subject and activity pair.
- **Avg_tBodyGyroMag_mean :** Average of all the measurements for tBodyGyroMag_mean for a specific subject and activity pair.
- **Avg_tBodyGyroMag_std :** Average of all the measurements for tBodyGyroMag_std for a specific subject and activity pair.
- **Avg_tBodyGyroJerkMag_mean :** Average of all the measurements for tBodyGyroJerkMag_mean for a specific subject and activity pair.
- **Avg_tBodyGyroJerkMag_std :** Average of all the measurements for tBodyGyroJerkMag_std for a specific subject and activity pair.
- **Avg_fBodyAcc_mean_X :** Average of all the measurements for fBodyAcc_mean_X for a specific subject and activity pair.
- **Avg_fBodyAcc_mean_Y :** Average of all the measurements for fBodyAcc_mean_Y for a specific subject and activity pair.
- **Avg_fBodyAcc_mean_Z :** Average of all the measurements for fBodyAcc_mean_Z for a specific subject and activity pair.
- **Avg_fBodyAcc_std_X :** Average of all the measurements for fBodyAcc_std_X for a specific subject and activity pair.
- **Avg_fBodyAcc_std_Y :** Average of all the measurements for fBodyAcc_std_Y for a specific subject and activity pair.
- **Avg_fBodyAcc_std_Z :** Average of all the measurements for fBodyAcc_std_Z for a specific subject and activity pair.
- **Avg_fBodyAccJerk_mean_X :** Average of all the measurements for fBodyAccJerk_mean_X for a specific subject and activity pair.
- **Avg_fBodyAccJerk_mean_Y :** Average of all the measurements for fBodyAccJerk_mean_Y for a specific subject and activity pair.
- **Avg_fBodyAccJerk_mean_Z :** Average of all the measurements for fBodyAccJerk_mean_Z for a specific subject and activity pair.
- **Avg_fBodyAccJerk_std_X :** Average of all the measurements for fBodyAccJerk_std_X for a specific subject and activity pair.
- **Avg_fBodyAccJerk_std_Y :** Average of all the measurements for fBodyAccJerk_std_Y for a specific subject and activity pair.
- **Avg_fBodyAccJerk_std_Z :** Average of all the measurements for fBodyAccJerk_std_Z for a specific subject and activity pair.
- **Avg_fBodyGyro_mean_X :** Average of all the measurements for fBodyGyro_mean_X for a specific subject and activity pair.
- **Avg_fBodyGyro_mean_Y :** Average of all the measurements for fBodyGyro_mean_Y for a specific subject and activity pair.
- **Avg_fBodyGyro_mean_Z :** Average of all the measurements for fBodyGyro_mean_Z for a specific subject and activity pair.
- **Avg_fBodyGyro_std_X :** Average of all the measurements for fBodyGyro_std_X for a specific subject and activity pair.
- **Avg_fBodyGyro_std_Y :** Average of all the measurements for fBodyGyro_std_Y for a specific subject and activity pair.
- **Avg_fBodyGyro_std_Z :** Average of all the measurements for fBodyGyro_std_Z for a specific subject and activity pair."
- **Avg_fBodyAccMag_mean :** Average of all the measurements for fBodyAccMag_mean for a specific subject and activity pair.
- **Avg_fBodyAccMag_std :** Average of all the measurements for fBodyAccMag_std for a specific subject and activity pair.
- **Avg_fBodyBodyAccJerkMag_mean :** Average of all the measurements for fBodyBodyAccJerkMag_mean for a specific subject and activity pair.
- **Avg_fBodyBodyAccJerkMag_std :** Average of all the measurements for fBodyBodyAccJerkMag_std for a specific subject and activity pair.
- **Avg_fBodyBodyGyroMag_mean :** Average of all the measurements for fBodyBodyGyroMag_mean for a specific subject and activity pair.
- **Avg_fBodyBodyGyroMag_std :** Average of all the measurements for fBodyBodyGyroMag_std for a specific subject and activity pair.
- **Avg_fBodyBodyGyroJerkMag_mean :** Average of all the measurements for fBodyBodyGyroJerkMag_mean for a specific subject and activity pair.
- **Avg_fBodyBodyGyroJerkMag_std :** Average of all the measurements for fBodyBodyGyroJerkMag_std for a specific subject and activity pair.

### What Columns Were Selected? And Why?

There was some discussion in the forums surrounding the choice of columns that satisfy requirement #2. What columns exactly correspond to the mean and standard deviation of each *measurement*? I personally selected the columns that correspond to the mean and standard deviation of the measurements, excluding in the process the columns that contain information about the mean frequency, gravityMean, etc. My grepl function looked for the following pattern in the column names: **"Subject|Activity|mean()|std()"**.

While it's debatable if this is what requirement 2 was asking, I think this the best interpretation of the wording of the requirement, since the other means that were excluded aren't strictly means of the measured data. Selecting all the means can be easily achived in my code just by using the following regular expression instead of the one mentioned above: **"Subject|Activity|mean|std"**.

### Is the Output Dataset (tidy_data.txt) Tidy? And Why? 

I think that the dataset that my pre-processing script outputs (tidy_data.txt) is indeed a tidy dataset because it satisfies the conditions for being a tidy dataset. Each column in my output dataset corresponds to a separate variable (Subject, Activity, Avg_tBodyAcc_mean_X, etc.) and each row corresponds to a separate observation. My dataset also has a row of the column names on top, and the column names are sufficiently descriptive.

**Why a wide tidy dataset?** 

This is also another topic that was hotly debated in the discussion forums on Coursera. Some people prefer wide tidy datasets while others prefer narrow tidy datasets. I personally prefer wide tidy dataset, mainly because of my experience with databases. But I think that both wide and narrow tidy datasets are equally workable, as long as you have descriptive column names and each column corresponds to a separate variable and each row corresponds to a separate observation. 
