# Cleaning
Repository for Coursera "Getting and Cleaing Data" Class Project

* 1) The data file has to be downloaded to the local computer and unzip to a directory.  The URL to download the file is as below.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* 2) The R script "run_analysis.R" has to be copied to the directory created in step (1)

* 3) Do a "list.files()" to confirm that your working directory and the script are in the same directory

> list.files()
[1] "activity_labels.txt"   "Cleaning"             
[3] "features.txt"          "features_info.txt"    
[5] "README.txt"            "run_analysis.R"       
[7] "test"                  "train"                
[9] "UCI HAR Dataset.Rproj"

* 4) Specifically, you should see "run_analysis.R", "features.txt", "features_info.txt", "activity_labels.txt" at the same directory.  You can ignore any other files if they do nto exist.

* 5) And, you should see "test" and "train" as subdirectory.  Then, you are good to start running the program.

* 6) If you do not see those files and directory, please change and check your current working directory.  If that is not the problem, you may have to do restart from step (1)