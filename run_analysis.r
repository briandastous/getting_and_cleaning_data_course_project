library(plyr)

dataDir = "./UCI HAR Dataset"

# load activity labels
activities = read.table(paste0(dataDir, "/activity_labels.txt"), stringsAsFactors = FALSE)
colnames(activities) <- c("activityLabel", "activityName")

# load features
features = read.table(paste0(dataDir, "/features.txt"), stringsAsFactors = FALSE)
colnames(features) <- c("featureIndex", "featureName")

# load training and test data
trainingData = read.table(paste0(dataDir, "/train/X_train.txt"))
trainingLabels = read.table(paste0(dataDir, "/train/y_train.txt"))[[1]]
trainingSubjects = read.table(paste0(dataDir, "/train/subject_train.txt"))[[1]]

testData = read.table(paste0(dataDir, "/test/X_test.txt"))
testLabels = read.table(paste0(dataDir, "/test/y_test.txt"))[[1]]
testSubjects = read.table(paste0(dataDir, "/test/subject_test.txt"))[[1]]

# merge the training and test data
allData = rbind(trainingData, testData)

# rename the columns for easy reading
colnames(allData) <- features$featureName

# keep only the mean and std values
allData = allData[,grep("-mean\\(\\)|-std\\(\\)", features$featureName, value=TRUE)]

# bind columns for the activityLabel and subject, and merge in the activity names. 
allData = cbind(allData, c(trainingLabels, testLabels))
colnames(allData)[[length(colnames(allData))]] = "activityLabel"
allData = cbind(allData, c(trainingSubjects, testSubjects))
colnames(allData)[[length(colnames(allData))]] = "subject"
allData = merge(allData, activities, by="activityLabel")[, setdiff(union(names(allData), names(activities)), "activityLabel")]

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meansByActivityAndSubject = ddply(allData, .(subject, activityName), numcolwise(mean))




