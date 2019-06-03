## Activity 1

# Reading data files
data.train <- read.table("train/X_train.txt")
data.test <- read.table("test/X_test.txt")

# Mergin training and testing datasets
data <- rbind(data.train, data.test)



## Activity 2

# Reading feature names
features <- read.table("features.txt")

# Extracting only the mean and std measurements
features.meanstd <- features[grep("(mean|std)\\(\\)", features[[2]]),]
data.meanstd <- data[,features.meanstd[[1]]]



## Activity 3

# Reading activities
activities.train <- read.table("train/y_train.txt")
activities.test <- read.table("test/y_test.txt")

# Mergin training and testing datasets
activities <- rbind(activities.train, activities.test)

# Reading activity labels and creating factor
activities.labels <- read.table("activity_labels.txt")
activities <- factor(activities[[1]], levels=1:6, labels=activities.labels[[2]])

# Adding `activity` column
data.meanstd$activity <- activities



## Activity 4

# Cleaning variable names (Removing special characters)
features.meanstd.labels <- as.character(features.meanstd[[2]])
features.meanstd.labels <- gsub("[(),-]", "", features.meanstd.labels)

# Changing variable names
names(data.meanstd) <- c(features.meanstd.labels, "activity")



# Activity 5

# Reading subjects
subjects.train <- read.table("train/subject_train.txt")
subjects.test <- read.table("test/subject_test.txt")

# Merging training and testing datasets
subjects <- rbind(subjects.train, subjects.test)

# Adding `subject` column
data.meanstd$subject <- subjects[[1]]

# Creating new average datasets
data.meanstd.ave <- aggregate(. ~ activity + subject, data.meanstd, FUN="mean")



# Writing new dataset files

write.table(data.meanstd.ave, file="tidydata.txt", row.name=FALSE)
