#' Reads in, cleans, and subdivides FFCMA data set located in data folder.

cleanFFCMA <- function() {

  # Imports FFCMA from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFCMA <- read.table("FFCMA.txt", fill=TRUE, skip=18, col.names = colNames,
                      stringsAsFactors=FALSE)
  setwd("..")

  # Divides FFCMA
  FFCMAValWgtMthly <- FFCMA[1:618,]
  FFCMAEqWgtMthly <- FFCMA[622:1239,]
  FFCMAValWgtAnn <- FFCMA[1243:1293,]
  FFCMAEqWgtAnn <- FFCMA[1297:1347,]
  FFCMANumOfFirms <- FFCMA[1351:1968,]
  FFCMAAvgFirmSize <- FFCMA[1972:2589,]
  FFCMAValWgtAvgInvAnn <- FFCMA[2593:2644,]

  # Cleans data
  cleanSubFF(FFCMAValWgtMthly)
  cleanSubFF(FFCMAEqWgtMthly)
  cleanSubFF(FFCMAValWgtAnn)
  cleanSubFF(FFCMAEqWgtAnn)
  cleanSubFF(FFCMANumOfFirms, spr=FALSE)
  cleanSubFF(FFCMAAvgFirmSize, spr=FALSE)
  cleanSubFF(FFCMAValWgtAvgInvAnn)

}
