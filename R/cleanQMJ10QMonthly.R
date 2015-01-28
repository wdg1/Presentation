#' Reads in, cleans, and subdivides daily QMJ10QMonthly data set in data folder.

cleanQMJ10QMonthly <- function() {

  # Imports 10 quality sorted US portfolios
  setwd(file.path(getwd(), "data"))
  AQRQMJ10QualityLongUS <<- read.xlsx("QMJ10QMonthly.xlsx", "10 Portfolios Formed on Quality",
                                 ,startRow=19, colIndex=c(1:12))
  row.names(AQRQMJ10QualityLongUS) <<- NULL
  names(AQRQMJ10QualityLongUS)[1] <<- "Date"
  AQRQMJ10QualityLongUS[,1] <<- ymd(AQRQMJ10QualityLongUS[,1])

  # Imports 10 quality sorted global portfolios
  AQRQMJ10QualityBroadGlobal <<- read.xlsx("QMJ10QMonthly.xlsx", "10 Portfolios Formed on Quality",
                                 ,startRow=19, colIndex=c(1,13:23))
  row.names(AQRQMJ10QualityBroadGlobal) <<- NULL
  names(AQRQMJ10QualityBroadGlobal)[1] <<- "Date"
  AQRQMJ10QualityBroadGlobal[,1] <<- ymd(AQRQMJ10QualityBroadGlobal[,1])

  setwd("..")

  # Cross-references existing
  setwd("./cleanData")

  if (file.exists("AQRQMJ10QualityLongUS.Rdata")) {
    unlink("AQRQMJ10QualityLongUS.Rdata")
  }
  save(AQRQMJ10QualityLongUS, file="AQRQMJ10QualityLongUS.Rdata")

  if (file.exists("AQRQMJ10QualityBroadGlobal.Rdata")) {
    unlink("AQRQMJ10QualityBroadGlobal.Rdata")
  }
  save(AQRQMJ10QualityBroadGlobal, file="AQRQMJ10QualityBroadGlobal.Rdata")

  setwd("..")

}
