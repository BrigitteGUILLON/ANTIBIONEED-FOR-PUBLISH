
options(shiny.sanitize.errors = TRUE)

versionTEST <- TRUE

versionTeaser <- FALSE

Language_c <- "FR"
 

presentation = T  
carte =  T
APPLI = T 
ALGO1  = T
ALGO2 = T

if (versionDemo==TRUE)  {Language_c <- "BR"}


versionAppli <- as.character("V13")


# Fermer l'application
jscode <- "shinyjs.closeWindow = function() { window.close(); }"


 print("config.R done.")




















