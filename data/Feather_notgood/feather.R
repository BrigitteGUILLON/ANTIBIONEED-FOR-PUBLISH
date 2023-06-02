
library(feather)
library(xlsx)
FeatherDir  <-   paste0("Feather/")
labaseData <- paste0("data/")

ServeurDir  <- paste0("SV/")
labaseTT <- "TT/"




Listecentres <-  read.xlsx(paste0(labaseData,"liste_centres_modif.xlsx"),sheetName= "CENTRES")


write_feather(Listecentres,paste0(FeatherDir,"Centres.feather"))


centres <- read_feather(paste0(FeatherDir,"Centres.feather"))
centres$lat <- as.numeric(centres$lat)
centres$long <- as.numeric(centres$long)


# 
# 
# # mise à zéro une fois au démarrage et vider les répertoires de sauvegardes des fichier 
# Listecodes <-  read.xlsx(paste0(labaseData,"PDFCODE.xlsx"),sheetName= "CODES")
# write_feather(Listecodes,paste0(FeatherDir,"PDFCODE.feather"))



visibilite <-  read_feather(paste0(FeatherDir,"Rando.feather")) 

# 
visibiliteDev <-  read.xlsx(paste0(labaseData,"VISIBILITE.xlsx"),sheetName="RANDOMISATION")
write_feather(visibiliteDev ,paste0(FeatherDir,"RandoDev.feather")) 

write_feather(read.xlsx(paste0(labaseTT,"res2.xlsx"),sheetName ="ATB") ,paste0(FeatherDir,"ATB.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res2.xlsx"),sheetName ="ATB-DEMO") ,paste0(FeatherDir,"ATB-DEMO.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1",row.names=1,col.names=1),paste0(FeatherDir,"TT.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Box1"),paste0(FeatherDir,"B1.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Box2"),paste0(FeatherDir,"B2.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Box3"),paste0(FeatherDir,"B3.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Box4"),paste0(FeatherDir,"B4.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Box5"),paste0(FeatherDir,"B5.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName  ="ALGO1_Reco"),paste0(FeatherDir,"BR.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res2.xlsx"),sheetName  ="ALGO2-MATRICE") ,paste0(FeatherDir,"readDES.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res2.xlsx"),sheetName ="ALGO2-MICRO") ,paste0(FeatherDir,"TTMicro.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res2.xlsx"),sheetName ="ALGO2-MICRO2") ,paste0(FeatherDir,"TTMicro2.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName ="ALGO2"),paste0(FeatherDir,"ALGO2.feather"))

write_feather(read.xlsx(paste0(labaseTT,"res.xlsx"),sheetName ="RECOCOND"),paste0(FeatherDir,"RECOCOND.feather"))
# 
# lecture feather du serveur 



# 
# ListecodesServeurLoc  <-    read_feather(paste0(FeatherDir,"PDFCODE.feather"))
# # View(ListecodesServeurLoc) 
# 
# 
# 
# 
# 
# ListecodesServeur  <-    read_feather(paste0(ServeurDir,"PDFCODE.feather"))
#  




# 
# readTTMicro2 <- function () {read_xlsx(ficalire2,sheet ="ALGO2-MICRO2")}