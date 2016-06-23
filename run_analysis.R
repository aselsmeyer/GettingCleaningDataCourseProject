library(reshape2)
library(data.table)
library(dplyr)

setInternet2(TRUE)

# Download the data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

f <- file.path(getwd(), "Dataset.zip")

download.file(url, f, method="curl")

# Unzip the file

temp <- unzip(f)

files <- list.files(getwd())

file <- paste(f)

# Read the dataset

list.files("./UCI HAR Dataset")

features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])

list.files("./UCI HAR Dataset/test")
list.files("./UCI HAR Dataset/train")

# Extract mean and standard deviation
getFeatures <- grep(".*mean.*|.*std.*", features[,2])
getFeatures.names <- features[getFeatures,2]
getFeatures.names = gsub('-mean', 'Mean', getFeatures.names)
getFeatures.names = gsub('-std', 'Std', getFeatures.names)
getFeatures.names <- gsub('[-()]', '', getFeatures.names)

# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# Merge datasets and add labels
fullData <- rbind(train, test)
colnames(fullData) <- c("subject", "activity", getFeatures.names)

# turn activities & subjects into factors
fullData$activity <- factor(fullData$activity, levels = activities[,1], labels = activities[,2])
fullData$subject <- as.factor(fullData$subject)

fullData.melted <- melt(fullData, id = c("subject", "activity"))
fullData.mean <- dcast(fullData.melted, subject + activity ~ variable, mean)

write.table(fullData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
