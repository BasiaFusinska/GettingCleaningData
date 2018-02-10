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
