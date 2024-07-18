# qview
A repository for my R package "qview" (quick view). This repository contains the package, an explanation of the functionality of the package, some examples and a detailed description of all the functions and packages it contains. 



## Introduction

The `qview` package provides functions for summarizing and visualizing data frames.
The idea is to get a quick view on a given dataset to obtain an initial, rough overview for further analysis.
It includes the following functions:

- `summarize_data`: Summarizes numeric columns in a data frame.
- `plot_distribution`: Creates histograms and box plots for numeric columns.
- `qview`: Provides both summary-statistics and distribution plots for a data frame.



## Installation

To install the `qview` package from GitHub, use the following commands:

```r
install.packages("remotes")                     ## install remotes to get git content
remotes::install_github("LukasAldini/qview")    ## get the package via github
´´´´ 



## Use of the package & some examples

Choose a data frame (for example: "mtcars"): to then get a quick view of the data use qview as shown below:

´´´r
library("qview")          ## load the package
data(mtcars)              ## choose the dataset
result <- qview(mtcars)   ## define an object and use qview on the data frame
print(result$summar)      ## show the summary-statistics of the data frame´s numeric columns (mean,median, min & max and sd)
print(result)             ## get a histogramm and a boxplot of all numeric columns of the given dataset
´´´


## Written by: Lukas Aldini
## Contact: lukasladini@gmail.com 
