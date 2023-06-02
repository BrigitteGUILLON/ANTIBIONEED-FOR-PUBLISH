
options(shiny.sanitize.errors = TRUE)


# parameter for version fro training or true version 

versionTEST <- TRUE

versionTeaser <- FALSE

# choice of the language 
# By default is french 


Language_c <- "FR"
 
# tab initialisation , if T -> the tab will be availabale , if F -> the tabs will not be available 
presentation = T  
carte =  T
APPLI = T 
ALGO1  = T
ALGO2 = T

# Version demo is blurred even the text in the app 

if (versionDemo==TRUE)  {Language_c <- "BR"}


versionAppli <- as.character("V13")


# Fermer l'application
jscode <- "shinyjs.closeWindow = function() { window.close(); }"


 print("config.R done.")




















