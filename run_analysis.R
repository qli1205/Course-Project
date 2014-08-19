# Please set the working drictory to the one where 
# "getdata-projectfiles-UCI HAR Dataset.zip" is located.

# PLEASE DO NOT UNZIP THE FILE MANUALLY BEFORE RUNNING THIS SCRIPT

# unzip the downloaded .zip file
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# read the data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", colClasses = "character")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "character")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", colClasses = "character")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "character")

# read feature names
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")

# 1. Merges the training and the test sets to create one data set.
x_all <- rbind (x_train, x_test)
y_all <- rbind (y_train, y_test)
sub_all <- rbind (sub_train, sub_test)

data_all <- cbind(y_all, sub_all, x_all)
names(data_all) <- c("Activity Label", "Subject", features[,2])

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_index <- grep("mean\\(\\)|std\\(\\)", names(data_all))
data_sub <- data_all[, c(1, 2, mean_std_index)]

# 3. Uses descriptive activity names to name the activities in the data set
data_sub$"Activity" <- factor(data_sub$"Activity Label")
levels(data_sub$"Activity") <- list("Walking" =  "1", "Walking Upstair" = "2", 
                                    "Walking Downstair" = "3", "Sitting" = "4",
                                    "Standing" = "5", "Laying" = "6")

# 4. Appropriately labels the data set with descriptive variable names. 
v_names <- gsub("\\(\\)", "", names(data_sub))
names(data_sub) <- v_names

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
f_activity <- factor(data_sub$"Activity")
f_activity_l <- factor(data_sub$"Activity Label")
f_subjects <- factor(data_sub$"Subject")

numeric_index <- grep("mean|std", names(data_sub))
ave_data_sub <- aggregate(data_sub[, numeric_index], by = list(f_activity, f_activity_l, 
                                                               f_subjects), FUN = "mean")
names(ave_data_sub)[1:3]<- c("Activity", "Activity Label", "Subject")

write.table(ave_data_sub, "ave_data_sub.txt", row.names = FALSE)


