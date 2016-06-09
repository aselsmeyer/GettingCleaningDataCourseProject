library(reshape2)
library(data.table)

setInternet2(TRUE)

# Download the data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

f <- file.path(getwd(), "Dataset.zip")

download.file(url, f)

# Unzip the file

temp <- unzip(f)

files <- list.files(getwd())

file <- paste(f)

# Read the dataset

list.files("./UCI HAR Dataset")

# features <- str(read.table("./UCI HAR Dataset/features.txt"))

# activities <- str(read.table("./UCI HAR Dataset/activity_labels.txt"))


# head(dt, 3)
# Show all tables in memory and a summary of each
# tables()
# Subset data table 
# dt[3,]