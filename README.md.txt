# Getting and Cleaning Data Project

## Overview

This repository contains the R script and documentation for the Getting and Cleaning Data course project. The goal is to prepare a tidy dataset from raw sensor data collected from smartphones.

## Files

- `run_analysis.R`: R script that performs the data cleaning and transformation.
- `tidy_dataset.txt`: Final tidy dataset with the average of each variable for each activity and each subject.
- `CodeBook.md`: Describes the variables, data sources, and transformations.
- `README.md`: Explains the purpose of the project and how to run the script.

## How to Run

1. Clone this repository.
2. Make sure you have the `dplyr` package installed.
3. Run `run_analysis.R` in R. It will:
   - Download and unzip the dataset.
   - Merge training and test data.
   - Extract mean and standard deviation measurements.
   - Label activities and variables descriptively.
   - Create a tidy dataset with averages.

## Data Source

The original data was collected from the Samsung Galaxy S smartphone accelerometers and gyroscopes. Full details:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Project Requirements

This project fulfills the following:

- Merges training and test sets.
- Extracts mean and standard deviation measurements.
- Uses descriptive activity names.
- Labels variables with descriptive names.
- Creates a tidy dataset with averages for each activity and subject.

