---
title: "CodeBook.md"
output: html_document
date: "2025-08-03"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# CodeBook

## Overview

This code book describes the variables, data sources, and transformations used to create the tidy data set for the Human Activity Recognition Using Smartphones project.

## Source Data

The original data was collected from the accelerometers and gyroscopes of the Samsung Galaxy S smartphone. The dataset is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data was downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Raw Data Files Used

- `features.txt`: List of all feature names.
- `activity_labels.txt`: Mapping of activity codes to descriptive names.
- `train/X_train.txt`, `test/X_test.txt`: Sensor measurements.
- `train/y_train.txt`, `test/y_test.txt`: Activity codes.
- `train/subject_train.txt`, `test/subject_test.txt`: Subject identifiers.

## Transformations

1. **Merged** the training and test datasets into one complete dataset.
2. **Extracted** only the measurements on the mean and standard deviation for each measurement using regular expressions.
3. **Replaced** activity codes with descriptive activity names.
4. **Renamed** variable names to be more descriptive:
   - Prefix `t` → `Time`
   - Prefix `f` → `Frequency`
   - `Acc` → `Accelerometer`
   - `Gyro` → `Gyroscope`
   - `Mag` → `Magnitude`
   - `BodyBody` → `Body`
5. **Created** a second tidy dataset with the average of each variable for each activity and each subject.

## Final Tidy Dataset

The final tidy dataset (`tidy_dataset.txt`) contains:

- One row per subject and activity combination.
- One column for each mean and standard deviation measurement.
- 180 rows (30 subjects × 6 activities).
