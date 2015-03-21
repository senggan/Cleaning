---
title: "CODEBOOK"
output: html_document
---
# Procedure to clean and extract data

## Source of data

1) "features.txt" 

* A file contains the 561 columns label of the test and train data set

2) "activity_labels.txt" 

* A file with 6 rows with descriptive name of each activities

3) "train\X_train.txt" & "test\X_test.txt" 

* The complete data set with 561 columns.  Please note that the "X" at the file name is capitalized.

4) "train\subject_train.txt" & "test\subject_test.txt"

* A file with subject id for each row in x_train.txt & x_test.txt

5) "train\y_train.txt" & "test\y_test.txt"

* A file with activity code for each row in x_train.txt & x_test.txt

## Processing Step inside the run_analysis.R script

1. Read all the source files into data frame and convert to tbl class in order 
to use dplyr package

2. Get the Column Index and Label for mean and std measurement by searching for mean and std 
in the column label. Please note that MeanFreq are excluded since it is neither mean or 
standard deviation of measurment This will be used to pick up the columns in data set

3. Extracts only the measurements on the mean and standard deviation for each measurement. 

4. Appropriately labels the data set with descriptive variable names.

5. Add in subject column and Activity column for both train and test data set.

6. Merges the training and the test sets to create one data set.
7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Write out the tindy data set to "MeanTbl.txt"

# Data Dictionary
The raw data are from "Human Activity Recognition Using Smartphones Dataset
Version 1.0" produced by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Output data are 68 columns.  The description of each Columns are as follows:

Column 3 to 68 has the range of value from -1.0 to 1.0.  
They are the mean of the mean or standard deviation of the specic measurement.

1. SubjectId - The value range for 1 to 30 corresponding to 30 subjects.

2. Activity - 6 possible values: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING","LAYING"

3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y          
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X           
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y       
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z        
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y      
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X       
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y         
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z          
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y     
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X      
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()      
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()         
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()     
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y          
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X           
47. fBodyAcc-std()-Y            
48. fBodyAcc-std()-Z           
49. fBodyAccJerk-mean()-X
50. fBodyAccJerk-mean()-Y      
51. fBodyAccJerk-mean()-Z       
52. fBodyAccJerk-std()-X       
53. fBodyAccJerk-std()-Y        
54. fBodyAccJerk-std()-Z       
55. fBodyGyro-mean()-X          
56. fBodyGyro-mean()-Y         
57. fBodyGyro-mean()-Z          
58. fBodyGyro-std()-X          
59. fBodyGyro-std()-Y           
60. fBodyGyro-std()-Z          
61. fBodyAccMag-mean()          
62. fBodyAccMag-std()          
63. fBodyBodyAccJerkMag-mean()
64. fBodyBodyAccJerkMag-std()  
65. fBodyBodyGyroMag-mean()     
66. fBodyBodyGyroMag-std()     
67. fBodyBodyGyroJerkMag-mean()
68. fBodyBodyGyroJerkMag-std() 