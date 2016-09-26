## Getting and Cleaning Data, Week 4 Assignment
## Create function 'run_analysis.R'
## User should cd to the directory in which the dataframes have been created
run_analysis <- function(){
        library(dplyr)
                ## read files into dataframes. This produces the following dfs
                ## X_train 
                ## X_test 
                ## y_test 
                ## subject_test 
                ## y_train 
                ## subject_train
                ## activity_labels
                ## features
                ## applying the field names from the features.txt file - need to change the column to a row and apply to X_test
                ## transpose r/c in features
        features <- t(features)
                ## create column names (dfnames)
        dfnames <- c(features[2,])
                ## need to change them from factors to chars - should have done this on reading ......
        dfnames <- data.frame(lapply(dfnames, as.character), stringsAsFactors=FALSE)
        names(X_test) <- c(dfnames)
        names(X_train) <- c(dfnames)
                ## add the activity data log to the dataframes as new field 
        X_test$activity <- y_test$V1
        X_train$activity <- y_train$V1
                ## add subject's id to the data frames as new fields (need to do to both dfs)
        X_train$id <- subject_train$V1
        X_test$id <- subject_test$V1
                ## bind test and train dfs together using rbind
        df1 <- rbind(X_train,X_test)
                ## after next line (coi<-) R complains that there are duplcate column names - none contain 'mean' of 'std', so delete them
        df2 <- df1[, !duplicated(colnames(df1))]
                ## columns of interest (coi) = those with key words and the activity and id fields
        coi <- select(df2, contains("mean"), contains("Mean"), contains("std"), activity, id)
                ## group by activity
        group1 <- group_by(coi, activity)
                ## calculate means for all groups in group1 for all values of activity
        actMeans <- summarise_each(group1,funs(mean))
                ## relabel the activities for clarity
        coi$activity[coi$activity=="1"] <- "walking"
        coi$activity[coi$activity=="2"] <- "walking_upstairs"
        coi$activity[coi$activity=="3"] <- "walking_downstairs"
        coi$activity[coi$activity=="4"] <- "sitting"
        coi$activity[coi$activity=="5"] <- "standing"
        coi$activity[coi$activity=="6"] <- "laying"
                ## group coi by id
        group2 <- group_by(coi, id)
                ## calculate means for all the groups in group2 for all variables
        idMeans <- summarise_each(group2, funs(mean))
                ## move activity to first column
        idMeans <- select(idMeans, activity, everything())
                ## bind the two parts of the final dataframe together
        final <- rbind(idMeans,actMeans)
                ## eliminate values of mean id as meaningless
        final$id[31:36] <- "N/A"
                ## write to file
        write.csv(final, file= "tidyData.csv")
}








