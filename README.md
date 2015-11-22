---
Title: "README.md"
Author: "Arinze Akutekwe"
Date: "21 November 2015"
Output: html_document
---

### Getting and Cleaning Data Project

This readme file provides explanations on how the run_analysis.R script works and how it is linked to other files.

The script assumes that the user’s working directory is the home directory which was the working directory at the time of analysis. Change as appropriate.

The script creates a “data” directory in the working directory if non exits. The script depends on two packages: the data.table package which was only used to ‘fast read’ in the dataset using the ‘fread’ function; and the dply package which was used to perform other data manipulation operations as explained in the script and in the CodeBook.md file. 

Detailed information are in the CodeBook.md file.
