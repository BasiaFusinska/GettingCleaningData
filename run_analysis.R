## ---- Read the data ---

# Read data from training and testing dataset
trainFile <- "data/train/X_train.txt"
testFile <- "data/test/X_test.txt"

trainData <- read.csv(trainFile, header=FALSE, sep="")
testData <- read.csv(testFile, header=FALSE, sep="")

# Read features
featuresFile <- "data/features.txt"
features <- read.csv(featuresFile, header = FALSE, sep="")

# Read the activity labels
activityLabelsFile <- "data/activity_labels.txt"
activityLabels <- read.csv(activityLabelsFile, header = FALSE, sep = "")
names(activityLabels) <- c("Id", "Name")

# Read the data labels
trainLabelsFile <- "data/train/y_train.txt"
testLabelsFile <- "data/test/y_test.txt"

trainLabels <- read.csv(trainLabelsFile, header = FALSE)
testLabels <- read.csv(testLabelsFile, header = FALSE)

# Read subjects
subjectsTrainFile <- "data/train/subject_train.txt"
subjectsTestFile <- "data/test/subject_test.txt"

trainSubjects <- read.csv(subjectsTrainFile, header = FALSE)
testSubjects <- read.csv(subjectsTestFile, header = FALSE)


## ---- Run the analysis ---

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

## ---- Save the dataset to the file ---
groupedDataFile <- "data/cleanData.txt"
write.table(groupedData, groupedDataFile, row.names = FALSE)
