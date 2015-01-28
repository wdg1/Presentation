#' FFAQR: A package for merging and cleaning the enclosed FF and AQR datasets. \cr
#'
#' @section Useful Functions:
#'
#' updataData(clean=TRUE) - Updates and cleans all data (if variable clean=TRUE or omitted), exports results to global environment. \cr
#' \cr
#' cleanAll() - Cleans all data, exporting to global environment. \cr
#'
#' @section FF Processing Functions:
#'
#' cleanFFCMA() \cr
#' cleanFFHMLDaily() \cr
#' cleanFFHMLMonthly() \cr
#' cleanFFRMW() \cr
#' cleanFFSMBDaily() \cr
#' cleanFFSMBMonthly() \cr
#' cleanSubFF(data, spr=TRUE) \cr
#' numValues(data) \cr
#'
#' @section QMJ Processing Functions:
#'
#' cleanQMJ10QMonthly() \cr
#' cleanQMJMonthly() \cr
#'
#' @section Package Use:
#'
#' The package can be initiated in two ways. The cleanAll() function will clean the data sets already included with the package and will subsequently present the results in the global environment. Alternatively, for those who want updated information, updateData() will pull the newest version of the data from AQR's and Kenneth French's respective websites and clean it. \cr
#' \cr
#' Please note that this package will create and manipulate directories within the project directory. It will add and update data in a folder aptly named "data", and may create a new folder named "cleanData". \cr
#'
#' @section Troubleshooting:
#'
#' Unable to set working directory? - Some functions make use of moving into subdirectories before moving back out into the working directory, please make sure that the project folder is set as the folder directory before attempting to clean or download data. \cr
#' \cr
#' Unable to import AQR data? - If you cannot run read.xlsx() on the daily AQR data, you need to allocate more memory to your Java heap (see Java's Xmx setting). \cr
#'
#' @docType package
#' @name FFAQR
NULL
