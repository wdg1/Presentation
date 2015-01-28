#' Reads in, cleans, and subdivides daily FFSMB data set in data folder.

cleanFFSMBDaily <- function() {

  # Imports FFSMBDaily from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "<=0", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFSMBDaily <- read.table("FFSMBDaily.txt", fill=TRUE, skip=13, col.names = colNames,
                             stringsAsFactors=FALSE)
  FFSMBDaily <- FFSMBDaily[,c(1,3:length(FFSMBDaily))]
  setwd("..")

  # Divides FFSMBDaily
  FFSMBValWgtDly <- FFSMBDaily[1:23385,]
  FFSMBEqWgtDly <- FFSMBDaily[23389:46773,]

  # Cleans data
  cleanSubFF(FFSMBValWgtDly)
  cleanSubFF(FFSMBEqWgtDly)

}
