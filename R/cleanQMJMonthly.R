#' Reads in, cleans, and subdivides monthly QMJ data set in data folder.

cleanQMJMonthly <- function() {

  # Imports QMJ data
  setwd(file.path(getwd(), "data"))
  AQRQMJFactorsMonthly <<- read.xlsx("QMJMonthly.xlsx", "QMJ Factors", startRow=19, colIndex=c(1:30))
  row.names(AQRQMJFactorsMonthly) <<- NULL
  names(AQRQMJFactorsMonthly)[1] <<- "Date"
  AQRQMJFactorsMonthly[,1] <<- ymd(AQRQMJFactorsMonthly[,1])

  # Imports market return data
  AQRMKTMonthly <<- read.xlsx("QMJMonthly.xlsx", "MKT", startRow=19, colIndex=c(1:30))
  row.names(AQRMKTMonthly) <<- NULL
  names(AQRMKTMonthly)[1] <<- "Date"
  AQRMKTMonthly[,1] <<- ymd(AQRMKTMonthly[,1])

  # Imports monthly SMB data
  AQRSMBMonthly <<- read.xlsx("QMJMonthly.xlsx", "SMB", startRow=19, colIndex=c(1:30))
  row.names(AQRSMBMonthly) <<- NULL
  names(AQRSMBMonthly)[1] <<- "Date"
  AQRSMBMonthly[,1] <<- ymd(AQRSMBMonthly[,1])

  # Imports monthly HML data
  AQRHMLMonthly <<- read.xlsx("QMJMonthly.xlsx", "HML FF", startRow=19, colIndex=c(1:30))
  row.names(AQRHMLMonthly) <<- NULL
  names(AQRHMLMonthly)[1] <<- "Date"
  AQRHMLMonthly[,1] <<- ymd(AQRHMLMonthly[,1])

  # Imports monthly UMD data
  AQRUMDMonthly <<- read.xlsx("QMJMonthly.xlsx", "UMD", startRow=19, colIndex=c(1:30))
  row.names(AQRUMDMonthly) <<- NULL
  names(AQRUMDMonthly)[1] <<- "Date"
  AQRUMDMonthly[,1] <<- ymd(AQRUMDMonthly[,1])

  # Imports monthly risk free rate data
  AQRRF <<- read.xlsx("QMJMonthly.xlsx", "RF", startRow=19, colIndex=c(1:2))
  row.names(AQRRF) <<- NULL
  names(AQRRF)[1] <<- "Date"
  AQRRF[,1] <<- ymd(AQRRF[,1])

  setwd("..")

  # Cross-references existing
  setwd("./cleanData")

  if (file.exists("AQRQMJFactorsMonthly.Rdata")) {
    unlink("AQRQMJFactorsMonthly.Rdata")
  }
  save(AQRQMJFactorsMonthly, file="AQRQMJFactorsMonthly.Rdata")

  if (file.exists("AQRMKTMonthly.Rdata")) {
    unlink("AQRMKTMonthly.Rdata")
  }
  save(AQRMKTMonthly, file="AQRMKTMonthly.Rdata")

  if (file.exists("AQRSMBMonthly.Rdata")) {
    unlink("AQRSMBMonthly.Rdata")
  }
  save(AQRSMBMonthly, file="AQRSMBMonthly.Rdata")

  if (file.exists("AQRHMLMonthly.Rdata")) {
    unlink("AQRHMLMonthly.Rdata")
  }
  save(AQRHMLMonthly, file="AQRHMLMonthly.Rdata")

  if (file.exists("AQRUMDMonthly.Rdata")) {
    unlink("AQRUMDMonthly.Rdata")
  }
  save(AQRUMDMonthly, file="AQRUMDMonthly.Rdata")

  if (file.exists("AQRRF.Rdata")) {
    unlink("AQRRF.Rdata")
  }
  save(AQRRF, file="AQRRF.Rdata")

  setwd("..")

}
