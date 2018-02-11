
# Merge both training and testing datasets
allData <- rbind(trainData, testData)

# Assign names to the data from the features file
names(allData) <- features$V2

# Retrieving only mean and sd columns
msData <- allData[, grepl("mean\\(\\)|std\\(\\)", names(allData))]

# Merge the train and test data labels
allLabels <- rbind(trainLabels, testLabels)
names(allLabels) <- "label"

# Retrieve activities descriptive names
allLabelsMerged <- merge(allLabels, activityLabels, by.x = "label", by.y = "Id")

# Add activities to the dataset
msData$activity <- allLabelsMerged$Name

# Add subjects to the dataset
allSubjects <- rbind(trainSubjects, testSubjects)
names(allSubjects) <- "subject"

msData$subject <- allSubjects$subject

# Group data for each activity and subject
groupedData <- aggregate(. ~ activity + subject, msData, mean)
