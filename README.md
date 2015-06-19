# Cleaning-Data-Project

########################Purpose and Background########################################################################

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

Each record contains the following data points:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

#####################################Data Structure and location###############################################
Data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


###############packages######################################################################################
Load package (plyr)

###############run_analysis.R and "output2.txt"#############################################################

The run_analysis.R script takes all the data sets and merges them into a single data set. The data is presented in a summarized result output2.txt. The following data manipulations are conducted to arrive at a summary of the data
    
    a.Merges the training and the test sets to create one data set.
We bind test and train data sets using rbind into one single data set (data)
    
    
    b.Extracts only the measurements on the mean and standard deviation for each measurement. 
We group the data by extracing only the mean and standar deviation using Pattern Matching (grep) where column names includes the terms std and mean.
We create a new data set including all observations (output)
    
    c.Uses descriptive activity names to name the activities in the data set
Data set contains master file (activity_labels) describing activity codes. Script uses this file and replaces codes with descriptive names

 V1                 V2
 1            WALKING
 2   WALKING_UPSTAIRS
 3 WALKING_DOWNSTAIRS
 4            SITTING
 5           STANDING
 6             LAYING


     d.Appropriately labels the data set with descriptive variable names. The following acronomys are replaced with descriptivee labes:
"Acc" with "Accelerometer"
"Gyro"with "Gyroscope"
"BodyBody" with "Body"
"Mag"with "Magnitude"
"^t"with "Time"
"^f"with "Frequency"
"tBody"with "TimeBody"
"-mean()"with "Mean"
"-std()"with "Std Dev"
"-freq()"with "Frequency"
"std"with "Std Dev"

####################Output file (output2.tx)###########################################
Fields in output2.txt:
 [1] "id"                                                
 [2] "activity"                                          
 [3] "TimeBodyAccelerometer.Std Dev...X"                 
 [4] "TimeBodyAccelerometer.Std Dev...Y"                 
 [5] "TimeBodyAccelerometer.Std Dev...Z"                 
 [6] "TimeGravityAccelerometer.Std Dev...X"              
 [7] "TimeGravityAccelerometer.Std Dev...Y"              
 [8] "TimeGravityAccelerometer.Std Dev...Z"              
 [9] "TimeBodyAccelerometerJerk.Std Dev...X"             
[10] "TimeBodyAccelerometerJerk.Std Dev...Y"             
[11] "TimeBodyAccelerometerJerk.Std Dev...Z"             
[12] "TimeBodyGyroscope.Std Dev...X"                     
[13] "TimeBodyGyroscope.Std Dev...Y"                     
[14] "TimeBodyGyroscope.Std Dev...Z"                     
[15] "TimeBodyGyroscopeJerk.Std Dev...X"                 
[16] "TimeBodyGyroscopeJerk.Std Dev...Y"                 
[17] "TimeBodyGyroscopeJerk.Std Dev...Z"                 
[18] "TimeBodyAccelerometerMagnitude.Std Dev.."          
[19] "TimeGravityAccelerometerMagnitude.Std Dev.."       
[20] "TimeBodyAccelerometerJerkMagnitude.Std Dev.."      
[21] "TimeBodyGyroscopeMagnitude.Std Dev.."              
[22] "TimeBodyGyroscopeJerkMagnitude.Std Dev.."          
[23] "FrequencyBodyAccelerometer.Std Dev...X"            
[24] "FrequencyBodyAccelerometer.Std Dev...Y"            
[25] "FrequencyBodyAccelerometer.Std Dev...Z"            
[26] "FrequencyBodyAccelerometerJerk.Std Dev...X"        
[27] "FrequencyBodyAccelerometerJerk.Std Dev...Y"        
[28] "FrequencyBodyAccelerometerJerk.Std Dev...Z"        
[29] "FrequencyBodyGyroscope.Std Dev...X"                
[30] "FrequencyBodyGyroscope.Std Dev...Y"                
[31] "FrequencyBodyGyroscope.Std Dev...Z"                
[32] "FrequencyBodyAccelerometerMagnitude.Std Dev.."     
[33] "FrequencyBodyAccelerometerJerkMagnitude.Std Dev.." 
[34] "FrequencyBodyGyroscopeMagnitude.Std Dev.."         
[35] "FrequencyBodyGyroscopeJerkMagnitude.Std Dev.."     
[36] "TimeBodyAccelerometer.mean...X"                    
[37] "TimeBodyAccelerometer.mean...Y"                    
[38] "TimeBodyAccelerometer.mean...Z"                    
[39] "TimeGravityAccelerometer.mean...X"                 
[40] "TimeGravityAccelerometer.mean...Y"                 
[41] "TimeGravityAccelerometer.mean...Z"                 
[42] "TimeBodyAccelerometerJerk.mean...X"                
[43] "TimeBodyAccelerometerJerk.mean...Y"                
[44] "TimeBodyAccelerometerJerk.mean...Z"                
[45] "TimeBodyGyroscope.mean...X"                        
[46] "TimeBodyGyroscope.mean...Y"                        
[47] "TimeBodyGyroscope.mean...Z"                        
[48] "TimeBodyGyroscopeJerk.mean...X"                    
[49] "TimeBodyGyroscopeJerk.mean...Y"                    
[50] "TimeBodyGyroscopeJerk.mean...Z"                    
[51] "TimeBodyAccelerometerMagnitude.mean.."             
[52] "TimeGravityAccelerometerMagnitude.mean.."          
[53] "TimeBodyAccelerometerJerkMagnitude.mean.."         
[54] "TimeBodyGyroscopeMagnitude.mean.."                 
[55] "TimeBodyGyroscopeJerkMagnitude.mean.."             
[56] "FrequencyBodyAccelerometer.mean...X"               
[57] "FrequencyBodyAccelerometer.mean...Y"               
[58] "FrequencyBodyAccelerometer.mean...Z"               
[59] "FrequencyBodyAccelerometer.meanFreq...X"           
[60] "FrequencyBodyAccelerometer.meanFreq...Y"           
[61] "FrequencyBodyAccelerometer.meanFreq...Z"           
[62] "FrequencyBodyAccelerometerJerk.mean...X"           
[63] "FrequencyBodyAccelerometerJerk.mean...Y"           
[64] "FrequencyBodyAccelerometerJerk.mean...Z"           
[65] "FrequencyBodyAccelerometerJerk.meanFreq...X"       
[66] "FrequencyBodyAccelerometerJerk.meanFreq...Y"       
[67] "FrequencyBodyAccelerometerJerk.meanFreq...Z"       
[68] "FrequencyBodyGyroscope.mean...X"                   
[69] "FrequencyBodyGyroscope.mean...Y"                   
[70] "FrequencyBodyGyroscope.mean...Z"                   
[71] "FrequencyBodyGyroscope.meanFreq...X"               
[72] "FrequencyBodyGyroscope.meanFreq...Y"               
[73] "FrequencyBodyGyroscope.meanFreq...Z"               
[74] "FrequencyBodyAccelerometerMagnitude.mean.."        
[75] "FrequencyBodyAccelerometerMagnitude.meanFreq.."    
[76] "FrequencyBodyAccelerometerJerkMagnitude.mean.."    
[77] "FrequencyBodyAccelerometerJerkMagnitude.meanFreq.."
[78] "FrequencyBodyGyroscopeMagnitude.mean.."            
[79] "FrequencyBodyGyroscopeMagnitude.meanFreq.."        
[80] "FrequencyBodyGyroscopeJerkMagnitude.mean.."        
[81] "FrequencyBodyGyroscopeJerkMagnitude.meanFreq.." 
