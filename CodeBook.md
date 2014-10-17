CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data using the script makeTidyData.R.

The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data

The dataset includes the following files:

'README.txt': Readme which shows how to work with the dataset.

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training dataset.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test dataset.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


Transformation details (used in the script run_analysis.R (see the comments in run_analysis.R))

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R implents the 5 steps in the following way:

1. run_analysis.R requires reshapre2 and data.table libraries.
2. Load both test and train data are loaded (lines 24 - 35)
3. Features and activity labels are loaded. (lines 15 - 19)
4. Extract the mean and standard deviation column names and data. (line 22)
5. Process the data. There are two parts processing test and train data respectively. (lines 39 - 60)
6. Merge data set. (lines 64 - 72)
7. Write tidy data to a file. (line 74)