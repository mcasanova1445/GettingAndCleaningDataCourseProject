# The original dataset

A full description of the original UCI's dataset is available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And the dataset itself can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


# The script

In order to run this script you need to unzip UCI's dataset and copy `run_analysis.R` into the "UCI HAR Dataset" directory.

Once this directory is set as the working directory, run the script. This will perform the following operations on the dataset:

- Merge the training and testing data, binding them by rows and placing the testing dataset below the training one.

- Extract only the measurements on the mean and standard deviation for each measurement.

- Add a column to the main dataframe describing what activity was performed in each row.

- Appropriately labeling the columns of the main dataframe with descriptive variable names.

- Add a column identifying the subject that was measured in each row and creating a new dataframe with the average of each variable for each activity and subject.

Finally, the script writes this final dataframe as a new "tidydata.txt" dataset file.
