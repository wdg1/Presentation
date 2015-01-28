#' Reads in, cleans, and subdivides monthly FFHML data set in data folder.

cleanFFHMLMonthly <- function() {

  # Imports FFHMLMonthly from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "<=0", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFHMLMonthly <- read.table("FFHMLMonthly.txt", fill=TRUE, skip=24, col.names = colNames,
                              stringsAsFactors=FALSE)
  FFHMLMonthly <- FFHMLMonthly[,c(1,3:length(FFHMLMonthly))]
  setwd("..")

  # Divides FFSMBMonthly
  FFHMLValWgtMthly <- FFHMLMonthly[1:1062,]
  FFHMLEqWgtMthly <- FFHMLMonthly[1066:2127,]
  FFHMLValWgtAnn <- FFHMLMonthly[2131:2218,]
  FFHMLEqWgtAnn <- FFHMLMonthly[2222:2309,]
  FFHMLNumOfFirms <- FFHMLMonthly[2313:3374,]
  FFHMLAvgFirmSize <- FFHMLMonthly[3378:4439,]

  # Cleans data
  cleanSubFF(FFHMLValWgtMthly)
  cleanSubFF(FFHMLEqWgtMthly)
  cleanSubFF(FFHMLValWgtAnn)
  cleanSubFF(FFHMLEqWgtAnn)
  cleanSubFF(FFHMLNumOfFirms, spr=FALSE)
  cleanSubFF(FFHMLAvgFirmSize, spr=FALSE)

}
