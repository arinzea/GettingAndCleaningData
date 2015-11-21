#Getting and Cleaning Data Course Project
# Set appropriate working directory
setwd("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData")

#Check if a data directory exists, if not create one
if(!file.exists("data")){
  dir.create("data")
}
#Download the dataset
downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadUrl,"./data/projectDataset.zip")

# Instructions
# You should create one R script called run_analysis.R that does the following. 
# 1: Merges the training and the test sets to create one data set.
# 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3: Uses descriptive activity names to name the activities in the data set
# 4: Appropriately labels the data set with descriptive variable names. 
# 
# 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

#Extract the dataset
unzip("./data/projectDataset.zip")

#read in the dataset using fast read
library(data.table)
x_train <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/train/X_train.txt")
y_train <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/train/y_train.txt")
subject_train <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/train/subject_train.txt")

#look at the data
str(x_train)
table(sapply(x_train, class))
table(sapply(y_train, class))
table(sapply(subject_train, class))

uci_train <- cbind(x_train,y_train,subject_train)
x_test <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/test/X_test.txt")
y_test <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/test/y_test.txt")
subject_test <- fread("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/test/subject_test.txt")

uci_test <- cbind(x_test,y_test,subject_test)

#combine all datasets
uci_all <- rbind(uci_train,uci_test)

feature_names <- read.table("/Users/Oracle/OneDrive/Data-science/3-GettingCleaningData/UCI HAR Dataset/features.txt")
#Extract the names of the variables
feature_names$V1 <- NULL
feature_names_char <- as.character(as.factor(feature_names$V2))

#convert back to normal dataframe so that the columns can be assigned names
uci_all <- as.data.frame(uci_all)


uci_all_561 <- uci_all[,1:561]
colnames(uci_all_561) <- feature_names_char

library(dplyr)
# This answers question number 2
#Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_indices <- grep("mean",feature_names_char)
mean_measurements <- uci_all_561[,mean_indices]

std_indices <- grep("std",feature_names_char)
std_measurements <- uci_all_561[,std_indices]

mean_std <- cbind(mean_measurements,std_measurements)


#This answers question number 3 and 4
#extract the y-label (activity) and subject tests
y_subject <- uci_all[,562:563]
head(y_subject)
library(dplyr)
#rename the two columns accordingly to Activity and Subject
y_subject <- rename(y_subject,Activity = V1, Subject = V1.1)
#bind it with the extracted mean and standard deviation dataset

mean_std_y_subject <- cbind(mean_std,y_subject)
dim(mean_std_y_subject)
#[1] 10299    81
#This mean_std_y_subject answers the questions below
# Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names

#The variable names (1:79) do not need any further renaming because their values and meanings are documented
#They are the measurements on the mean and standard deviation for each measurement


#This answers question number 5
library(dplyr)
#create the sublect-activity dataframes, find their averages and combine the dataframes into a single dataframe
#Their are 30 subjects and 6 activities so a total of 180 observations, and the 81 variables from number 4.

subject_activity_df <- tbl_df(mean_std_y_subject)

all.avg = numeric(0)
for (k in 1:30) {
  for(i in 1:6) { 
  avg <- colMeans(filter(subject_activity_df, Subject == k  & Activity == i))
  all.avg <- rbind(all.avg,avg)
  }
}
dim(all.avg) 
#[1] 180  81
#rearrange the columns so the subjects and activities are the first and second columns respectively
all.avg <- as.data.frame(all.avg)

library(dplyr)
avgSubjectActivity <- all.avg %>%
  select(Subject, Activity, everything())
head(avgSubjectActivity)

#columns 3:81 are the average of each variablefor each activity and each subject (from 4).

write.table(avgSubjectActivity,file = "avgSubjectActivity.txt",row.names = FALSE)

#dat <- data.frame(as.character(names(avgSubjectActivity)))
