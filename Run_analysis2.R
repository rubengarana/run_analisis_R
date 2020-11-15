library(plyr)
library(dplyr)

act <- read.table("./activity_labels.txt")
fea <- read.table("./features.txt")
t <- list.files("./train/",pattern = ".txt")
te <- list.files("./test/",pattern = ".txt")

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

total <- rbind(t1,t2)
names(total)[1] <- "subject" ; names(total)[ncol(total)] <- "activity"
names(total)[2:562] <- as.character(fea$V2)
total$activity <- factor(total$activity,labels = as.character(act$V2))
media_std <- select(total,contains("mean")|contains("std")|contains("activity")|contains("subject"))%>%
        group_by(activity,subject)%>%summarize_all(mean)  

media_std


