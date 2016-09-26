README

This is a solution to the Coursera 'Getting and Cleaning Data' course Week 4 assignment.
This script  will perform the required analyses on the provided data once it has been unzipped and read into R

That part of the process can be accomplished by :

 ## prepare directory and download data
	zipdir <- tempfile()

	dir.create(zipdir)

	fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileurl,destfil="zip",method="curl")

	unzip(zip,exdir="zipdir")

## read files into dataframes - use similar df names to original files - user should specify path to /UCI HAR........
	X_train <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset/train/X_train.txt", 	quote="\"")

	X_test <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset/test/X_test.txt", 	quote="\"")

	y_test <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset/test/y_test.txt", 	quote="\"")

	subject_test <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR 	Dataset/test/subject_test.txt", quote="\"")

	y_train <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset/train/y_train.txt", 	quote="\"")

	subject_train <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR 	Dataset/train/subject_train.txt", quote="\"")

	activity_labels <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR 	Dataset/activity_labels.txt", quote="\"")

	features <- read.table("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset/features.txt", 	quote="\"")

Function will execute (without parameters) and create a csv file 'tidyData.csv' in the working directory
