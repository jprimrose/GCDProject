library(data.table)
library(reshape2)
library(dplyr)
require(plyr)

#
#           james.primrose              08.24.2014          '_'
#                                                          {0,0} - w00t!
#                                                          (| (\
#                                                          -"-"-
#
# run_analysis.R
# link awful data together :/
# subset mean() and std() columns   
# decodes activities 
# add descriptive names to columns
# exports tidy data set w/avg per var per activity per subject
#

######################
# Headers
featHdr <- read.table("UCI HAR Dataset/features.txt")
# remove "," & "-" from features
featHdr$edit <- gsub("[[:punct:]]","",featHdr[,2])

actvHdr <- c("Activity Code","Activity")
actvY <- c("Activity Code")
colAdd <- c("Subject","Activity")

# Activity Labels & Column Headers
actv <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(actv) <- actvHdr

######################
# TEST
# Load test and add col names
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(xtest) <- featHdr[,3]

# get std and mean only
xtest <- select(xtest,contains("mean"), contains("std"))

# Load test activity data
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(ytest) <- actvY

testSA <- merge(actv,ytest,by.x="Activity Code")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subtest) <- c("Subject")
testSA <- cbind(testSA,subtest)
testSA <- cbind(testSA,xtest)

######################
# TRAIN
# Load train data and add col names
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(xtrain) <- featHdr[,3]

# get std and mean only
xtrain <- select(xtrain,contains("mean"), contains("std"))

# Load test activity data
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(ytrain) <- actvY

trainSA <- merge(actv,ytrain,by.x="Activity Code")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subtrain) <- c("Subject")

trainSA <- cbind(trainSA,subtrain)
trainSA <- cbind(trainSA,xtrain)

# 1 finally
finalSA <- rbind(trainSA,testSA)
finalSA <- finalSA[2:89]
finalSA$Subject <- as.factor(finalSA$Subject)

# aggregate
tidy2 <- aggregate(as.matrix(finalSA[3:88]), as.list(finalSA[,1:2]), FUN=mean)
# ddply for yucks
tidy <- ddply(finalSA, .(Activity,Subject), numcolwise(mean))

# output the tidy file
write.table(tidy,file="tidy.txt",row.name=FALSE)

