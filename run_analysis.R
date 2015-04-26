# Reading train Data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=F,sep="",dec=".")
x_train  <- read.table("UCI HAR Dataset/train/X_train.txt",header=F,sep="",dec=".")
y_train  <- read.table("UCI HAR Dataset/train/y_train.txt",header=F,sep="",dec=".")

# Reading test Data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=F,sep="",dec=".")
x_test   <- read.table("UCI HAR Dataset/test/X_test.txt",header=F,sep="",dec=".")
y_test   <- read.table("UCI HAR Dataset/test/y_test.txt",header=F,sep="",dec=".")

# Reading activity names and features/Field names for
# Observations files
activity_table <- read.table("UCI HAR Dataset/activity_labels.txt",header=F,sep="",dec=".")
main_names   <- read.table("UCI HAR Dataset/features.txt",header=F)[,2]

# Naming train and test observations with features/field names
names(x_test)   <- main_names
names(x_train)  <- main_names

# Naming subject and activity Columns from additional files
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")
names(y_train) <- c("activity")
names(y_test) <- c("activity")

# Merging/column binding all test and train data, 
main_table_test <- cbind(y_test,subject_test,x_test)
main_table_train <- cbind(y_train,subject_train,x_train)

# Then merging/row binding both result tables
main_table <- rbind(main_table_test,main_table_train)

# Naming activity label columns (to be used later)
# Important: first Column name as same as main_table to 
# make possible a Join/Merge
names(activity_table) <- c("activity","activity_name")

# Merging(Joining) Main data with Activity labels by activity (number)
main <- merge(activity_table,main_table)

# Tidying main_table: getting only needed columns:
# mean and std columns coming from grepping "mean()" and "std()" from 
# column names
tidy_main <- cbind(main[c("subject","activity")],main[grep("mean()",names(main),fixed=T)],main[grep("std()",names(main),fixed=T)]) 

# Calculating mean values for all mean and std columns by subject and activity
attach(tidy_main)
tidy_avg <- aggregate(tidy_main,by=list(subject,activity),FUN=mean, simplify=T)
detach(tidy_main)

#Re-merging activity labels and dropping additional/non needed Group Columns
analysis_result <- merge(activity_table,tidy_avg)[-c(1,3,4)]

#Creating a file with analysis_result data frame
write.table(analysis_result,file="analysis_result.txt",sep=" ",row.name=F)

# Removing temporal/intermediate step objects results
rm(subject_train, x_train, y_train)
rm(subject_test, x_test, y_test)
rm(main_names,main_table_test,main_table_train)
rm(main,main_table)
rm(tidy_main, tidy_avg, activity_table)
