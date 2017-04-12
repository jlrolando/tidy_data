#Initial wdir
setwd("C:/Users/Jose Luis Rolando/Dropbox/PhD/R Coursera/Data cleaning/Final_project")

#Load libraries
library(dplyr)

#Download and unzip data
daturl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(daturl, destfile = "./dat.zip")
unzip("dat.zip")

#Read tables
setwd("./UCI HAR Dataset")
features<-read.table("features.txt", header=F, stringsAsFactors = F)
activity_labels<-read.table("activity_labels.txt", header=F, stringsAsFactors = F)

setwd("./test")
subject_test<-read.table("subject_test.txt", header=T, stringsAsFactors = F)
y_test<-read.table("y_test.txt", header=T, stringsAsFactors = F)
x_test<-read.table("x_test.txt", header=T, stringsAsFactors = F)

setwd("../train")
subject_train<-read.table("subject_train.txt", header=T, stringsAsFactors = F)
y_train<-read.table("y_train.txt", header=T, stringsAsFactors = F)
x_train<-read.table("x_train.txt", header=T, stringsAsFactors = F)

#Give data frames column names

features_names<-features[,2]
features_names<-make.names(features_names,unique = TRUE, allow_ = TRUE)
names(x_test)<-features_names
names(x_train)<-features_names
names(subject_test)<-"subject"
names(subject_train)<-"subject"
names(y_test)<-"activity"
names(y_train)<-"activity"

#Create a data frame containing a character vector with "test" or "train" 
#with equal amount of observations depending on the data set

datatype_test<-as.data.frame(rep("test", times = length(x_test[,1])))
names(datatype_test)<-"datatype"
datatype_train<-as.data.frame(rep("train", times = length(x_train[,1])))
names(datatype_train)<-"datatype"

#Merge the train and test table with their subject and y table

test<-bind_cols(subject_test,y_test,datatype_test,x_test)
train<-bind_cols(subject_train,y_train,datatype_train,x_train)

#Merge the test and train data set
dat<-bind_rows(train,test)

#Change activity names
dat$activity<-as.character(dat$activity)

dat$activity<-recode(dat$activity, "1"= activity_labels[1,2],
       "2" = activity_labels[2,2],
       "3" = activity_labels[3,2],
       "4" = activity_labels[4,2],
       "5" = activity_labels[5,2],
       "6" = activity_labels[6,2])

#Filter variables names for mean or standard deviation

dat_filter<-grep("mean|std|subject|activity", names(dat)) 
dat2<-dat[,dat_filter]

#Group by subject and activity
dat3 <- dat2 %>% group_by(subject,activity) %>% summarize_each(funs(mean))

setwd("../..")
write.table(dat3, file = "tidy_dataset.txt", row.name=FALSE)