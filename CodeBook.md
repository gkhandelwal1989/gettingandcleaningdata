========================================================
Title 
========================================================

This is code book for r_analysis.R script which is part of Getting and Cleaning Data course project in Courseera offered by John Hopkins.

========================================================
Summary
========================================================
The purpose of this project and run_analysis.R is as follows:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each
  activity and each subject. 

This is part of course project of Getting and Cleaning Data on Courseera offered by John Hopkins.

All the data set on which cleaning is done has been taken from 
[data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
and original source is 
[original source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
which has full description of data.

We have used only a very small part of this data for our project. The files which has been used are
* X_train.txt
* y_train.txt
* subject_train.txt
* X_test.txt
* y_test.txt
* subject_test.txt
* features.txt
* activity_labels.txt


Description of variables and files
========================================================

### * X_train.txt
    This has training data set with 7352 rows and 561 coloumns. The coloumn names are present in features.txt file with corresponding coloumn number.
    
### * y_train.txt
    This has activity labels for training set whose value ranges from 1 to 6.Corresponding activity name to this integer is present in activity_labels.txt.This has 7352 rows and only one coloumn which is integer ranging from 1 to 6 and whose descriptive value is present in activity_labels.txt.
    
### * subject_train.txt
    This is the training set which identifies the subject who performed the activity for each coloumn in X_train.txt. Its range is from 1 to 30.It has 7352 rows and only one column whose value ranges from 1 to 30.
      
### * X_test.txt
    This has test data set with 2947 rows and 561 coloumns. The coloumn names are present in features.txt file with corresponding coloumn number.
    
### * y_test.txt
    This has activity labels for test data set whose value ranges from 1 to 6.Corresponding activity name to this integer is present in activity_labels.txt.This has 2947 rows and only one coloumn which is integer ranging from 1 to 6 and whose descriptive value is present in activity_labels.txt.
    
### * subject_test.txt
    This is the test set which identifies the subject who performed the activity for each coloumn in X_train.txt. Its range is from 1 to 30.It has 2947 rows and only one column whose value ranges from 1 to 30.
    
### * features.txt
    This file which gives us relationship between coloumn number of X_training and X_test with name of the variable.This is used to extract mean() and std() variables and their corresponding coloumn number.It has 561 rows and 2 coloumns.First coloumn gives us the coloumn number and second gives us variable name corresponding to that coloumn number.

### * activity_labels.txt
    This file gives relationship between activity_labels present in y_test and y_training with descriptive activity names such as WALKING, STANDING etc.It has total of 6 rows and 2 coloumns.First coloumn gives us integer and second coloumn gives us the corresponding activity name associated with the integer value.

========================================================
Data Collection and Cleaning Description
========================================================

* Source of raw data is "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
* Unzip the folder and placed it in current working directory. The folder that will appear after uncompressing is UCI HAR Dataset.
* Read files "X_train.txt", "y_train.txt" and subject_train.txt and do a coloumn bind (cbind) to make it into one data set.
* Repeat the above steps with test data set.
* Append training set and test data set into one large data set using row bind (rbind). The top part of the data is from training set and lower part is from testing set.This has a total of 563 coloumns and 10299 rows.
* To extract the data which has only measurement on average and standard deviation,features.txt file has been used. It has two columns.First coloumn gives us the information on the coloumn number of test and training set and second coloumn gives us name of the variable. 
* File features.txt does not have values for subject and activity. Therefore, coloumns for activity and subject has been added with the values of "activity","subject" and corresponding coloumns number as 562 and 563 as we have cbind in the same order(in above steps).  
* From features.txt file all rows have been extracted which contains the substring of mean() and std().For instance,tBodyAcc-mean()-X and tBodyGyroMag-std() is valid whereas tBodyAcc-mad()-Y and fBodyAcc-meanFreq()-X is treated as invalid data which is filtered out.
* Read file activity_labels.txt to extract activity name corresponding to integer.It has a dimension of six rows and two coloumns.The first coloumn is an integer and second coloumn is the name of the activity corresponding to that integer. This integer is stored in coloumn named as activity.
* Used above information to replace integer in activity coloumn with the corresponding activity name.
* Split the data based on subject and activity. Used sapply, to do a mean of each variable for  each subject and activity. This generated a matrix of 180 coloumns and 68 rows. Coloumn names and Row names can be read using colnames and rownames respectively. 
* The above step while calculating mean will throw warning messages. Reason is activity coloumn has names, and therefore mean can't be computed and warning says it is returning NA. It can be neglected as we don't need this coloumn in our future process and therefore this coloumn is dropped in next step.
* Coloumn names with activity and subject has been removed to make data tidy.This will leave the data set to be equal to 180 coloumns and 66 rows.
* This data is written to a text file  "Assignment_DataandCleaning.txt" which can further be used to do a data analysis on it.

========================================================
System and Elapsed time
========================================================
### system.time returns the following value
    user    :- 31.916
    system  :- 0.000
    elapsed :- 31.872
 
 This is not only dependent on this script but also depends on system and other running processes.

========================================================
Reference
========================================================
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



