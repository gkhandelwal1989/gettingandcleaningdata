# reading training data set
X_t <- read.table("UCI HAR Dataset/train/X_train.txt")
y_t <- read.table("UCI HAR Dataset/train/y_train.txt")
sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
# combining X_t and y_t training set
r1 <- cbind(X_t,y_t)
# combining X_t,y_t and subject training set
r1 <- cbind(r1,sub)
# reading test data set
X_t <- read.table("UCI HAR Dataset/test/X_test.txt")
y_t <- read.table("UCI HAR Dataset/test/y_test.txt")
sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
# combining X_t and y_t test set
r2 <- cbind(X_t,y_t)
# combining X_t,y_t and subject test set
r2 <- cbind(r2,sub)
# combining training and test data
r1 <- rbind(r1,r2)
# reading features.txt
m<- read.table("UCI HAR Dataset/features.txt")
#extracting -mean() and -std()
extracted <- m[grep("mean\\(\\)|std\\(\\)",m[,2]),]
len <- nrow(extracted)
# subset levels and add level activity and subject
lev <- levels(extracted[,2])
lev <- lev[grep("mean\\(\\)|std\\(\\)",lev)]
lev<-c(lev,"activity","subject")
extracted[,2] <- factor(extracted[,2],levels=lev)
# we have done this to add activity_Labels and Subject in the resulting else 
#it would get neglected
extracted[c(len+1,len+2),1] <-c(562,563)
extracted[c(len+1,len+2),2] <-c("activity","subject") 
rpart3 <- r1[,extracted[,1]]
# reading activity_labels 
n <- read.table("UCI HAR Dataset/activity_labels.txt")
rpart3[,67]<-n[rpart3[,67],2]
names(rpart3)<- extracted[,2]
#splitting based on activity and subject
ass <- (split(rpart3,list(rpart3$activity,rpart3$subject),drop=TRUE))
# calculate mean for every variable in each subject and each activity. 
kj<- sapply(names(ass),function(ds) sapply(ass[[ds]],mean))
#removing row of activity and subject as we don't need it
kj <- kj[c(1:66),]
#writinng to Assignment_DataandCleaning.txt
write.table(kj, file = "Assignment_DataandCleaning.txt")


