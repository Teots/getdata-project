# 1. Merges the training and the test sets to create one data set.
subjectTrain <- read.table("train/subject_train.txt")
subjectTest <- read.table("test/subject_test.txt")
subjectCombined <- rbind(subjectTrain, subjectTest)

xTrain <- read.table("train/X_train.txt")
xTest <- read.table("test/X_test.txt")
xCombined <- rbind(xTrain, xTest)

yTrain <- read.table("train/y_train.txt")
yTest <- read.table("test/y_test.txt")
yCombined <- rbind(yTrain, yTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
goodFeatureIndex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

xCombined <- xCombined[, goodFeatureIndex]
names(xCombined) <- features[goodFeatureIndex, 2]

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
yCombined[, 1] = activities[yCombined[, 1], 2]
names(yCombined) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
names(subjectCombined) <- "subject"

combinedData <- cbind(subjectCombined, yCombined, xCombined)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
splitByActivity <- split(combinedData, combinedData$activity)
cleanedData <- lapply(splitByActivity, function(x) {tmp <- split(x, x$subject); lapply(tmp, function(y) { colMeans(y[, seq(3, 68)], na.rm=TRUE) } ) } )

write.table(cleanedData, "cleanedData.txt")