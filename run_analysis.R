library(plyr)

# 1. merge the training and test sets

filename <- "./test/X_test.txt"
test_data <- read.table(filename, header = F)

filename <- "./test/y_test.txt"
test_activity <- read.table(filename, header = F)

filename <- "./test/subject_test.txt"
test_subject <- read.table(filename, header = F)

filename <- "./train/X_train.txt"
train_data <- read.table(filename, header = F)

filename <- "./train/y_train.txt"
train_activity <- read.table(filename, header = F)

filename <- "./train/subject_train.txt"
train_subject <- read.table(filename, header = F)

merged_data <- rbind(test_data, train_data)
merged_activity <- rbind(test_activity, train_activity)
colnames(merged_activity) <- c("ActivityId")
merged_subject <- rbind(test_subject, train_subject)
colnames(merged_subject) <- c("SubjectId")


# 2. Extract the mean and standard deviation for each measurement

filename <- "features.txt"

column_names <- read.table(filename, header = F)
colnames(column_names) <- c("position","name")
required_columns <- column_names[grep("std\\(\\)|mean\\(\\)", column_names$name),]

filtered_data <- merged_data[,required_columns$position]

colnames(filtered_data) <- required_columns$name


# 3. Use descriptive activity names to name the activities in the data set 

filename <- "activity_labels.txt"

activity_labels <- read.table(filename, header = F)
colnames(activity_labels) <- c("ActivityId", "Activity")

tmp_data <- cbind(merged_activity,filtered_data)

activity_data <- merge(tmp_data,activity_labels, by="ActivityId")
activity_data$ActivityId <- NULL # drop column


# 5. create a data set with the average of each variable for each activity and
#    each subject

tmp_data <- cbind( activity_data, merged_subject )
last_column <- ncol(tmp_data) -2
result <-  ddply(tmp_data, .(Activity, SubjectId),function(df) colMeans(df[,1:last_column])) 

write.table(result,"results.txt", row.name=FALSE)
