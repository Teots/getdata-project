Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

* Merges the training and test sets

The rows of both sets are appended into a new variable called {subject, x, y}Combined

* Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement

Only the relevant rows (stdv and mean) in xCombined are used -> the rest is thrown away

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set

Replaces activities in yCombined by human-readable names

* All data sets are combined into one set -> combinedData

* The combined data is split by activity and subject

Furthermore, the mean of each column of those splits is caculated

* The result is saved as cleandData.txt
