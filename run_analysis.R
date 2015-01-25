X_train <- read.table("train/X_train.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
features <- read.table("features.txt", quote="\"")
names(X_train) <- features$V2


X_test <- read.table("test/X_test.txt", quote="\"")
names(X_test) <- features$V2
y_test <- read.table("test/y_test.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")


activity_labels <- read.table("activity_labels.txt", quote="\"")
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

rexp <- "mean\\(\\)|std\\(\\)"
namex <- grep(rexp,names(X),perl = T,value = F)
X_select <- X[,namex]

dataset <- cbind(subject,y,X_select)
names(dataset)[c(1,2)] <- c("subject","activity_code")

subsplit <- split(dataset,dataset$subject)
subsplit2 <- lapply(subsplit,function(x){split(x,x$activity_code)})
tidy <- data.frame()
for (i in 1:30){
  temp <- lapply(subsplit2[[i]],colMeans)
  for (j in temp){
    tidy <- rbind(tidy,j)
  }
}
names(tidy) <- names(dataset)

activity <- rep(activity_labels$V2,30)
tidy$activity_code <- activity
names(tidy)[2] <- "activity"
write.table(tidy,"tidy.txt",row.names = F)