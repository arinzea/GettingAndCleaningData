---
title: "CodeBook.md"
author: "Arinze Akutekwe"
date: "21 November 2015"
output: html_document
---

## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

There are 81 variables (features) in this dataset

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Each value of the features (from 3 to 81) is the average of each variable for each activity and each subject i.e. the average mean and average standard deviation of the 30 subjects who performed the 6 activities (a total of 180 observations). The features in this dataset are shown below.

1                                  Subject
2                                 Activity
3                        tBodyAcc-mean()-X
4                        tBodyAcc-mean()-Y
5                        tBodyAcc-mean()-Z
6                     tGravityAcc-mean()-X
7                     tGravityAcc-mean()-Y
8                     tGravityAcc-mean()-Z
9                    tBodyAccJerk-mean()-X
10                   tBodyAccJerk-mean()-Y
11                   tBodyAccJerk-mean()-Z
12                      tBodyGyro-mean()-X
13                      tBodyGyro-mean()-Y
14                      tBodyGyro-mean()-Z
15                  tBodyGyroJerk-mean()-X
16                  tBodyGyroJerk-mean()-Y
17                  tBodyGyroJerk-mean()-Z
18                      tBodyAccMag-mean()
19                   tGravityAccMag-mean()
20                  tBodyAccJerkMag-mean()
21                     tBodyGyroMag-mean()
22                 tBodyGyroJerkMag-mean()
23                       fBodyAcc-mean()-X
24                       fBodyAcc-mean()-Y
25                       fBodyAcc-mean()-Z
26                   fBodyAcc-meanFreq()-X
27                   fBodyAcc-meanFreq()-Y
28                   fBodyAcc-meanFreq()-Z
29                   fBodyAccJerk-mean()-X
30                   fBodyAccJerk-mean()-Y
31                   fBodyAccJerk-mean()-Z
32               fBodyAccJerk-meanFreq()-X
33               fBodyAccJerk-meanFreq()-Y
34               fBodyAccJerk-meanFreq()-Z
35                      fBodyGyro-mean()-X
36                      fBodyGyro-mean()-Y
37                      fBodyGyro-mean()-Z
38                  fBodyGyro-meanFreq()-X
39                  fBodyGyro-meanFreq()-Y
40                  fBodyGyro-meanFreq()-Z
41                      fBodyAccMag-mean()
42                  fBodyAccMag-meanFreq()
43              fBodyBodyAccJerkMag-mean()
44          fBodyBodyAccJerkMag-meanFreq()
45                 fBodyBodyGyroMag-mean()
46             fBodyBodyGyroMag-meanFreq()
47             fBodyBodyGyroJerkMag-mean()
48         fBodyBodyGyroJerkMag-meanFreq()
49                        tBodyAcc-std()-X
50                        tBodyAcc-std()-Y
51                        tBodyAcc-std()-Z
52                     tGravityAcc-std()-X
53                     tGravityAcc-std()-Y
54                     tGravityAcc-std()-Z
55                    tBodyAccJerk-std()-X
56                    tBodyAccJerk-std()-Y
57                    tBodyAccJerk-std()-Z
58                       tBodyGyro-std()-X
59                       tBodyGyro-std()-Y
60                       tBodyGyro-std()-Z
61                   tBodyGyroJerk-std()-X
62                   tBodyGyroJerk-std()-Y
63                   tBodyGyroJerk-std()-Z
64                       tBodyAccMag-std()
65                    tGravityAccMag-std()
66                   tBodyAccJerkMag-std()
67                      tBodyGyroMag-std()
68                  tBodyGyroJerkMag-std()
69                        fBodyAcc-std()-X
70                        fBodyAcc-std()-Y
71                        fBodyAcc-std()-Z
72                    fBodyAccJerk-std()-X
73                    fBodyAccJerk-std()-Y
74                    fBodyAccJerk-std()-Z
75                       fBodyGyro-std()-X
76                       fBodyGyro-std()-Y
77                       fBodyGyro-std()-Z
78                       fBodyAccMag-std()
79               fBodyBodyAccJerkMag-std()
80                  fBodyBodyGyroMag-std()
81              fBodyBodyGyroJerkMag-std()

The activities are
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


### Work done

1.	Data was loaded into R using fast read from the data.table package. They include the training data (x_train), the class label (y_train) and the subjects’ data (subject_train). The process was repeated for the testing dataset (x_test), the class label (y_test) and the subjects’ data (subject_test). They were combined into a single dataset with 10299 observations and 563 variables including the Subject and Activity columns.
2.	Variable names were loaded from the features.txt file provided. This was used to assign variable names to the 561 variables.
3.	The columns containing the means and standard deviations were extracted using the indices from a *grep* function search, as requested by the instructions. There were 79 of such columns and 10299 observations. This was combined with the subject and activity datasets for a total of 81 columns. 
4.	A double *for* loop was used to construct a matrix containing the average of the variables extracted in 3 above. This implies the average of each subject (30 of them) for each (of the 6) activity group. Hence there were a total of 180 observations and 81 columns.
5.	The resulting matrix was converted to a dataframe and outputted using the write.table function with row.names argument set to false.

**Note**:

It is important to note that the names of the features were left as they were (not renamed) and the explanation of the all the features have been provided. They were already properly named in an easy to understand intuitive manner and there were no duplicates.
