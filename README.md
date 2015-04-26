
# Applied Logic for Getting and Cleaning data Course Project

After reading instructions/ requirements and play **a lot** with all files/data set provided, here is the requested description for applied logic and code in run_analysis.R script:
This is a description of all steps to acomplish requested results for Getting and Cleaning data Course from Coursera.

Sequence of action:

1. Reading all input data:
 * Reading train Data
 * Reading activity names and features/Field names for Observations files
 * Naming train and test observations with features/field names
 * Naming subject and activity Columns from additional files
    
2. Merging all test and train data with correspondent activities and subjects
 * Merging/column binding all test and train data, 
 * Then merging/row binding both result tables

3. Applying Activity labels
 * Naming activity label columns (to be used later). Important: first Column name as same as main_table to make possible a Join/Merge.
 * Merging(Joining) Main data with Activity labels by activity (number)
    

4. Tidying main_table: getting only needed columns: mean and std columns coming from grep "mean()" and "std()" from column names

5. Calculating mean values for all mean and std columns by subject and activity

6. Re-merging activity labels and dropping additional/non needed Group Columns

7. Creating/writing a file with analysis_result data frame. File is: **analysis_result.txt**

8. Removing temporal/intermediate step objects results

***
##Directories' Structure for this Project is:

|Dir             |Sub-Dir         |Desc.                      |
|:-------------- |:-------------- |:------------------------- |
|/Work Directory |                |Defined/Configured before execution |
|                |/UCI HAR Dataset|Samsung Data               |
|                |/run_analysis.R |Analysis Script to Test    |
***

The **analysis_result.txt** file should be created/written on **/Work Directory** 


