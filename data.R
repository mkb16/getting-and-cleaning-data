library(data.table)
library(reshape2)
library(dplyr)
unzip("HARDataset.zip") #unziping the file
path <- file.path("UCI HAR Dataset")
files <- list.files(path , recursive = TRUE) # listing all the files
#train files
TrainV  <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
TrainL <- read.table("UCI HAR Dataset/train/Y_train.txt", header = F)
TrainS <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)

#test files
TestV  <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
TestL <- read.table("UCI HAR Dataset/test/Y_test.txt", header = F)
TestS <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F)

#merging the data
features <- rbind(TrainV , TestV )
lables <- rbind(TrainL , TestL )
subjects <- rbind(TrainS , TestS )

#naming the mereged data
names(lables) <- c("activity")
names(subjects) <- c("subjects")
feat <- read.table("UCI HAR Dataset/features.txt")
names(features) <- feat$V2

datas <- cbind(features , lables)
final <- cbind(datas , subjects) # merged data


#extracting the names which have mean() and std()
extract <- final[ , grepl("mean\\(\\)|std\\(\\)" , names(final))]

#activity lables
activitylables <- read.table("UCI HAR Dataset/activity_labels.txt", header = F)
lables$activity <- activitylables[match(lables$activity , activitylables$V1) , 2]

names(lables) <- "Activity"
names(subjects) <- "SubjectsID"
featnames <- feat[grepl("mean\\(\\)|std\\(\\)" , feat[ ,2]) , ][,2]
names(extract) <- featnames

#bringing all together
finaldataset <- cbind(subjects , lables , extract)

#tidydata
tidy <- data.table(finaldataset)
cleandata <- tidy[,lapply(.SD,mean), by="Activity,SubjectsID"]

#writing the data 
write.table(cleandata, file = "clean.txt", row.names = FALSE)
