Pre-processing the Human Activity Recognition Dataset
========================================================
Author: Shadi Zabad,
Getting and Cleaning Data Course,
21 June 2014

## Introduction

This file contains a rough outline of the steps that were taken to transform the raw Human Activity Recognition Dataset into a wide tidy dataset that can be used for further analysis. Each step will be thoroughly explained and the rationale behind it will hopefully become obvious. There were some choices that had to be made, and the justification for those choices will be partly explained here and partly in the CodeBook.md file.

## Files Description

The following is a description of the relevant files that will be found in the repository:

* run_analysis.R: The data pre-processing script, written in R.
* tidy_data.txt: The output of running the pre-processing script. (**Dimensions: 68cols x 180rows**)
* CodeBook.md: The codebook, which describes the variables in the tidy dataset and how they were generated.

## The Original Dataset

The original dataset on which the pre-processing script was run is the [Human Activity Recognition Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), provided by the UCI Machine Learning Repository. According to the description attached with the data files, the dataset was "built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors".

However, since the original application that required generating the dataset was a machine learning problem, the original dataset was split into training and testing subsets, each with its own files. The subject as well as the activity corresponding to each measurement were included in separate files. This means that before pre-processing the data into a tidy format, we have to run it through a procedure to combine all the data into 1 uniform dataframe. 

## The Steps Taken to Transform the Original Dataset

The following is a rough outline of the different steps taken to transform the original dataset into the wide tidy dataset that can be found in the file (tidy_data.txt):

### Phase 0: Reading and preparing the datasets for pre-processing:

1. **Step 0.1:** Read the activity & feature description files. In this step, the first thing I do is read the accompanying feature file, which gives the column names for the different entries in the original dataset. Then, I append to it the feature names Subject and Activity, which will be the column names for the Subject and Activity columns (See Step 0.2 & Step 0.3). Second, I read the activity description file, which contains the ID (integers from 1 to 6) of the activity and its description. This will be used to replace the integers in activity column with descriptive names later on. 

2. **Step 0.2:** Read the test data. In this step, I read the subset of the data which was used for testing. However, as mentioned before, the subject as well as the activity data for each record were put into separate files. Therefore, in this step, I have to read the three files that contain the data (subject_test.txt, X_test.txt, and y_test.txt) and append them together. This step also includes assigning the column names to the complete testing subset as well as replacing the numbers in the activity column with their textual descriptions. 

3. **Step 0.3:** Read the training data. The steps are the same ones that I described in Step 0.2, except that the files that were read this time are: (subject_train.txt, X_train.txt, and y_train.txt). 

4. **Step 0.4:** Merge the testing and training subsets. This was done by simply invoking the rbind function in R. This will simply add the rows of the training data subset and the testing datasubset into a single dataframe. 

5. **Step 0.5:** From the combined dataset, extract the columns that correspond to the Subject and activity data, as well as those columns that pertain to data about the mean or standard deviation. (Satisfies requirement 2 in the assignment). For the rationalte behind what columns were selected, please see the section (What Columns Were Selected and Why?) below. 

6. **Step 0.6:** In the last step in the reading and preparation phase, I just removed special characters such as "()", ",", and "-" in the column names and replaced them with either an underscore ("_") or nothing, depending on where they occur in the name.


### Phase 1: Creating a Second Tidy Dataset: 

1. **Step 1.1:** Melt the combined dataset. In this step, we apply the function *melt* from the *reshape2* package to reshape the combined dataset. I simply use the Subject & Activity columns as IDs, and the remaining columns as variables. This creates a reshaped dataframe of 4 columns (Subject, Activity, variable, value) & 679734 observations. 

2. **Step 1.2:** Combine the subject and activity columns into 1. The rationale behind this step is that I want to use the dcast function in the next step (Step 1.3), and for that I need to write a casting formula that calculates the mean for each subject and activity permutation. I'll split them again and add them separate columns later on.

3. **Step 1.3:** Cast the melted data into a dataframe, and take the mean of the different variables for each subject & activity pair. (Satisfies part of requirement 5).

4. **Step 1.4:** Recreate the Subject and Activity variables as separate columns, and append them to the cast dataframe. 

5. **Step 1.5:** Reordering and beautifying the tidy dataset. In this step, I remove the combined Subject_Activity Column, move the separate Subject and Activity columns to the left, and sort by the subject. I also added the keyword "Avg" to the names of the remaining columns to remind the reader that they represent the average across different measurements for the same subject & activity pairs. 

### Phase 2: Writing the Tidy Dataset to an External File:

In this phase, I simply used the *write.table* function to output the tidy dataset to an external txt file. The separator character that I chose is a comma, which is easy to read and process in the future. I didn't include the row names (the row numbers) in the output file. The name of the output file is tidy_data.txt

## What Columns Were Selected? And Why?

There was some discussion in the forums surrounding the choice of columns that satisfy requirement #2. What columns exactly correspond to the mean and standard deviation of each *measurement*? I personally selected the columns that correspond to the mean and standard deviation of the measurements, excluding in the process the columns that contain information about the mean frequency, gravityMean, etc. My grepl function looked for the following pattern in the column names: **"Subject|Activity|mean()|std()"**.

While it's debatable if this is what requirement 2 was asking, I think this the best interpretation of the wording of the requirement, since the other means that were excluded aren't strictly means of the measured data. Selecting all the means can be easily achived in my code just by using the following regular expression instead of the one mentioned above: **"Subject|Activity|mean|std"**.

## Is the Output Dataset (tidy_data.txt) Tidy? And Why? 

I think that the dataset that my pre-processing script outputs (tidy_data.txt) is indeed a tidy dataset because it satisfies the conditions for being a tidy dataset. Each column in my output dataset corresponds to a separate variable (Subject, Activity, Avg_tBodyAcc_mean_X, etc.) and each row corresponds to a separate observation. My dataset also has a row of the column names on top, and the column names are sufficiently descriptive.

**Why a wide tidy dataset?** 

This is also another topic that was hotly debated in the discussion forums on Coursera. Some people prefer wide tidy datasets while others prefer narrow tidy datasets. I personally prefer wide tidy dataset, mainly because of my experience with databases. But I think that both wide and narrow tidy datasets are equally workable, as long as you have descriptive column names and each column corresponds to a separate variable and each row corresponds to a separate observation.   
