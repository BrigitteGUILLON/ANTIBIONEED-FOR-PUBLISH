
# Not to be deployed 

library(plyr)
library(xlsx)


setwd(getwd())

# Read an Excel sheet and save it as a .bin 
translationContent <- read.xlsx("Traductions.xlsx", sheetName="Traductions",col.names=1)

translation <- dlply(translationContent ,.(Identifiant), function(s) key = as.list(s))

save(translation, file = "translation.bin")






