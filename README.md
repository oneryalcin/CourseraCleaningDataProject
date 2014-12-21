Getting and Cleaning Data Project 
==================

This guthub repository is created to present findings for the class project of Getting an Cleaning Data. 

There are 4 files in this repository:

- Readme.md : This is the file youa re reading and describing all other remaining files.
- CodeBook.md : This file defines all the valiables (columns) in the 'tidy_data_final.txt' file.
- tidy_data_final.txt : This is the final data set we get after cleaning the inital data set.
- run_analysis.R : This is the R file does all thge hardwork and creates the 'tidy_data_final.txt' file at the end


To summarize what 'run_analysis.R' does:


- It imports data sets, activity data, and subjects data, under the folders training and test.(X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt)
- It adds activity data (y_train.txt, y_test.txt) and subjects data (subject_train.txt, subject_test.txt) to the data set X_train.txt and X_test.txt
- It merges (row bind) two datasets X_train.txt and X_test.txt
- Reads 'features.txt' and adds this as the header to the merged set. Also adds two more headers 'Subject' and 'ActLabel'
- Filters only the columns include string 'mean' , 'std', 'ActLabel' or 'Subject'  and set to sdata (selected data)
- Change the numbers in ActLabel column with meaningful words such as WALKING, LAYING.. etc
- It groups the data according to the subject and activities and calculate averages.
- Creates the tidy data and writes back it to the destination.

For further explanation check 'run_analysis.R' file and 'CodeBook.md' for the description of columns in the final tidy dataset. 
