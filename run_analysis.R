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

# list.files("./UCI HAR Dataset")

features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])

# list.files("./UCI HAR Dataset/test")
# list.files("./UCI HAR Dataset/train")

# Extract mean and standard deviation

