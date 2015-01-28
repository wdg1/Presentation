#' Runs all other functions in the package.

cleanAll <- function() {

  devtools::load_all()

  cleanFFCMA()
  cleanFFHMLDaily()
  cleanFFHMLMonthly()
  cleanFFRMW()
  cleanFFSMBDaily()
  cleanFFSMBMonthly()
  cleanQMJ10QMonthly()
  cleanQMJMonthly()

}
