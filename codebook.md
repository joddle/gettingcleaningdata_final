The Code Book 
=================

Info about variables:

The final tidy data set has the following variables with units indicated in []:
[g] means standard gravity units which equals [-9.8 meters/second^2]
"subject and activity" [no units]
"mean of time body acceleration mean in the x direction" [g]
"mean of time body acceleration mean in the y direction" [g]
"mean of time body acceleration mean in the z direction" [g]
"mean of time body acceleration std in the x direction" [g]
"mean of time body acceleration std in the y direction" [g] 
"mean of time body acceleration std in the z direction" [g] 
"mean of time gravity acceleration mean in the x direction" [g]
"mean of time gravity acceleration mean in the y direction" [g]
"mean of time gravity acceleration mean in the z direction" [g]
"mean of time gravity acceleration std in the x direction" [g]
"mean of time gravity acceleration std in the y direction" [g]
"mean of time gravity acceleration std in the z direction" [g]
"mean of time body acceleration jerk mean in the x direction" [g]
"mean of time body acceleration jerk mean in the y direction" [g]
"mean of time body acceleration jerk mean in the z direction" [g]
"mean of time body acceleration jerk std in the x direction" [g]
"mean of time body acceleration jerk std in the y direction" [g]
"mean of time body acceleration jerk std in the z direction" [g]
"mean of time body gyroscope mean in the x direction" [radians/second]
"mean of time body gyroscope mean in the y direction" [radians/second]
"mean of time body gyroscope mean in the z direction" [radians/second]
"mean of time body gyroscope std in the x direction" [radians/second]
"mean of time body gyroscope std in the y direction" [radians/second]
"mean of time body gyroscope std in the z direction" [radians/second]
"mean of time body gyroscope jerk mean in the x direction" [radians/second]
"mean of time body gyroscope jerk mean in the y direction" [radians/second]
"mean of time body gyroscope jerk mean in the z direction" [radians/second]
"mean of time body gyroscope jerk std in the x direction" [radians/second]
"mean of time body gyroscope jerk std in the y direction" [radians/second]
"mean of time body gyroscope jerk std in the z direction" [radians/second]
"mean of time body acceleration magnitude mean" [g]
"mean of time body acceleration magnitude std" [g]
"mean of time gravity acceleration magnitude mean" [g]
"mean of time gravity acceleration magnitude std" [g]
"mean of time body acceleration jerk magnitude mean" [g]
"mean of time body acceleration jerk magnitude std" [g]
"mean of time body gyroscope magnitude mean" [radians/second]
"mean of time body gyroscope magnitude std" [radians/second]
"mean of time body gyroscope jerk magnitude mean" [radians/second]
"mean of time body gyroscope jerk magnitude std" [radians/second]
"mean of frequency body acceleration mean in the x direction" [g]
"mean of frequency body acceleration mean in the y direction" [g]
"mean of frequency body acceleration mean in the z direction" [g]
"mean of frequency body acceleration std in the x direction" [g]
"mean of frequency body acceleration std in the y direction" [g]
"mean of frequency body acceleration std in the z direction" [g]
"mean of frequency body acceleration jerk mean in the x direction" [g]
"mean of frequency body acceleration jerk mean in the y direction" [g]
"mean of frequency body acceleration jerk mean in the z direction" [g]
"mean of frequency body acceleration jerk std in the x direction" [g]
"mean of frequency body acceleration jerk std in the y direction" [g]
"mean of frequency body acceleration jerk std in the z direction" [g]
"mean of frequency body gyroscope mean in the x direction" [radians/second]
"mean of frequency body gyroscope mean in the y direction" [radians/second]
"mean of frequency body gyroscope mean in the z direction" [radians/second]
"mean of frequency body gyroscope std in the x direction" [radians/second]
"mean of frequency body gyroscope std in the y direction" [radians/second]
"mean of frequency body gyroscope std in the z direction" [radians/second]
"mean of frequency body acceleration magnitude mean" [g]
"mean of frequency body acceleration magnitude std" [g]
"mean of frequency body body acceleration jerk magnitude mean" [g]
"mean of frequency body body acceleration jerk magnitude std" [g]
"mean of frequency body body gyroscope magnitude mean" [radians/second]
"mean of frequency body body gyroscope magnitude std" [radians/second]
"mean of frequency body body gyroscope jerk magnitude mean" [radians/second]
"mean of frequency body body gyroscope jerk magnitude std"[radians/second]

Info about summary choices:
1. Merging the training and test data sets: 
Individual tidy data sets for the training and test data were created by
column-binding together the list of subject [1-30], activity [1-6], 
and raw data (numerical observations) from the 561 variables. 
The row-binding was used to combine the training and test data into one data set.
The data set was made into a data frame to 
2. Extracting only the mean and standard deviation for each measurement:
To extract only measurements related to mean or standard deviation, 
searches for "mean()" or "std()" were performed, and all other variable names
were eliminated
3. Using descriptive activity names to name the activities:
The activities were renamed from categorical numbers to descriptive names:
1 = walking
2 = walking upstairs
3 = walking downstairs
4 = sitting
5 = standing
6 = laying
4. Naming the data set variable names:
To make the variable names (column names) more readable, special characters were eliminated, 
and the variable names were made more descriptive by writing out all abbreviations as needed 
as well as making everything lowercase.  
5. Creating a new, independent tidy data set with mean for each subject and activity:
Subject and activity were merged to create a unified factor variable, "subject activity"
then the means were calculated for each of the remaining columns by the 
individual factors from the "subject activity" column. Then the final text file
without row names was created using the write.table() function.

The text file is uploaded separately and submitted through coursera. 