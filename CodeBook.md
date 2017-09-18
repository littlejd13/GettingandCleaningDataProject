Getting and Cleaning Data Course Project-CodeBook

Data Source: 

Download the data from the following link: Please note that this date is the "Human Activity Recognition Using Smartphones Data Set"
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data is obtained from this primary site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Concerning the R Script:

Open the file with the R Code title "run_analysis.R" and perform the steps in the order in which you see them. Please note that code should be run incrementally to avoid errors. 

Please note that running this script requires the "Plyr" package from the R library. 

Step 1:The initial code downloads and unzips the data. Note: You must download the data and unzip it for this function to work.

Step 2: the code section labelled as "Reading the tables labelled Training"

Step 3: the code section labelled as "Reading the tables laeblled Testing"

Step 4: the code section labelled "Read the vector"

Step 5: the code section labelled "Assigns column names"

Step 6: the code section labelled "Merges data in one primary set"

Step 7: the code section labelled "Extracts mean and standard dev. for measurements"

Step 8: the code section labelled "Establishes the secondary data set" please note that this is labelled twoTidyData.txt

Variables:

-x_train, y_train, x_test, y_test, subject_train and subject_test encompass the data from the downloaded materials (the source data itself)
-x_data, y_data and subject_data merge the aforementioned datasets so that the subsequent analysis is undertaken 
