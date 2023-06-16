library(data.table)
library(DT)

library(plyr)
library(dplyr)
library(dygraphs)
library(feather)


library(fs)
library(formattable)
library(ggiraph)
library(gfonts)
library(ggplot2) 
library(ggrepel)
library(gridExtra)
library(gridtext)
library(httpuv)

library(kableExtra)
library(knitr)
 


# # library(rJava)
library(leaflet)

library(linne)
library(lubridate)
library(plotly)

library(profvis)

library(rmarkdown)
# suppressWarnings(library(showtext))
library(readr)
library(readxl)
 

library(shiny)

library(shinyalert)
library(shinyBS)
library(shinycssloaders)
library(shinydashboard)
library(shinyjqui)
library(shinyjs)
library(shinymanager)


library(shinyscreenshot)
library(shinythemes)
library(shinyWidgets)


library(sp)
library(stringr)
library(survminer)
library(survival)
 

library(tidyr)
library(tidyverse)

library(tinytex)
library(tippy)
library(treemapify)


library(xts)
# library(xlsx)

setwd(getwd())
 
# versionDemo is True by default 

versionDemo <- FALSE


outputDir <- "PDFSAVE/"


labase <- "TT/"
# 
# labase3 <- paste0("data/")



FeatherDir  <-   paste0("Feather/")
 


# translation -------------------------------------------------------------

# Set the language parameter  ("FR","EN","BR" .... )
Language_c <- "FR"



# Load the dictionary 
load("traductions/translation.bin")


# Language_c was initialize early, the value is the name of the column in the tab.
# Function to read the text in the correct column  

tr <- 
  function(text){ 
    sapply(text,function(s) translation[[s]][[Language_c]], USE.NAMES=FALSE) } 

# Center --------------------------------------------------

 centres <- read_feather(paste0(FeatherDir,"Centres.feather")) 

# Longitude and latitude to place the center on the map 

  centres$lat <- as.numeric(centres$lat)
  centres$long <- as.numeric(centres$long)
  
  
  visibiliteDev <-  read_feather(paste0(FeatherDir,"RandoDev.feather")) 
  
  visibilite <-  read_feather(paste0(FeatherDir ,"Rando.feather"))
  
  visibiliteTest <-  read_feather(paste0(FeatherDir ,"Rando_test.feather"))
  
  
  # readTT <- function () {read.xlsx(ficalire,sheetName ="ALGO1",row.names=1,col.names=1)}
  # 

# Data --------------------------------------------------------------------

  #  Treatment dictionary 
  
  Tableau_TT <-read_feather(paste0(FeatherDir ,"TT.feather"))

  ATB <-  read_feather(paste0(FeatherDir ,"ATB.feather"))
  
  # Treatment dictionary for Demo version 
  
  readATBDEMO <- read_feather(paste0(FeatherDir ,"ATB-DEMO.feather"))
  

  MATRICE_05  <-  read_feather(paste0(FeatherDir ,"ALGO2.feather")) 
   

  
  RECOMCOND  <-  read_feather(paste0(FeatherDir ,"RECOCOND.feather")) 
  
  
  # readDES  <- function () {read_xlsx(ficalire2,sheet ="ALGO2-MATRICE")}
  # readDES <- read_feather(paste0(FeatherDir ,"readDES.feather"))
  
  DESESCALADE <-   read_feather(paste0(FeatherDir ,"readDES.feather"))
  
  DESESCALADE <- as.data.frame(DESESCALADE)
  
  row.names(DESESCALADE) <- DESESCALADE$LETTRE


  Tableau_Micro <- read_feather(paste0(FeatherDir ,"TTMicro.feather"))
  
  
  # readTTMicro2 <- function () {read_xlsx(ficalire2,sheet ="ALGO2-MICRO2")}
  # 
  Tableau_Micro2 <- read_feather(paste0(FeatherDir ,"TTMicro2.feather"))
  
 
  
  TabreadBR<- read_feather(paste0(FeatherDir ,"BR.feather"))
  TabreadBR <- data.frame(TabreadBR, row.names = 1)
  
  
  if (versionDemo==TRUE) {
  
    
    TabreadBRB <- read_feather(paste0(FeatherDir ,"BRB.feather"))
    TabreadBRB <- data.frame(TabreadBRB, row.names = 1)
    
    TabreadBR <- TabreadBRB
    
    ATB <- readATBDEMO
  
    MATRICE_05  <-  read_feather(paste0(FeatherDir ,"ALGO2BR.feather")) 
    
    RECOMCOND  <-  read_feather(paste0(FeatherDir ,"RECOCONDBR.feather")) 
    }
  

  TabreadB1 <- read_feather(paste0(FeatherDir ,"B1.feather"))
  TabreadB1 <- data.frame(  TabreadB1 , row.names = 1)
  
 
  
  TabreadB2 <- read_feather(paste0(FeatherDir ,"B2.feather"))
  TabreadB2 <- data.frame(  TabreadB2 , row.names = 1)
  
  
  TabreadB3 <- read_feather(paste0(FeatherDir ,"B3.feather"))
  TabreadB3 <- data.frame(TabreadB3 , row.names = 1)
  
  
  
  
  TabreadB4 <- read_feather(paste0(FeatherDir ,"B4.feather"))
  TabreadB4 <- data.frame(TabreadB4 , row.names = 1)
  
  
  
  TabreadB5 <- read_feather(paste0(FeatherDir ,"B5.feather"))
  TabreadB5 <- data.frame(TabreadB5, row.names = 1)
  

  
  
  
  
  Tableau_Micro2 <- Tableau_Micro[,c("NOMLIGNE","SURNOM","CLOS","MYCO", "LEGI","LIGNEMATRICE")]
  
  Tableau_Micro <- Tableau_Micro[,c("NOMLIGNE","SURNOM","PA1","PA2","E1","E2","AGN1",	"AGN2",	"SCN1",	"SCN2",	"SA1",	"SA2"	,"EFEC1",	"EFEC2",	"EFAE1",	"EFAE2"	,"STR1"	,"STR2"	,"AGP1"	,"AGP2",	"LIGNEMATRICE")]
  
  Tableau_Micro <-  Tableau_Micro[complete.cases(Tableau_Micro$SURNOM),]
  
  ATB  <- ATB[,c("NOM","SURNOM","CLASSE","RANK","NOMCLASSE","POSO","ALLERGIE","RACIDE","LISTE","BLP")]
  
  ATB <-  ATB[complete.cases(ATB$NOM),]
  
  Tableau_TT3 <- merge(Tableau_Micro,ATB, by = "SURNOM")
  
  Tableau_Micro2 <-  Tableau_Micro2[complete.cases(Tableau_Micro2$SURNOM),]
  
  Tableau_Micro4 <-   Tableau_Micro2[which((Tableau_Micro2$CLOS=="1")|(Tableau_Micro2$LEGI=="1")|(Tableau_Micro2$MYCO=="1")),]

  # TabbenCours3$AGN3[which(TabbenCours3$SURNOM=="ACNA")]=="I")||(TabbenCours3$AGN3[which(TabbenCours3$SURNOM=="NORFLO")]=="I"))
  
  Tableau_TT4 <- merge(Tableau_Micro4,ATB, by = "SURNOM")
 
  TT <- ATB[,]
  
  L1 <- TT$NOM[which(TT["CLASSE"]=="1")]
  
  L1_PLUS <- TT$NOM[which((TT["CLASSE"]=="1")&(TT["LISTE"]=="1"))]
  
  NAMES_L1 <- "Antibiotique Pivot"
  
  L2 <-   TT$NOM[which(TT["CLASSE"]=="2")]
  
  L2_PLUS <-  TT$NOM[which((TT["CLASSE"]=="2")&(TT["LISTE"]=="1"))]
  
  NAME_L2 <-  as.character(unique(TT$NOMCLASSE[which(TT["CLASSE"]=="2")]))

  L3 <-  TT$NOM[which(TT["CLASSE"]=="3")]
  
  L3_PLUS <- TT$NOM[which((TT["CLASSE"]=="3")&(TT["LISTE"]=="1"))]
  
  NAME_L3 <-  as.character(unique(TT$NOMCLASSE[which(TT["CLASSE"]=="3")]))
  
  L4 <-  TT$NOM[which(TT["CLASSE"]=="4")]
  
  L4_PLUS <- TT$NOM[which((TT["CLASSE"]=="4")&(TT["LISTE"]=="1"))]
  
  NAME_L4 <-  as.character(unique(TT$NOMCLASSE[which(TT["CLASSE"]=="4")]))
  
  L5 <-  TT$NOM[which(TT["CLASSE"]=="4")]
  
  L5_PLUS <- TT$NOM[which((TT["CLASSE"]=="4")&(TT["LISTE"]=="1"))]
  
  NAME_L5 <-  as.character(unique(TT$NOMCLASSE[which(TT["CLASSE"]=="4")]))
  
  
  resultat_color <- "#DCDCDC"
  
  box_step1_color <- "#006688"
  
  box_FC_color <- "#8FA39D"
  
  
  box_ATC_color <-  "#25E4B4" 
  
  
  
  box_FRI_color <- "#006688"

  
  
  box_A_color <- "#F5A300"
  
  
  box_S_color <- "#006688"
  
  
  fontColorBlanc <- "color: white" 
  
  fontColorNoir <- "color : black" 
  
  reset_color <- "#EE1552"
  
  pdf_color <- "#25E4B4"
 
  
  StyleTitreBlanc  <- paste0("font-size : 16px; color : white ")
  StyleTitre  <- paste0("font-size : 16px; color : black ")
  
  style_reset   <-  paste0(fontColorBlanc,";","background-color :",reset_color ,";","border-color :",reset_color)
  
  
  petitePolice <- "font-size : 11px"
  
  MoyennePolice <- paste0("font-size : 12px ;")
  
  MoyennePlusPolice <- paste0("font-size : 14px")
  
  
  
  pdf_color <- "#FF0000"
  screen_shot_color <- "#003366"
  
  margin_bottom <- "margin-bottom:15px"
  
  border_radius <- "border-radius:5px"
  
  fontColorRed<- "color: red" 
  
  # styleFontGeneral <- "font-family : Baloo"

  stylereset <-  paste0(fontColorBlanc,";","background-color :",reset_color ,";","border-color :",reset_color)
  
  box_alerte_style <-
    paste0(fontColorRed
           # ,";",
           # styleFontGeneral
           
           ,";",
           border_radius,
           ";background-color:",resultat_color ,
           ";font-size : 20px; 
         text-align : center;
         # border-color :",box_step1_color,";  
          border-width : 1 px ;
          border-style : solid ;
         padding : 15px")
  
  
  
  sep <- "\n"
  
  box_alerte_style2 <-
    paste0(fontColorRed
           ,";",
           border_radius,
           ";background-color:",resultat_color ,
           ";font-size : 20px; 
         text-align : center;
         # border-color :",box_step1_color,";  
         border-width : 1 px ;
         border-style : solid ;
         padding : 15px")
  
  box_result_style <-
    paste0( 
         fontColorBlanc
           ,";",
           
         
           border_radius,";",margin_bottom,";",
           ";background-color:","#EE1552" ,
           # ";background-color:",resultat_color ,
           ";font-size : 22px; 
         text-align : center;
         padding : 15px")
  
  

  
  box_reco_style <-
    paste0(fontColorNoir
        
           ,";",
           
           
           border_radius,";",margin_bottom,";",
           # ";background-color:","#E98570" ,
           ";background-color:",resultat_color ,
           ";font-size : 22px; 
         text-align : center;
         # border-color :",box_step1_color,";  
         # border-width : 1 px ;
         # border-style : solid ;
         padding : 15px")
  
  
  style_box_FC <- paste0("color: #00000;background-color:",box_FC_color ,";padding : 15px;",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) 
  
  
  
  
  box_result_style_FR<- paste0("color: #00000;background-color:",resultat_color  ,";padding : 15px;",border_radius ,";",margin_bottom,";",fontColorNoir,";",MoyennePolice,";",
                         "text-align : center"
                    ) 
  
  
  style_box <- paste0( "color: #00000;background-color:",box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) 
  
  
  style_box_FC <- paste0("color: #00000;background-color:",box_FC_color ,";padding : 15px;",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) 
  
  style_box_ATC <- paste0("color: #00000;background-color:", box_ATC_color,";padding : 15px;",border_radius,";",margin_bottom,";",MoyennePolice)
  
  
  style_box_FRI <- paste0("color: #00000;background-color:", box_FRI_color,";padding : 15px;",border_radius,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) 
  

  style_box_A <- paste0("color: #00000;background-color:", box_A_color,";",border_radius,";",margin_bottom,";",MoyennePolice)
  
  
  
  style_box_S <- 
 paste0(
    "color: #00000;background-color:",box_S_color,";",border_radius,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) 
  
  
  
  style_box_PAM <- 
    paste0(   
  border_radius,";background-color:",resultat_color,";",MoyennePolice,
  ";color : black ;font-size : 18px ; 
                                  text-align : center;
                                  border-color :",box_step1_color,";  
                                }")
  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  style_box_SOFA <- 
    paste0( border_radius,";background-color:",resultat_color ,";",MoyennePolice,
      ";color : black ;font-size : 18px ; 
                                  text-align : center;
                                  border-color :",box_step1_color,";  
                                }")
  
  
  
  
  
  
  print("global.R done.")
  