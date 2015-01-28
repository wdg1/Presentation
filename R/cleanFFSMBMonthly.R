#' Reads in, cleans, and subdivides monthly FFSMB data set in data folder.

cleanFFSMBMonthly <- function() {

  # Imports FFSMBMonthly from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "<=0", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFSMBMonthly <- read.table("FFSMBMonthly.txt", fill=TRUE, skip=13, col.names = colNames,
                      stringsAsFactors=FALSE)
  FFSMBMonthly <- FFSMBMonthly[,c(1,3:length(FFSMBMonthly))]
  setwd("..")

  # Divides FFSMBMonthly
  FFSMBValWgtMthly <- FFSMBMonthly[1:1062,]
  FFSMBEqWgtMthly <- FFSMBMonthly[1066:2127,]
  FFSMBValWgtAnn <- FFSMBMonthly[2131:2218,]
  FFSMBEqWgtAnn <- FFSMBMonthly[2222:2309,]
  FFSMBNumOfFirms <- FFSMBMonthly[2313:3374,]
  FFSMBAvgFirmSize <- FFSMBMonthly[3378:4439,]

  # Cleans data
  cleanSubFF(FFSMBValWgtMthly)
  cleanSubFF(FFSMBEqWgtMthly)
  cleanSubFF(FFSMBValWgtAnn)
  cleanSubFF(FFSMBEqWgtAnn)
  cleanSubFF(FFSMBNumOfFirms, spr=FALSE)
  cleanSubFF(FFSMBAvgFirmSize, spr=FALSE)

}
