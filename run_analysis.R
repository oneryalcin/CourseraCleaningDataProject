library(dplyr)
rm(list=ls())

# Import both data sets training data and test data

train_data <- read.table(file = "./train/X_train.txt")
y_train_data <- read.table(file = "./train/y_train.txt")
sj_train_data <- read.table("./train/subject_train.txt")

test_data <- read.table(file = "./test/X_test.txt")
y_test_data <- read.table(file = "./test/y_test.txt")
sj_test_data <- read.table("./test/subject_test.txt")    

# add the subject and activity columns to data set
train_data <- mutate(train_data, label = as.vector(y_train_data$V1), Subject = as.vector(sj_train_data$V1))

test_data <- mutate(test_data, label = as.vector(y_test_data$V1), Subject = as.vector(sj_test_data$V1))

# merge these two datasets
data <- rbind_list(train_data,test_data)

# get the column names from features.txt file
col_names<-read.table(file = "./features.txt")
col_names<-as.vector(col_names$V2)


# add correct column names to the data frame
names(data) <- col_names
names(data) <- make.names(names(data), unique = T)
names(data)[562] <- "ActLabel"
names(data)[563] <- "Subject"


# select the columns those include measurements of mean and std deviation
sdata <- select(data,contains("Subject"),contains("ActLabel"),contains("mean"),contains("std"))


# Change the activity numbers with meaningful strings
sdata$ActLabel[sdata$ActLabel==1] <- "WALKING"
sdata$ActLabel[sdata$ActLabel==2] <- "WALKING_UPSTAIRS"
sdata$ActLabel[sdata$ActLabel==3] <- "WALKING_DOWNSTAIRS"
sdata$ActLabel[sdata$ActLabel==4] <- "SITTING"
sdata$ActLabel[sdata$ActLabel==5] <- "STANDING"
sdata$ActLabel[sdata$ActLabel==6] <- "LAYING"

#Group the data by subject and Activity type and take the mean of individual obersvations

by_sj <- group_by(sdata,Subject,ActLabel)
final_data <- summarise_each(by_sj,funs(mean))

# Export the final tidy data back to disk
write.table(final_data,row.names = FALSE,file = "./tidy_data_final.txt")

