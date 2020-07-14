#Leron PATEL

library(dplyr)
library(tidyr)

#----------------------------------EXTRACTING FILES--------------------------------------------------------
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destination zip
file<-paste0(getwd(),"/","run_analysis.zip")
#download zip file
download.file(url,file)
#unzip file
outdir<-getwd()
unzip("run_analysis.zip",exdir = outdir)


#--------------Setting file---------
activity_label_file<- read.table("./UCI HAR Dataset/activity_labels.txt")
features_file<- read.table("./UCI HAR Dataset/features.txt")
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_label<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_label<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")

#----------merging data--------------------
merged_data<-rbind(train_data,test_data)
merged_labels<-rbind(train_label,test_label)
merged_subjects<-rbind(train_subject,test_subject)


#----------cleaning and getting required mean and std data-------
col<-grep("mean|std",features_file[,2])
col_names<-grep("mean|std",features_file[,2],value = TRUE)
col_names<-gsub("[()]","",col_names)
merged_data<-merged_data[,col]


#----------matching the activity labels-------------------
matched_label<-activity_label_file[match(merged_labels[[1]],activity_label_file[,1]),2]


#----------getting all data together----------------------
final_data<-cbind(merged_subjects,matched_label,merged_data)
names(final_data)<-c("Subjects","Activities",col_names)

#-------------average of each variable for each activity and each subject-------------
avg_finaldata<-final_data %>% group_by(Subjects,Activities) %>% summarise_all(mean)

#-------------creating a text file for the dataset-----------------
write.table(avg_finaldata,file = "run_analysis.txt",row.names = FALSE)
