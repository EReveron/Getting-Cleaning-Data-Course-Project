# Getting-Cleaning-Data-Course-Project  
This repo contains the information related with the Project assigment for the Getting Cleaning Data Course

In order to redo this work you should copy the following files to the same working directory:
  * 'run_analysis.R' script 
  * 'UCI HAR Dataset' directory 

As an example, assume the my working directory is "d:/Trabajos Coursera/Getting-Cleaning-Data-Course-Project",
so lets change the working directory to that (you should change to the correct one):

  > setwd("d:/Trabajos Coursera/Getting-Cleaning-Data-Course-Project")
    
You should have at least the following files
  > dir()
  
  > [1] "codebook.txt"  "README.md"  "run_analysis.R"  "UCI HAR Dataset"
    
Let's load & run the script, the script is a function that return a data set that have the answer for
questions 5 (check the run_analysis.R file for more details)

  > source("run_analysis.R")

You should have installed the following packages:
  * 'reshape2'  
  * 'data.table' 
  
Finally run the script and assign the return value to a data set (optional)
  > dt <- run_analysis()

When the script finish, you should have a file named 'table.txt' in the working directory with the data set

  > dir()
  
  > [1] "codebook.txt"  "README.md"  "run_analysis.R"  "table.txt"
  
  > [5] "UCI HAR Dataset"
    
 
