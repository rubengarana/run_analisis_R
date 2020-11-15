library(plyr)
library(dplyr)
#Export the files in txt format of the trainings, tests, activity labels and the subject who performed the activity.
act <- read.table("./activity_labels.txt")
fea <- read.table("./features.txt")
t <- list.files("./train/",pattern = ".txt")
te <- list.files("./test/",pattern = ".txt")
#combines the activity files, variables and subjects in a single data frame for both training and testing.
t <- sapply(paste0("./train/",t), read.table)
te <- sapply(paste0("./test/",te), read.table)

for (x in seq(length(t))) {
        if (!x==1) {
              t1 <- cbind(t1,t[[x]])
        } else {
              t1 <- t[[x]]
        }        
}

for (y in seq(length(te))) {
        if (!y==1) {
                t2 <- cbind(t2,te[[y]])
        } else {
                t2 <- te[[y]]
        }        
}
#unifies training and tests in a single data frame.
total <- rbind(t1,t2)
#change the name of each column to a more descriptive one: subjects, activities and the characteristics according to the features.txt file
names(total)[1] <- "subject" ; names(total)[ncol(total)] <- "activity"
names(total)[2:562] <- as.character(fea$V2)
total$activity <- factor(total$activity,labels = as.character(act$V2))
#Only the columns containing the words mean and standard deviation are extracted, as well as activity and subject.
#the data frame is grouped by the activity and subject variables to generate a data frame grouped by these variables.
media_std <- select(total,contains("mean")|contains("std")|contains("activity")|contains("subject"))%>%
        group_by(activity,subject)%>%summarize_all(mean)  

media_std

