# install package data.table if not installed
if (!require("data.table")) {
  install.packages("data.table");
}

# install package reshape2 if not installed
if (!require("reshape2")) {
  install.packages("reshape2");
}

# load packages
require("data.table");
require("reshape2");

# Load: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2];

# load: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2];

# extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features);

# load and process X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt");
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt");
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt");
names(X_test) = features;


# load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt");
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt");
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt");
names(X_train) = features;



# extract only the measurements on the mean and standard deviation for each measurement.
# claim of task 2. Extracts only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extract_features];
# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features];


# load activity data for y_train
y_train[,2] = activity_labels[y_train[,1]];
names(y_train) = c("Activity_ID", "Activity_Label");
names(subject_train) = "Subject";

# load activity labels for y_test
y_test[,2] = activity_labels[y_test[,1]];
names(y_test) = c("Activity_ID", "Activity_Label");
names(subject_test) = "Subject";

# create complete train_data
trainData <- cbind(as.data.table(subject_train), y_train, X_train);

# create complete test data
testData <- cbind(as.data.table(subject_test), y_test, X_test);

# merge train and test data
# claim of task 1. Merges the training and the test sets to create one data set.
data = rbind(testData, trainData);

idLabels   = c("Subject", "Activity_ID", "Activity_Label");
dataLabels = setdiff(colnames(data), idLabels);
meltData      = melt(data, id = idLabels, measure.vars = dataLabels);

# apply mean function to dataset using dcast function
# claim of task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData   = dcast(meltData, Subject + Activity_Label ~ variable, mean);

write.table(tidyData, file = "./tidyData.txt");