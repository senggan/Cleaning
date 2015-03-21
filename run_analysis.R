run_analysis <- function() {
    
    # 1. Extracts only the measurements on the mean and standard deviation
    # 2. Merges the training and the test sets to create one data set.#    for each measurement. 
    # 3. Uses descriptive activity names to name the activities in the 
    #    data set
    # 4. Appropriately labels the data set with descriptive variable names. 
    # 5. From the data set in step 4, creates a second, independent tidy 
    #    data set with the average of each variable for each activity 
    #    and each subject.
    
    ## Source of data
    # 1. "features.txt"
    # 2. "activity_labels.txt"
    # 3. "train\X_train.txt" & "test\X_test.txt"
    # 4. "train\subject_train.txt" & "test\subject_test.txt"
    # 5. "train\y_train.txt" & "test\y_test.txt"
    
    # Load dplyr and tidyr packages
    
    library(dplyr)
    library(tidyr)
    
    # Read all the files into data frame and convert to tbl class
    # in order to use dplyr package
    
    # Column Labels for 561 Variables
    ColLabels <- read.table("features.txt", stringsAsFactors=FALSE)
    ColLabels <- tbl_df(ColLabels)
    
    # Activities labels for the 6 activities
    ActLabels <- read.table("activity_labels.txt")
    
    
    # Test Data Set
    # The measurements
    TestData <- read.table("test\\X_test.txt", stringsAsFactors=FALSE)
    TestData <- tbl_df(TestData) 
    
    # Subject ID of the measurements
    TestSubject <- read.table("test\\subject_test.txt", stringsAsFactors=FALSE)
    TestSubject <- tbl_df(TestSubject)
    names(TestSubject) <- "SubjectId"
    
    # Activity Code of the measurements
    TestAct <- read.table("test\\y_test.txt", stringsAsFactors=FALSE)
    TestAct <- tbl_df(TestAct)
    names(TestAct) <- "Activity"
    
    # Train Data Set
    # The measurements
    TrainData <- read.table("train\\X_train.txt", stringsAsFactors=FALSE)
    TrainData <- tbl_df(TrainData) 
    
    # Subject ID of the measurements
    TrainSubject <- read.table("train\\subject_train.txt", stringsAsFactors=FALSE)
    TrainSubject <- tbl_df(TrainSubject)
    names(TrainSubject) <- "SubjectId"
    
    # Activity Code of the measurements
    TrainAct <- read.table("train\\y_train.txt", stringsAsFactors=FALSE)
    TrainAct <- tbl_df(TrainAct)
    names(TrainAct) <- "Activity"
    
    # Get the Column Index and Label for mean and std measurement
    # by searching for mean and std in the column label. Please
    # note that MeanFreq are excluded since it is not either mean or
    # standard deviation of measurment
    # This will be used to pick up the columns in data set
    
    MeanStdIndex <- grep("-mean\\(|-std\\(", ColLabels$V2, value=FALSE)
    MeanStdLabels <- grep("-mean\\(|-std\\(", ColLabels$V2, value=TRUE)
    
    # Since it is easier to pickup the columns before we
    # Columnn merge into the data set of the subject id and 
    # activity code, we select the mean and std columns out of 
    # data first
    
    # Pickup the columns
    TrainMeanStd <- select(TrainData, MeanStdIndex)
    
    # Labels the columns
    names(TrainMeanStd) <- MeanStdLabels
    
    # Pickup the columns
    TestMeanStd <- select(TestData, MeanStdIndex)
    
    # Labels the columns
    names(TestMeanStd) <- MeanStdLabels 
    
    # Add in subject column and Activity code column for both train
    # and test data set.  Then, merge both data sets
    
    CompleteTrain <- bind_cols(TrainSubject, TrainAct, TrainMeanStd)
    CompleteTest <- bind_cols(TestSubject, TestAct, TestMeanStd)
    CompleteData <- bind_rows(CompleteTrain, CompleteTest)
    
    # Translate Activity Code into Activity Labels
    CompleteData$Activity <- ActLabels[ CompleteData$Activity,2]
    

    # Group by SubjectID and Activity
    CompleteData <- group_by(CompleteData, SubjectId, Activity)

    # Create mean values of all mean and standard deviation of 
    # measurements
    
    MeanTable <- summarise_each(CompleteData, funs(mean))

    # Write out the result to MeanTbl.txt
    write.table(MeanTable, file="MeanTbl.txt", row.names=FALSE)
}