
options(shiny.sanitize.errors = TRUE)

# versionTeaser <- FALSE

Language_c <- "FR"


projectName <-"ANTIBIONEED"
 

# Set tab to T if shown  
presentation = T  
carte =  T
APPLI = T 
ALGO1  = T
ALGO2 = T


TypeAppli <- "TRUE APP"

if (versionDemo==TRUE)  {
  TypeAppli <- "TRAINING"
  Language_c <- "BR"}
 


# versionAppli <- as.character("V14") 
# App : Version -> put  version in comment if new one 
versionAppli <- as.character("V14.1.2")


# Fermer l'application
jscode <- "shinyjs.closeWindow = function() { window.close(); }"

 
print("Config.R done.")



















