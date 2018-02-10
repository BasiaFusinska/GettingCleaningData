# Read data from training and testing dataset
trainFile <- "data/train/X_train.txt"
testFile <- "data/test/X_test.txt"

trainData <- read.csv(trainFile, header=FALSE, sep="")
testData <- read.csv(testFile, header=FALSE, sep="")

# Merge both training and testing datasets
allData <- rbind(trainData, testData)

# Assign names to the data from the features file
featuresFile <- "data/features.txt"
features <- readLines(featuresFile)

names(allData) <- features

# Retrieving only mean and sd columns
msData <- allData[, grepl("mean\\(\\)|std\\(\\)", names(allData))]

# Read the activity labels
activityLabelsFile <- "data/activity_labels.txt"
activityLabels <- read.csv(activityLabelsFile, header = FALSE, sep = "")
names(activityLabels) <- c("Id", "Name")

# Read the data labels
trainLabelsFile <- "data/train/y_train.txt"
testLabelsFile <- "data/test/y_test.txt"

trainLabels <- read.csv(trainLabelsFile, header = FALSE)
testLabels <- read.csv(testLabelsFile, header = FALSE)

# Merge the train and test data labels
allLabels <- rbind(trainLabels, testLabels)
names(allLabels) <- "label"

# Retrieve activities descriptive names
allLabelsMerged <- merge(allLabels, activityLabels, by.x = "label", by.y = "Id")

# Add activities to the dataset
msData$activity <- allLabelsMerged$Name
