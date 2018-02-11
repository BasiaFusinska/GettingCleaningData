# GettingCleaningData

Final Project for the John Hopkins University Course

## Getting the data

The data were retrieved from the [UCI Human Activity Recognition Using Smartfones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the 26th of January 2018. The downloaded file was unpzipped and the content was put into the */data* folder.

## Cleaning the data

The code contains instructions to:
* read, 
* clean,
* save the data

### Reading the data

There are several data that was read from the files of the dataset:

* Training and test data

   Training and test data were read from the X_<>.txt files into the trainData and testData. Labels were read from the y_<>.txt files into trainLabels and testLabels.

* Features

   Data don't have headers, so the features names were loaded from the features.txt file into features variable.

* Activities

   Data are labeled using activities ids. The activities names are stored in the activity_labels.txt, so this is where they were read from into the activityLabels. First column was set up as "Id", second as "Name".

* Subjects

   Subjects for every data entry are stored in the subject_<>.txt files. They were read for both train and test datasets into trainSubjects and testSubjects.

### Data transformation
Data cleaning and transformation took few steps:

1. Merging train and test data.

   Both trainData and testData were erged into allData variable. As the data files don't contain headers, the features second column was used to set them up.

2. Retrieving only mean and standard deviation data

   To get only the mean and standard deviation data the following regular expression was used: *"mean\\(\\)|std\\(\\)"*. The data was loaded into msData variable.

3. Labeling data with descriptive actvity name

   Both training and test labeles were merged into one allLabels dataframe. The column was renamed as "label". The allLabels was merged with activityLabels by "label" and "Id". The result was stored into allLabelsMerged. Name column from allLabelsMerged was added as activity column to the msData.

4. Clean dataset

   The goal is to create a clean dataset containing average variable for each activity and each subject. To achieve this, first we added subject column to the msData. Then we aggregated the data based on activity and subject columns, using mean as the aggreagating function. The result is stored into the groupedData variable.

## Output file

The resulting data set was saved into cleanData.txt file using write.table function. The details about the content of the file can be found in the [Code book](CodeBook.md) file.