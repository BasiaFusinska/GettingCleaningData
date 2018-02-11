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
