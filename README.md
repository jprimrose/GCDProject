GCDProject
==========
My process was as follows:

1) download data zip: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2) read in features.txt & remove punctuation
3) read in activity_labels.txt and clean up column names
4) read in X_test.txt data and add cleaned up column names from step 2
5) subset X_test.txt and retrieve only columns containing "mean" or "std"
6) read in y_test.txt data and assign column names
7) merge the activity data and the y_test data
8) read in subject_test.txt and assign column names
9) column bind the subject data to the merged activity data
10) column bind the subject / activity data to the subsetted test set from step 5
11) read in the X_train.txt data and add cleaned up column names from step 2
12) subset X_train.txt and retrieve only columns containing "mean" or "std"
13) read in the y_train.txt data and assign column names
14) merge the activity data and the y_train data
15) read in subject_train.txt and assign column values
16) column bind the subject data to the merged activity data
17) column bind the subject / activity data to the subsetted test set from step 12
18) row bind the train data to the test data
19) aggregate the data by activity and subject providing a mean value per variable
20) write out the data to tidy.txt
