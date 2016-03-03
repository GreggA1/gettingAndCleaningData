
---
title: "CookBook"
output: html_document
---

This codebook was generated to describe the variables, the data, and any transformations or work performed to clean up the data.

Variable              | Description
-------------         | -------------
Activty               | Identifier for the activity in the dataset
Subject               | Identifier for the subject engaging in the activity. Range between 1 and 30
Acceleration          | Acceleration signal (Body or Gravity)
AngularSpeed          | Angular Speed (Body or Gravity)
AngularAcceleration   | Angular Acceleration (Body or Gravity)
Magnitude             | Magnitude of the signals calculated using the Euclidean norm
StandardDeviation     | Standard deviation of each variable
Mean                  | Average of each variable 
TimeDomain            | Time domain signal or frequency domain signal (Time or Freq)  

3 sets of files were imported, which we're merged and labelled appropriately:

activites (y_test and y_train)
subjects (subject_test and subject_train)
labels (x_test and x_train)



Activity Labels
---------------

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Structure of the Dataset can be obtained by: str (tidyData)

First few rows of the dataset; head(tidyData)

Statstical breakdown of the dataset: summary(tidyData)
