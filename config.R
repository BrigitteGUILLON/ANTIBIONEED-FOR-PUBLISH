
options(shiny.sanitize.errors = TRUE)

# versionTeaser <- FALSE

Language_c <- "FR"
 

presentation = T  
carte =  T
APPLI = T 
ALGO1  = T
ALGO2 = T

if (versionDemo==TRUE)  {Language_c <- "BR"}


# versionAppli <- as.character("V14")
# Changement de versiond application , changement de la liste de randomisation 
versionAppli <- as.character("V14.1.1")


# Fermer l'application
jscode <- "shinyjs.closeWindow = function() { window.close(); }"

 
print("Config.R done.")



















