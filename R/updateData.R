#' Updates all raw data sets in data and calls cleanAll() if clean is true.
#'
#' @param clean Cleans updated data by default.

updateData <- function(clean=TRUE) {

  # Navigates to data directory
  if (!file.exists("data")){
    dir.create(file.path(getwd(), "data"))
  }
  setwd(file.path(getwd(), "data"))

  # Following code downloads all relevant data sources

  # Checks if FFCMA already exist then downloads
  if (file.exists("FFCMA.txt")) {
    unlink("FFCMA.txt")
  }
  FFCMA <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_INV.zip"
  temp <- tempfile()
  download.file(FFCMA, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_INV.txt", "FFCMA.txt")
  unlink(temp)

  # Checks if FFHMLDaily already exist then downloads
  if (file.exists("FFHMLDaily.txt")) {
    unlink("FFHMLDaily.txt")
  }
  FFHMLDaily <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_BE-ME_Daily.zip"
  temp <- tempfile()
  download.file(FFHMLDaily, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_BE-ME_Daily.txt", "FFHMLDaily.txt")
  unlink(temp)

  # Checks if FFHMLMonthly already exist then downloads
  if (file.exists("FFHMLMonthly.txt")) {
    unlink("FFHMLMonthly.txt")
  }
  FFHMLMonthly <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_BE-ME.zip"
  temp <- tempfile()
  download.file(FFHMLMonthly, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_BE-ME.txt", "FFHMLMonthly.txt")
  unlink(temp)

  # Checks if FFRMW already exist then downloads
  if (file.exists("FFRMW.txt")) {
    unlink("FFRMW.txt")
  }
  FFRMW <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_OP.zip"
  temp <- tempfile()
  download.file(FFRMW, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_OP.txt", "FFRMW.txt")
  unlink(temp)

  # Checks if FFSMBDaily already exist then downloads
  if (file.exists("FFSMBDaily.txt")) {
    unlink("FFSMBDaily.txt")
  }
  FFSMBDaily <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_ME_Daily.zip"
  temp <- tempfile()
  download.file(FFSMBDaily, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_ME_daily.txt", "FFSMBDaily.txt")
  unlink(temp)

  # Checks if FFSMBMonthly already exist then downloads
  if (file.exists("FFSMBMonthly.txt")) {
    unlink("FFSMBMonthly.txt")
  }
  FFSMBMonthly <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Portfolios_Formed_on_ME.zip"
  temp <- tempfile()
  download.file(FFSMBMonthly, temp)
  unzip(temp)
  file.rename("Portfolios_Formed_on_ME.txt", "FFSMBMonthly.txt")
  unlink(temp)

  # Checks if QMJ10QMonthly already exist then downloads
  if (file.exists("QMJ10QMonthly.xlsx")) {
    unlink("QMJ10QMonthly.xlsx")
  }
  QMJ10QMonthly <- "https://www.aqr.com/~/media/files/data-sets/quality-minus-junk-10-qualitysorted-portfolios-monthly.xlsx"
  download.file(QMJ10QMonthly, "QMJ10QMonthly.xlsx", method = "curl")

  # Checks if QMJMonthly already exist then downloads
  if (file.exists("QMJMonthly.xlsx")) {
    unlink("QMJMonthly.xlsx")
  }
  QMJMonthly <- "https://www.aqr.com/~/media/files/data-sets/quality-minus-junk-factors-monthly.xlsx"
  download.file(QMJMonthly, "QMJMonthly.xlsx", method = "curl")

  # Checks if QMJDaily already exist then downloads
  if (file.exists("QMJDaily.xlsx")) {
    unlink("QMJDaily.xlsx")
  }
  # QMJDaily <- "https://www.aqr.com/~/media/files/data-sets/quality-minus-junk-factors-daily.xlsx"
  # download.file(QMJDaily, "QMJDaily.xlsx", method = "curl")

  # Resets working directory
  setwd("..")

  # Cleans data sets
  if (clean == TRUE) {
    source("./R/cleanAll.R")
    cleanAll()
  }

}
