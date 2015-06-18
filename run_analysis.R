##Connect to url
setwd("C:/Users/ivan/Desktop/COURSERA")
file <- "data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI HAR Dataset"
result <- "results"

##Install packages and check

if(!is.element("plyr", installed.packages()[,1])){install.packages("plyr")
}

library(plyr)
if(!file.exists(file)){

##Download data
  download.file(url,file, mode = "wb")  
}

if(!file.exists(result)){dir.create(result)
} 

##use cols
tabla <- function (filename,cols = NULL){
  
  t1 <- unz(file, paste(data_path,filename,sep="/"))
  
  data <- data.frame()
  
  if(is.null(cols)){
    data <- read.table(t1,sep="",stringsAsFactors=F)
  } else {
    data <- read.table(t1,sep="",stringsAsFactors=F, col.names= cols)
  }  
  data
  
}
getData <- function(type, features){
  data2 <- tabla(paste(type,"/","subject_",type,".txt",sep=""),"id")
  y_data <- tabla(paste(type,"/","y_",type,".txt",sep=""),"activity")    
  x_data <- tabla(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
  
  return (cbind(data2,y_data,x_data)) 
}

##save data
saved <- function (data,name){
  
  file <- paste(result, "/", name,".csv" ,sep="")
  write.csv(data,file)
}
#features used for col names when creating train and test data sets
features <- tabla("features.txt")

## Load the data sets
train <- getData("train",features)
test <- getData("test",features)

################################### 1. Merges the training and the test sets to create one data set using rbind

data <- rbind(train, test)

#rearrange 
data <- arrange(data, id)
####################### 2. Extracts only the measurements on the mean and standard deviation (std and mean)
#######################for each measurement. 

output1 <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]

################### 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- tabla("activity_labels.txt")
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

#save first full output output1 
saved(output1,"output1")

########################### 5. Creates a second, independent tidy data set with the average of
###########################   each variable for each activity and each subject. 


output2 <- ddply(output1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# 4.Appropriately labels the data set with descriptive variable names
names(output2)<-gsub("Acc", "Accelerometer", names(output2))
names(output2)<-gsub("Gyro", "Gyroscope", names(output2))
names(output2)<-gsub("BodyBody", "Body", names(output2))
names(output2)<-gsub("Mag", "Magnitude", names(output2))
names(output2)<-gsub("^t", "Time", names(output2))
names(output2)<-gsub("^f", "Frequency", names(output2))
names(output2)<-gsub("tBody", "TimeBody", names(output2))
names(output2)<-gsub("-mean()", "Mean", names(output2), ignore.case = TRUE)
names(output2)<-gsub("-std()", "Std Dev", names(output2), ignore.case = TRUE)
names(output2)<-gsub("-freq()", "Frequency", names(output2), ignore.case = TRUE)
names(output2)<-gsub("std", "Std Dev", names(output2), ignore.case = TRUE)


#tidy output2 to results folder
write.table(output2, "C:/Users/ivan/Desktop/COURSERA/results/output2.txt")
