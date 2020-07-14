---
title: " CodeBook for r_analysis.R"
author: "leron patel"
date: "7/14/2020"
output: html_document
---


# EXISTING FILENAMES
  -  train_data : training data
  -  test_data : test data
  -  train_label : train label data
  -  test_label : test label data
  -  features_file : file containing features name
  -  activilty_label_file : file containing activity text labels
  -  train_subject: file for subject numbers for training observations
  -  test_subject : file for subject numbers for test observations


# CREATED DATA
  - merged_data : joining X_test.txt and X_train.txt
  - merged_label : joining y_test.txt and y_train.txt
  - merged_subject : joining subject_test.txt and subject_train.txt
  - col : getting data for mean and std values
  - col_names : same as col but with values to be used as variable names for merged_data
  - matched_label : assigning activitiy values to corresponding variables
  - final_data : joining subjects,activities,and corresponing data for final analysis
  - avg_finaldata : final_data %>% group_by(Subjects,Activities)%>%summarise_all(mean)
  
# VARIABLE NAMES
  - subjects : contains subjects
  - Activites : data for corresponing activities
  - These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz
  - the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
  - magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
  - Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
