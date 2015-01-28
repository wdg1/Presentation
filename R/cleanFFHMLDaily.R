#' Reads in, cleans, and subdivides daily FFHML data set in data folder.

cleanFFHMLDaily <- function() {

  # Imports FFHMLDaily from data folder
  setwd(file.path(getwd(), "data"))
  colNames = c("Date", "<=0", "Lo30", "Med40", "Hi30", "Lo20", "Qnt2", "Qnt3", "Qnt4",
               "Hi20", "Lo10", "Dec2", "Dec3", "Dec4", "Dec5", "Dec6",
               "Dec7", "Dec8", "Dec9", "Hi10")
  FFHMLDaily <- read.table("FFHMLDaily.txt", fill=TRUE, skip=24, col.names = colNames,
                            stringsAsFactors=FALSE)
  FFHMLDaily <- FFHMLDaily[,c(1,3:length(FFHMLDaily))]
  setwd("..")

  # Divides FFHMLDaily
  FFHMLValWgtDly <- FFHMLDaily[1:23385,]
  FFHMLEqWgtDly <- FFHMLDaily[23389:46773,]

  # Cleans data
  cleanSubFF(FFHMLValWgtDly)
  cleanSubFF(FFHMLEqWgtDly)

}
