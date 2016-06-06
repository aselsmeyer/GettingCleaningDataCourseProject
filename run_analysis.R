library(quantmod)
library(data.table)

setInternet2(TRUE)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

f <- file.path(getwd(), "Dataset.zip")

download.file(url, f)

temp <- unzip(f)

files <- list.files(getwd())

file <- paste(f)

dt <- data.table(read.csv(file))
