Project on Getting and Cleaning Data : Courseera
======================

This repo contains the following files
-------------------------
###  * Readme.md 
    It contains information about the files in this repository and the steps to run R script
    
###  * Codebook.md
    It is codebook which describes the variables, data, assumptions, files and the operations         
    which are done to get the final processed,cleaned and tidy data.
    
###  * run_analysis.R
    It is a R script to get tidy data set from the raw data.Codebook for this is Codebook.md.
    Data used for this script is getdata-projectfiles-UCI HAR Dataset.zip
    
###  * getdata-projectfiles-UCI HAR Dataset.zip
    compressed data set of the project.Source of this dataset is 
      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

How to use run_analysis R Script
-------------------------
  * You first need to install R and the basic packages of R
  * You need to download data for the project which is available at 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    The original source for the data which contains full description of the data is present at
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  * Unzip the folder and place the UCI data folder into your current working dircetory which                   
    can be found using getwd() through R console.
  * Download the file run_analysis.R from the repository and placed it in your working       
    directory of R. This is the same location where we have placed the extracted data set.
  * Run the r script. This will generate one Assignment_DataandCleaning.txt file in the 
    current working directory which is the final processed data and can be used for further  
    analysis.


