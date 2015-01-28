#' Reads in, cleans, and subdivides FFRMW data set in data folder.

cleanFFRMW <- function() {

  # Imports FFRMW from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFRMW <- read.table("FFRMW.txt", fill=TRUE, skip=19, col.names = colNames,
                      stringsAsFactors=FALSE)
  setwd("..")

  # Divides FFRMW
  FFRMWValWgtMthly <- FFRMW[1:618,]
  FFRMWEqWgtMthly <- FFRMW[622:1239,]
  FFRMWValWgtAnn <- FFRMW[1243:1293,]
  FFRMWEqWgtAnn <- FFRMW[1297:1347,]
  FFRMWNumOfFirms <- FFRMW[1351:1968,]
  FFRMWAvgFirmSize <- FFRMW[1972:2589,]
  FFRMWValWgtAvgInvAnn <- FFRMW[2593:2644,]

  # Cleans data
  cleanSubFF(FFRMWValWgtMthly)
  cleanSubFF(FFRMWEqWgtMthly)
  cleanSubFF(FFRMWValWgtAnn)
  cleanSubFF(FFRMWEqWgtAnn)
  cleanSubFF(FFRMWNumOfFirms, spr=FALSE)
  cleanSubFF(FFRMWAvgFirmSize, spr=FALSE)
  cleanSubFF(FFRMWValWgtAvgInvAnn)

}
