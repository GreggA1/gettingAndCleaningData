##Merges the training and the test sets to create one data set.

##merge rows
unifiedLabels <- rbind(labelTrain, labelTest) ##x DS
unifiedSubject <- rbind(subjectTrain, subjectTest) 
unifiedActivities <- rbind(y_train, y_test) ##y DS
##Use View() function to review contents of data sets
##Extracts only the measurements on the mean and standard deviation for each measurement

unifiedLabelsMeanSTD <- unifiedLabels[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
##ex. t-BodyAccmean()-X()
##    -0.872395380

##Use descriptive activity names to name the activities in the data set

unifiedActivities[, 1] <- read.table("activity_labels.txt")[unifiedActivities[, 1], 2]
names(unifiedActivities) <- "Activity" 
##ex. Activity
##    Standing

##Appropriately label the data set with descriptive activity names
names(unifiedSubject) <- "Subject"
##ex. Subject 
##    5

##Merge the data sets together
unifiedDataSet <- cbind(unifiedLabelsMeanSTD, unifiedActivities, unifiedSubject)
##Rename our column headings descriptively
names(unifiedDataSet) <- make.names(names(unifiedDataSet))
names(unifiedDataSet) <- gsub('Acc',"Acceleration",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('Gyro',"AngularSpeed",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('GyroJerk',"AngularAcceleration",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('Mag',"Magnitude",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('\\.std',".StandardDeviation",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('\\.mean',".Mean",names(unifiedDataSet))
names(unifiedDataSet) <- gsub('^t',"TimeDomain.",names(unifiedDataSet))

##Create a second, independent tidy data set with the average of each variable for each activity and each subject

library(plyr)
library(dplyr)
tidyData<-aggregate(. ~Subject + Activity, unifiedDataSet, mean) ##average vars/subj
tidyData<-tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "tidy.txt",row.name=FALSE)


