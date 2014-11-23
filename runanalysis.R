## Run Analysis
runanalysis <- function() {
  ## Read in test and train data
  file_x_test <- "./data/test/X_test.txt"
  file_y_test <- "./data/test/y_test.txt"
  file_subject_test <- "./data/test/subject_test.txt"
  file_x_train <- "./data/train/X_train.txt"
  file_y_train <- "./data/train/y_train.txt"
  file_subject_train <- "./data/train/subject_train.txt"
  features_names_file <- "./data/features.txt"
  activity_names_file <- "./data/activity_labels.txt"
    
  test_subject_data <- read.table(file_subject_test)
  test_x_data <- read.table(file_x_test)
  test_y_data <- read.table(file_y_test)
  
  train_subject_data <- read.table(file_subject_train)
  train_x_data <- read.table(file_x_train)
  train_y_data <- read.table(file_y_train)
 
  ## Variable labels
  labels_data <- read.table(features_names_file)
  ##print(labels_data[ grep("mean()", labels_data$V2),2])
  ##print(labels_data[grep("std()", labels_data$V2),2])
  
  ## Activity names
  activity_data <- read.table(activity_names_file)
  ##print(activity_data)

  ## Merge Data
  merged_test_data <- cbind(test_subject_data, test_y_data, test_x_data)
  merged_train_data <- cbind(train_subject_data, train_y_data, train_x_data)
  merged_data <- rbind(merged_test_data, merged_train_data)
  
  ##merged_subject_data <- rbind(test_subject_data, train_subject_data) 
  ##merged_y_data <- rbind(test_y_data, train_y_data)
  ##merged_x_data <- rbind(test_x_data, train_x_data)
  ## names(merged_x_data) <- as.character(labels_data$V2)
  ## drop non mean() and non std() columns
  ##merged_data <- cbind(merged_subject_data, merged_y_data, merged_x_data)
  
  names(merged_data) <- c("subject", "activity", as.character(labels_data$V2))
  ##names(merged_data)
  merged_data$activity[merged_data$activity==1] <- "walking" 
  merged_data$activity[merged_data$activity==2] <- "walking upstairs" 
  merged_data$activity[merged_data$activity==3] <- "walking downstairs" 
  merged_data$activity[merged_data$activity==4] <- "sitting" 
  merged_data$activity[merged_data$activity==5] <- "standing"
  merged_data$activity[merged_data$activity==6] <- "laying" 

  ##merged_data$subject <- c("Subject ", as.character(merged_data$subject))
  
  subsetted_data <- merged_data[,(grepl("mean\\(\\)-[XYZ]", names(merged_data)) | grepl("std\\(\\)-[XYZ]", names(merged_data)) | grepl("^subject", names(merged_data)) | grepl("^activity", names(merged_data)))]
  names(subsetted_data) <- gsub("[()]","", names(subsetted_data))
  ##names(subsetted_data) <- tolower(gsub("[-()]","", names(subsetted_data)))
  
  ## subsetted_data[subsetted_data$subject == 1 & subsetted_data$activity == "standing",]
  
  ## aggregate data
  aggregate_data <-aggregate(subsetted_data[,!names(subsetted_data) %in% c("subject", "activity")], by=list(subject=subsetted_data$subject,activity=subsetted_data$activity), FUN=mean)
  str(aggregate_data)
  ## reshape data
  
  
  write.table(aggregate_data, "./tidydata.txt", row.names=FALSE)
  
}