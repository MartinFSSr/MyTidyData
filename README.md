MyTidyData
==========

Data Science Finding Data Course Project

run_analysis.R reads several data sets downloaded in a Zip file from the Human Acitvity Recognition project site at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The Zipped data file containing all data is at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R script was developed based on documentation and data files downloaded on 9/20/2014.

To replicate the output dataset, set the working directory to the top-level directory of the un-Zipped download file. The script looks for some small files in this directory, and for the main and other data files in the /test and /train subdirectories created when the download is un-Zipped. 

Output of the run_analysis(WRITE=F) function is a data frame, and, if WRITE=T is specified, a .txt file in the working directory.



