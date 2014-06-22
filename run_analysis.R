########################################################
# Author: Shadi Zabad
# Getting and Cleaning Data Course
# 21 June 2014

# The aim of this course project is to practice
# the various tools and skills necessary to
# obtaining and preparing datasets for further analysis.

# The dataset used for this analysis is the 
# Human Activity Recognition Dataset, obtained from
# the UCI Machine Learning Repository. 
########################################################

## Phase 0: Reading the datasets:

# Step 0.1: Read the the feature & activity description files: 

# Read the features file:
features <- read.table("features.txt")
features <- as.character(features[,2])
# Append the Subject & Activity column names to the feature list:
features <- append(c("Subject", "Activity"), features)

# Read the activity label file:
activity <- read.table("activity_labels.txt")
names(activity) <- c("Number", "Description")

# Step 0.2: Read the test data:
testData <- read.table("test/X_test.txt")

test.activity <- read.table("test/y_test.txt")
testData <- cbind(test.activity, testData)
test.subject <- read.table("test/subject_test.txt")
testData <- cbind(test.subject, testData)

names(testData) <- features

testData$Activity <- as.factor(testData$Activity)
levels(testData$Activity) <- as.character(activity$Description)

# Step 0.3: Read the training data:
trainData <- read.table("train/X_train.txt")

train.activity <- read.table("train/y_train.txt")
trainData <- cbind(train.activity, trainData)
train.subject <- read.table("train/subject_train.txt")
trainData <- cbind(train.subject, trainData)

names(trainData) <- features

trainData$Activity <- as.factor(trainData$Activity)
levels(trainData$Activity) <- as.character(activity$Description)


# Step 0.4: Merge the testing and training datasets:

orig.dataset <- rbind(trainData, testData)

# Step 0.5: Extract columns with mean and std values:

orig.dataset <- orig.dataset[, grepl("Subject|Activity|mean\\(\\)|std\\(\\)", features)]

# Step 0.6: Remove special characters from the feature text:

names(orig.dataset) <- gsub("[(]*) *$", "", names(orig.dataset))
names(orig.dataset) <- gsub("[()]+[-]*|[)]*[,]+|[-]+|[(]+", "_", names(orig.dataset))

## Phase 1: Creating a second tidy dataset:

# Step 1.1: Melt the original dataset (treat Subject & Activity as 
# IDs and the remaining columns as variables):

meltedData <- melt(orig.dataset, id=names(orig.dataset)[1:2], 
                   measure.vars=names(orig.dataset)[3:ncol(orig.dataset)])

# Step 1.2: Combine the Subject & Activity columns into 1 before casting:

meltedData$Subject_Activity <- paste(meltedData$Subject, 
                                     meltedData$Activity, sep="-")

# Step 1.3: Cast the melted dataset & take the average (mean) of
# the variable columns: 

tidy_data <- dcast(meltedData[,3:ncol(meltedData)], 
                   Subject_Activity ~ variable, mean)

# Step 1.4: Recreate the Subject & Activity features as separate columns:

sub_act <- strsplit(tidy_data$Subject_Activity, "-")
sub_act_df <- sapply(sub_act, function(i) c(i[1], i[2])) # Convert to a dataframe

tidy_data$Subject <- sub_act_df[1,]
tidy_data$Activity <- sub_act_df[2,]

# Step 1.5: Reordering and beautifying the tidy dataset:

tidy_data <- tidy_data[,c(ncol(tidy_data) - 1, ncol(tidy_data), 
                          2:(ncol(tidy_data)-2))]

tidy_data$Subject <- as.integer(tidy_data$Subject)
tidy_data <- tidy_data[order(tidy_data$Subject),]

# Pasting the string 'Avg', before the column names so that
# it would be clear that the values are basically averaged
# out across different measurements: 

names(tidy_data)[3:ncol(tidy_data)] <- paste("Avg", 
                                             names(tidy_data)[3:ncol(tidy_data)], 
                                             sep="_")

## Phase 2: Writing the tidy dataset to an external file: 

write.table(tidy_data, "tidy_data.txt", sep=",", row.names=FALSE)

########################################################
# END OF FILE #
########################################################