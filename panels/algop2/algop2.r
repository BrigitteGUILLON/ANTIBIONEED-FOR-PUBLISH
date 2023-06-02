 


liste_des_germes <- c("PA3","E3","AGN3","SCN3","SA3","EFEC3","EFAE3","STR3","AGP3")

observeEvent(input$reset2, {
  updateRadioButtons(session,"ALLERGIE2", selected=character(0))

  updateRadioButtons(session,"DOCUMICRO", selected=character(0))
  # updateRadioButtons(session,"GERM_SA", selected=1)
  # updateRadioButtons(session,"GERM_SCN", selected=1)
  # updateRadioButtons(session,"GERM_EFEC", selected=1)
  # updateRadioButtons(session,"GERM_EFAE", selected=1)
  # updateRadioButtons(session,"GERM_STR", selected=1)
  # updateRadioButtons(session,"GERM_AGP", selected=1)
  # updateRadioButtons(session,"GERM_PA", selected=1)
  # updateRadioButtons(session,"GERM_E", selected=1)
  # updateRadioButtons(session,"GERM_AGN", selected=1)
  # 
  # updateRadioButtons(session,"CLOS", selected=0)
  # updateRadioButtons(session,"MYCO", selected=0)
  # updateRadioButtons(session,"LEGI", selected=0)
  
  updateRadioButtons(session,"CSINIT", selected=character(0))
  
  updateRadioButtons(session,"AC", selected=character(0))
 
  updateRadioButtons(session,"AGGRAV", selected=character(0))
  
  updateRadioButtons(session,"CS", selected=character(0))
  updateRadioButtons(session,"SAPPLA", selected=character(0))
  
  updateRadioButtons(session,"FIEVRE", selected=character(0))
  
  
  updateSelectInput(session,"FI", selected=1)
  updateSelectInput(session,"FCI2", selected=0)
   
  updateSelectInput(session,"FCICS", selected=0)
  
  updateRadioButtons(session,"FCICS_P", selected=character(0))
  updateRadioButtons(session,"FCICS_D", selected=character(0))
  
  
  updateSelectInput(session,"CL1", selected="Choisir")
  updateSelectInput(session,"CL2", selected="")
  updateSelectInput(session,"CL3", selected="")
  updateSelectInput(session,"CL4", selected="")
  
  
  
  
  reset("form")
})
 


observeEvent(
  input$debug, { 
    print("debug")
    insertUI(selector = "#Box_DEBUG_BG",where ="beforeEnd",  ui = Box_DEBUG)
    
  }
  , once = TRUE)




messageE2 <- reactiveVal("")



finish2 <- reactiveVal()
finish2(FALSE) 


resultat_color <- "#DCDCDC"


box_step1_color <- "#006688"

resultat_debug <- "#25E4B4"


box_debug_color <- "#006688"

StyleTitre  <- paste0("font-size : 16px")
petitePolice <- paste0("font-size : 11px")
petitePolicePlus <- paste0("font-size : 14px")


GrosTitre  <- paste0("font-size : 20px")

box_result_style <-
  paste0(border_radius,";background-color:",resultat_color ," ;
         font-size : 20px ; 
         text-align : center;
         border-color :",box_step1_color,";  
         border-width : 1 px ;
         border-style : solid ;
         padding : 15px")


box_debug_style <-
  paste0(border_radius,";background-color:",resultat_debug ," ;
         font-size : 20px ; 
         text-align : center;
         border-color :",box_debug_color,";  
         border-width : 1 px ;
         border-style : solid ;
         padding : 15px")






Box_ENCOURS <-
  
  fluidRow(
    style="margin-right : 1px",
    align="center",
    h4("Antibiothérapie en cours") ,
    h6("si absent de la liste, mettre antibiotique apparenté"),
    column(12,
           panel( 
             style=paste0("background-color: #FFCC00;"),
             # selectInput("CL1", label=NAMES_L1,choices = c("","Aucun",as.character(L1_PLUS),"Autre"))),
             # enlever Aucun et Autre
             style= petitePolice,
             selectInput("CL1", label=div(style=paste0("background-color: #FFCC00;",StyleTitre),NAMES_L1),choices=c("Choisir",as.character(L1_PLUS)))),
           panel( 
             style=paste0("background-color: #00FFFF;;"),
             style= petitePolice,
             selectInput("CL2",  label=div(style=paste0("background-color: #00FFFF;;",StyleTitre),NAME_L2),choices=c("","Aucun",as.character(L2_PLUS)))),
           panel( 
             style=paste0("background-color: #CC99FF;"),
             style= petitePolice,
             selectInput("CL3",  label=div(style=paste0("background-color: #CC99FF;",StyleTitre),NAME_L3),choices = c("","Aucun",as.character(L3_PLUS)))),
           panel( 
             style=paste0("background-color: #8FA39D;"),
             style= petitePolice,
             selectInput("CL4", label=div(style=paste0("background-color: #8FA39D;",StyleTitre),NAME_L4),choices =c("","Aucun",as.character(L4_PLUS)))))
    
  )




mise_en_forme_label <- function(x) {
  
  
  
  CommandeTAG <- paste("tags$head(tags$style(HTML",paste0("(","\"", x), "label {float:left; margin-left : 5px;}\" )))")
  return(CommandeTAG)
  
  
}

# 
mise_en_forme <- function(x) {



CommandeTAG <- paste("tags$head(tags$style(HTML",paste0("(","\"", x), "label {float:left; margin-left : 15px;}\" )))")
return(CommandeTAG)


}




mise_en_forme_clear <- function(x) {
  
chaine <-paste("tags$style(HTML",paste0("(","\"", x)," { clear : both;\" ))")

return(chaine)


}


Box_ALGO_POPUP <- 
  box (id="Box_ALGO_POPUP",
       width=12,
       conditionalPanel(condition = "output.finisher==true",
                        
                        column(12 ,
                               
                               # style=paste0(moyennePolice),
                               
                               column(6,
                                      textOutput("TextresultAlgo_des_TT1"))
                               
            
                               ,
                               column(6,
                                      textOutput("TextresultAlgo_poso_TT1"))
                        ),
                        column(12,
                               # style=paste0(moyennePolice),
                               column(6,
                                      textOutput("TextresultAlgo_des_TT2"))
                               ,
                               column(6,
                                      
                                      textOutput("TextresultAlgo_poso_TT2"))
                        ),
                        column(12,
                               # style=paste0(moyennePolice),
                               # 
                               
                               column(6,
                                      
                                      textOutput("TextresultAlgo_des_TT3"))
                               ,
                               column(6,
                                      
                                      textOutput("TextresultAlgo_poso_TT3"))
                        ),
                        
                        column(12,
                               # style=paste0(moyennePolice),
                               column(6,
                                      
                                      textOutput("TextresultAlgo_des_TT4"))
                               ,
                               column(6,
                                      
                                      
                                      textOutput("TextresultAlgo_poso_TT4"))),
                        column(12,
                               column(12,
                                      style=paste0(StyleTitre),
                                      "Recommandations"),
                               column(12,
                                      # style=paste0(moyennePolice),
                                      textOutput("TextresultAlgo_reco"))
                        )
       )
       
  )



Box_RESULT_DES <- 
  # box (id="Box_RESULT_DES",
  #      width=4,
  
  fluidRow(
    column(12,
           align="center", h4("Antibiothérapie proposée") ,
           panel(
             style=paste0("background-color: #FFCC00;font-weight: bold;",StyleTitre),
             NAMES_L1,
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_des_TT1")),
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_poso_TT1"))
           ),
           panel(
             style=paste0("background-color: #00FFFF;font-weight: bold;",StyleTitre),
             NAME_L2,
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_des_TT2")),
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_poso_TT2"))
           ),
           panel(
             style=paste0("background-color: #CC99FF;font-weight: bold;",StyleTitre),
             NAME_L3,
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_des_TT3")),
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_poso_TT3"))
           ),
           panel(
             style=paste0("background-color: #8FA39D;font-weight: bold;",StyleTitre),
             NAME_L4, 
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_des_TT4")),
             panel(
               style=paste0("background-color: white;font-weight: normal;",border_radius,";",petitePolice),
               textOutput("TextresultAlgo_poso_TT4")))
    )
  )

insertUI(selector = "#Box_ENCOURS",where ="beforeEnd",ui=Box_ENCOURS)
insertUI(selector = "#Box_RESULT_DES",where ="beforeEnd",ui=Box_RESULT_DES)




step <- reactiveVal(0)



AFFICHE_step0 <-  reactiveVal()

# 
AFFICHE_step1<-  reactiveVal()
# 
AFFICHE_step2 <-  reactiveVal()
# 
AFFICHE_step3 <-  reactiveVal()
# 
# #   
AFFICHE_step4 <-  reactiveVal()

affiche_en_cours  <-  reactiveVal()



AFFICHE_step0(TRUE)


# tags$head(
#   tags$style(
#     HTML(
#       "
#         label{
#           float:left;
#         }
#       "
#     )))








CN <-    paste0("choiceNames=c(","\"","S","\",","\"","I-R","\",","\"","Non Teste","\")")
CV <-  paste0("choiceValues=c(","\"","S","\",","\"","I","\",","\"","N","\")")


var1<- "VAR1"

var2<- "VAR1"

Commandetext <- paste0("RadioButtons(","\"",var1,"\"" ,",label=","\"",var2,"\"",",",CN,",",CV,",inline = TRUE)")
CommandetexttestN <-paste0("RadioButtons(","\"",var1,"\"" ,",label=","\"",var2,"\"",",",CN,",",CV,",selected=", "\"","N","\"",",inline = TRUE)")
CommandetexttestS <-paste0("RadioButtons(","\"",var1,"\"" ,",label=","\"",var2,"\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)")

# 

Tabb_SA <-   Tableau_TT3[c("NOM","SURNOM","LIGNEMATRICE","CLASSE","SA1","SA2")]

Tabb_SA <-  Tabb_SA[complete.cases(Tabb_SA),]

Tabb_SA <- Tabb_SA[order(Tabb_SA$LIGNEMATRICE),]


for(i in 1:nrow(Tabb_SA)){
  
 

  
  var <-    Tabb_SA[i,"SURNOM" ]
  var1 <- paste0("GERM_SA",var)
  var2 <-    Tabb_SA[i,"NOM"]
  

  var11 <- paste0("#",var1)
  

  lab_text <-   paste0("\"" , Tabb_SA[i,"NOM"] ,"\"")
  
  Box_SATAG <- mise_en_forme(var11)
  

  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  

  Box_SA <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 

 
  insertUI(
    selector = "#BOXSATAG",where ="beforeEnd", ui =(eval(parse(text=Box_SATAG))))
  
  
  insertUI(
    selector = "#BOXSA",where ="beforeEnd", ui =(eval(parse(text=Box_SA))))

  
 
  
  
}






observeEvent(
  input$GERM_SA, { 
 
    {update_RBSA()}
    
  })



update_RBSA <-function(){

for(i in 1:nrow(Tabb_SA)){

  var <-    Tabb_SA[i,"SURNOM" ]
  var1 <- paste0("GERM_SA",var)
  var2 <-    Tabb_SA[i,"NOM"]


  updateRadioButtons(inputId = var1,
                     selected = 'S')
}
}

Tabb_SCN <-   Tableau_TT3[,c("NOM","SURNOM","LIGNEMATRICE","CLASSE","SCN1","SCN2")]

Tabb_SCN <-  Tabb_SCN[complete.cases(Tabb_SCN),]

Tabb_SCN <- Tabb_SCN[order(Tabb_SCN$LIGNEMATRICE),]

for(i in 1:nrow(Tabb_SCN)){
  
  
  var <-    Tabb_SCN[i,"SURNOM" ]
  var1 <- paste0("GERM_SCN",var)
  var2 <-    Tabb_SCN[i,"NOM"]
  var11 <- paste0("#",var1)
  
 
  
  lab_text <-   paste0("\"" , Tabb_SCN[i,"NOM"] ,"\"")
  
  Box_SCNTAG <- mise_en_forme(var11)
  
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_SCN <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
  
 

  insertUI( selector = "#BOXSCNTAG",where ="beforeEnd", ui =(eval(parse(text=Box_SCNTAG))))
  
  
  insertUI( selector = "#BOXSCN",where ="beforeEnd", ui =(eval(parse(text=Box_SCN))))
 
  
}




update_RBSCN <-function(){
  
  for(i in 1:nrow(Tabb_SCN)){
    
    
    var <-    Tabb_SCN[i,"SURNOM" ]
    var1 <- paste0("GERM_SCN",var)
    var2 <-    Tabb_SCN[i,"NOM"]
    

    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_SCN, { 
 
    {update_RBSCN()}
    
  })


Tabb_PA <-   Tableau_TT3[,c("NOM","SURNOM","LIGNEMATRICE", "CLASSE","PA1","PA2")]


Tabb_PA <-  Tabb_PA[complete.cases(Tabb_PA),]


Tabb_PA <- Tabb_PA[order(Tabb_PA$LIGNEMATRICE),]

for(i in 1:nrow(Tabb_PA)){
  
  var <-    Tabb_PA[i,"SURNOM"]
  var1 <- paste0("GERM_PA",var)
  var2 <-    Tabb_PA[i,"NOM"]
  
  
  var11 <- paste0("#",var1)
  

  lab <-   paste0("\"" , Tabb_PA[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_PA[i,"NOM"] ,"\"")
  
  Box_PATAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_PA<- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
 
  insertUI( selector = "#BOXPATAG",where ="beforeEnd", ui =(eval(parse(text=Box_PATAG))))
  
  
  insertUI( selector = "#BOXPA",where ="beforeEnd", ui =(eval(parse(text=Box_PA))))
 
  
  
}





update_RBPA <-function(){
  
  for(i in 1:nrow(Tabb_PA)){
    
    
    var <-    Tabb_PA[i,"SURNOM"]
    var1 <- paste0("GERM_PA",var)
    var2 <-    Tabb_PA[i,"NOM"]
  
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_PA, { 
  
    {update_RBPA()}
    
  })




Tabb_E <-   Tableau_TT3[,c("NOM","SURNOM","LIGNEMATRICE","CLASSE","E1","E2")]

Tabb_E <-  Tabb_E[complete.cases(Tabb_E),]

Tabb_E <- Tabb_E[order(Tabb_E$LIGNEMATRICE),]


for(i in 1:nrow(Tabb_E)){
  
  
  var <-    Tabb_E[i,"SURNOM" ]
  var1 <- paste0("GERM_E",var)
  var2 <-    Tabb_E[i,"NOM"]
  
  
  var11 <- paste0("#",var1)
  
  
  lab <-   paste0("\"" , Tabb_E[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_E[i,"NOM"] ,"\"")
  
  Box_ETAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  
  Box_E <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 

  insertUI(selector = "#BOXETAG",where ="beforeEnd", ui =(eval(parse(text=Box_ETAG))))
  
  
  insertUI(selector = "#BOXE",where ="beforeEnd", ui =(eval(parse(text=Box_E))))
  

  
}










update_RBE<-function(){
  
  for(i in 1:nrow(Tabb_E)){
    
    var <-    Tabb_E[i,"SURNOM" ]
    var1 <- paste0("GERM_E",var)
    var2 <-    Tabb_E[i,"NOM"]
    
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_E, { 
   
    {update_RBE()}
    
  })



Tabb_AGN <-   Tableau_TT3[,c("NOM","SURNOM","LIGNEMATRICE","CLASSE","AGN1","AGN2")]

Tabb_AGN <-  Tabb_AGN[complete.cases(Tabb_AGN),]

Tabb_AGN <- Tabb_AGN[order(Tabb_AGN$LIGNEMATRICE),]



for(i in 1:nrow(Tabb_AGN)){
  
  
  var <-    Tabb_AGN[i,"SURNOM" ]
  var1 <- paste0("GERM_AGN",var)
  var2 <-    Tabb_AGN[i,"NOM"]
  
  
  var11 <- paste0("#",var1)
  

  
  
  lab <-   paste0("\"" , Tabb_AGN[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_AGN[i,"NOM"] ,"\"")
  
  Box_AGNTAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_AGN <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
  
  
  
  insertUI( selector = "#BOXAGNTAG",where ="beforeEnd", ui =(eval(parse(text=Box_AGNTAG))))
  
  
  insertUI( selector = "#BOXAGN",where ="beforeEnd", ui =(eval(parse(text=Box_AGN))))
  
  

  
  
}








update_RBAGN<-function(){
  
  
  for(i in 1:nrow(Tabb_AGN)){
    
    
    var <-    Tabb_AGN[i,"SURNOM" ]
    var1 <- paste0("GERM_AGN",var)
    var2 <-    Tabb_AGN[i,"NOM"]
    
    
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_AGN, { 
   
    {update_RBAGN()}
    
  })





Tabb_EFEC <-   Tableau_TT3[c("NOM","SURNOM","LIGNEMATRICE","CLASSE","EFEC1","EFEC2")]

Tabb_EFEC <-  Tabb_EFEC[complete.cases(Tabb_EFEC),]

Tabb_EFEC <- Tabb_EFEC[order(Tabb_EFEC$LIGNEMATRICE),]

for(i in 1:nrow(Tabb_EFEC)){
  
  
  var <-    Tabb_EFEC[i,"SURNOM" ]
  var1 <- paste0("GERM_EFEC",var)
  var2 <-    Tabb_EFEC[i,"NOM"]
  
  
  var11 <- paste0("#",var1)
  
  
  
  lab <-   paste0("\"" , Tabb_EFEC[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_EFEC[i,"NOM"] ,"\"")
  
  Box_EFECTAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_EFEC <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
  
  
  
  insertUI( selector = "#BOXEFECTAG",where ="beforeEnd", ui =(eval(parse(text=Box_EFECTAG))))
  
  
  insertUI( selector = "#BOXEFEC",where ="beforeEnd", ui =(eval(parse(text=Box_EFEC))))
  
  
  
  
  
  
}




update_RBEFEC<-function(){
  
  
  for(i in 1:nrow(Tabb_EFEC)){
    
    
    var <-    Tabb_EFEC[i,"SURNOM" ]
    var1 <- paste0("GERM_EFEC",var)
    var2 <-    Tabb_EFEC[i,"NOM"]
    
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_EFEC, { 
 
    {update_RBEFEC()}
    
  })




Tabb_EFAE <-   Tableau_TT3[c("NOM","SURNOM","LIGNEMATRICE","CLASSE","EFAE1","EFAE2")]

Tabb_EFAE <-  Tabb_EFAE[complete.cases(Tabb_EFAE),]

Tabb_EFAE <- Tabb_EFAE[order(Tabb_EFAE$LIGNEMATRICE),]



for(i in 1:nrow(Tabb_EFAE)){
  
  
  var <-    Tabb_EFAE[i,"SURNOM" ]
  var1 <- paste0("GERM_EFAE",var)
  var2 <-    Tabb_EFAE[i,"NOM"]
  
  var11 <- paste0("#",var1)
  
  
  
  lab <-   paste0("\"" , Tabb_EFAE[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_EFAE[i,"NOM"] ,"\"")
  
  Box_EFAETAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_EFAE <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
  
  
  
  insertUI( selector = "#BOXEFAETAG",where ="beforeEnd", ui =(eval(parse(text=Box_EFAETAG))))
  
  
  insertUI( selector = "#BOXEFAE",where ="beforeEnd", ui =(eval(parse(text=Box_EFAE))))
  
  
  
}






update_RBEFAE<-function(){
  
  
  for(i in 1:nrow(Tabb_EFAE)){
    
    
    var <-    Tabb_EFAE[i,"SURNOM" ]
    var1 <- paste0("GERM_EFAE",var)
    var2 <-    Tabb_EFAE[i,"NOM"]
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_EFAE, { 
  
    {update_RBEFAE()}
    
  })




Tabb_STR <-   Tableau_TT3[c("NOM","SURNOM","LIGNEMATRICE","CLASSE","STR1","STR2")]

Tabb_STR <-  Tabb_STR[complete.cases(Tabb_STR),]


Tabb_STR <- Tabb_STR[order(Tabb_STR$LIGNEMATRICE),]

for(i in 1:nrow(Tabb_STR)){
  
  
  var <-    Tabb_STR[i,"SURNOM" ]
  var1 <- paste0("GERM_STR",var)
  var2 <-    Tabb_STR[i,"NOM"]
  
  
  var11 <- paste0("#",var1)
  
  
  lab <-   paste0("\"" , Tabb_STR[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_STR[i,"NOM"] ,"\"")
  
  Box_STRTAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_STR <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")
  # 
  
  
  
  insertUI( selector = "#BOXSTRTAG",where ="beforeEnd", ui =(eval(parse(text=Box_STRTAG))))
  
  
  insertUI( selector = "#BOXSTR",where ="beforeEnd", ui =(eval(parse(text=Box_STR))))
  
  
}






update_RBSTR<-function(){
  
  
  for(i in 1:nrow(Tabb_STR)){
    
    
    var <-    Tabb_STR[i,"SURNOM" ]
    var1 <- paste0("GERM_STR",var)
    var2 <-    Tabb_STR[i,"NOM"]
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_STR, { 
    
    {update_RBSTR()}
    
  })




Tabb_AGP <-   Tableau_TT3[c("NOM","SURNOM","LIGNEMATRICE","CLASSE","AGP1","AGP2")]

Tabb_AGP <-  Tabb_AGP[complete.cases(Tabb_AGP),]

Tabb_AGP <- Tabb_AGP[order(Tabb_AGP$LIGNEMATRICE),]

for(i in 1:nrow(Tabb_AGP)){
  
  
  var <-    Tabb_AGP[i,"SURNOM"]
  var1 <- paste0("GERM_AGP",var)
  var2 <-    Tabb_AGP[i,"NOM"]
  
  
  
  
  var11 <- paste0("#",var1)
  
  
  lab <-   paste0("\"" , Tabb_AGP[i,"NOM"] ,"\"")
  
  lab_text <-   paste0("\"" , Tabb_AGP[i,"NOM"] ,"\"")
  
  Box_AGPTAG <- mise_en_forme(var11)
  
  Commande1 <-paste0("column(5,", lab_text ,")")
  
  Commande2 <-paste0("column(7,radioButtons(","\"",var1,"\"" ,",label=","\"","\"",",",CN,",",CV,",selected=", "\"","S","\"",",inline = TRUE)",")")
  
  
  Box_AGP <- paste("fluidRow(column(12,",Commande1,",",Commande2,"))")

  
  insertUI( selector = "#BOXAGPTAG",where ="beforeEnd", ui =(eval(parse(text=Box_AGPTAG))))
  
  
  insertUI( selector = "#BOXAGP",where ="beforeEnd", ui =(eval(parse(text=Box_AGP))))
  
}



update_RBAGP <-function(){
  
  
  for(i in 1:nrow(Tabb_AGP)){
    
    
    var <-    Tabb_AGP[i,"SURNOM"]
    var1 <- paste0("GERM_AGP",var)
    var2 <-    Tabb_AGP[i,"NOM"]
    
    updateRadioButtons(inputId = var1,
                       selected = 'S')
  }
}




observeEvent(
  input$GERM_AGP, { 

    {update_RBAGP()}
    
  })






observeEvent(
  input$DOCUMICRO, { 

updateRadioButtons(session,"GERM_SA", selected=1)
updateRadioButtons(session,"GERM_SCN", selected=1)
updateRadioButtons(session,"GERM_EFEC", selected=1)
updateRadioButtons(session,"GERM_EFAE", selected=1)
updateRadioButtons(session,"GERM_STR", selected=1)
updateRadioButtons(session,"GERM_AGP", selected=1)
updateRadioButtons(session,"GERM_PA", selected=1)
updateRadioButtons(session,"GERM_E", selected=1)
updateRadioButtons(session,"GERM_AGN", selected=1)

updateRadioButtons(session,"CLOS", selected=0)
updateRadioButtons(session,"MYCO", selected=0)
updateRadioButtons(session,"LEGI", selected=0)



# reset du reste

updateRadioButtons(session,"CSINIT", selected=character(0))

updateRadioButtons(session,"AC", selected=character(0))

updateRadioButtons(session,"AGGRAV", selected=character(0))

updateRadioButtons(session,"CS", selected=character(0))
updateRadioButtons(session,"SAPPLA", selected=character(0))

updateRadioButtons(session,"FIEVRE", selected=character(0))



  }
)

observeEvent(
  input$CSINIT, { 
    
    
    
    # reset du reste
    
    
    updateRadioButtons(session,"AC", selected=character(0))
    
    updateRadioButtons(session,"AGGRAV", selected=character(0))
    
    updateRadioButtons(session,"CS", selected=character(0))
    updateRadioButtons(session,"SAPPLA", selected=character(0))
    
    updateRadioButtons(session,"FIEVRE", selected=character(0))
    
    
    updateSelectInput(session,"FI", selected=1)
    updateSelectInput(session,"FCI2", selected=0)
    
    updateSelectInput(session,"FCICS", selected=0)
    
    updateRadioButtons(session,"FCICS_P", selected=character(0))
    updateRadioButtons(session,"FCICS_D", selected=character(0))
    
    
    
    
    
    
    
  }
)

observeEvent(
  input$AC, { 
    
    
    
    # reset du reste
    
    
    updateSelectInput(session,"FCICS", selected=0)

    
    
  }
)

observeEvent(
  input$AGGRAV, { 
    
    
    
    # reset du reste
 
    
    updateRadioButtons(session,"CS", selected=character(0))
    updateRadioButtons(session,"SAPPLA", selected=character(0))
    
    updateRadioButtons(session,"FIEVRE", selected=character(0))
 
    updateSelectInput(session,"FCI2", selected=0)
    
  

    
  }
)





observeEvent(
  input$SAPPLA, { 
    
    
    
    # reset du reste
    
    updateRadioButtons(session,"FIEVRE", selected=character(0))
    
    
    
  }
)

fonction_calcul_duree  <- function () {
  
  
  
  TCaldur <-   MATRICE_05[c("Strategie","DUR","BOX1R","BOX1","BOX2R","BOX3R","BOX4R","BOX5", "BOX5R","STEP","APLA","AGGRAV","FIEVRE","ALLERG","AC","CS","FI","FCI","FCI2","LIGNE")]
  
 
  
  
  # calcul le step 
  resultat <- ""
  
  step(0) 
  
  
  
 
  lemessage  <- tr("message2Allergie")

  messageE2(lemessage)
  validate(need(input$ALLERGIE2<3,""))
  messageE2("")
  # 
  
  messageE2(tr("message2Box1vide"))
  # messageE2("Veuillez renseigner le traitement en cours dans box 1 ")
  validate(need(input$CL1!=as.character("Choisir"),""))
  messageE2("")
   
  messageE2(tr("message2Box2vide"))
  # messageE2("Veuillez renseigner le traitement en cours dans box2  ")
  validate(need(input$CL2>0,""))
  messageE2("")
  
  # messageE2("Veuillez renseigner le traitement en cours dans box3  ")
  messageE2(tr("message2Box3vide"))
  validate(need(input$CL3>0,""))
  messageE2("")
  
  messageE2(tr("message2Box4vide"))
  # messageE2("Veuillez renseigner le traitement en cours dans box4  ")
  validate(need(input$CL4>0,""))
  messageE2("")
  
  
  if (input$ALLERGIE2<3)  {
    
    AFFICHE_step1(TRUE)  
  }
  
  
  #    
  # validate(need(input$DOCUMICRO<2,message("Veuillez renseigner documentationmicrobiologique")))
  
  lemessage <- tr("message2Docum")
  messageE2(lemessage)
  validate(need(input$DOCUMICRO<2, ""))
  messageE2("")
  
  
  if (input$DOCUMICRO==0)  {
    
    
  #   Ajout de  4 lignes pour correction de #133
    
    messageE2("Veuillez renseigner la documentation microbiologique pour au moins un germe ")
    validate(need(((input$GERM_SA==0)|(input$GERM_SCN==0)|(input$GERM_EFEC==0)|(input$GERM_EFAE==0)|(input$GERM_STR==0)|(input$GERM_AGP==0)|(input$GERM_PA==0)|(input$GERM_E==0)|(input$GERM_AGN==0)|(input$CLOS==1)|
                     (input$MYCO==1)|(input$LEGI==1)),""))
    messageE2("")
    
    lemessage <- tr("message2FoyerInfect")
    messageE2(lemessage)
    
    # messageE2("Veuillez renseigner foyer infectieux")
    validate(need(input$FI < 7, ""))
    messageE2("")
    
    step(1) 

    return(TCaldur[which((TCaldur["STEP"]=="STEP1")&(TCaldur["FI"]==input$FI)),])
  }
  else
  {
    

    AFFICHE_step2(TRUE)  
    
    step(2) 
    

    # messageE22("Veuillez renseigner choc sceptique initial")
    lemessage <- tr("message2CSI")
    messageE2(lemessage)
    
    
    
    validate(need(input$CSINIT<2,""))
    messageE2("")
    
    
    
    
    
    
    if (input$CSINIT==0) {
      
      
      
      lemessage <- tr("message2AmelC")
      messageE2(lemessage)
      
      
      
      # messageE2("Veuillez renseigner l'amélioration clinique")
      validate(need(input$AC<2,""))
      messageE2("")
      
      
      
      
      
      if (input$AC==0) 
      {
        finish2(TRUE)
        return(TCaldur[which((TCaldur["STEP"]=="STEP2")&(TCaldur["AC"]==input$AC)),])
      }
      else 
      {
        #amelioration clinique ' 
        
        messageE2("Veuillez renseigner foyer clinique")
        validate(need(input$FCICS<8,""))
        messageE2("")
        
        
        
        
        FCICS <- input$FCICS
        
        if (input$FCICS==1){
          
          messageE2("Veuillez renseigner -> Pneumonie interstitielle")
          validate(need(input$FCICS_P<2,""))
          messageE2("")
          
          
          if (input$FCICS_P==0)  {FCICS <- 10}
        }
        
        # Cutané 
        if (input$FCICS==6){
          
          messageE2("Veuillez renseigner -> Dermo-hypodermite nécrotique oui/non")
          validate(need(input$FCICS_D<2,""))
          messageE2("")
          
          
          
          if (input$FCICS_D==0)  {FCICS <- 60}
        }
        finish2(TRUE)
        return(TCaldur[which((TCaldur["STEP"]=="STEP2")&(TCaldur["AC"]==input$AC)&(TCaldur["FCI"]==FCICS)),])
      }
      
      
      
      
      
      
      
      
      
      
      
      
    }
    
    
    
    if (input$CSINIT==1) {
      AFFICHE_step3(TRUE)
      
      
      messageE2("Veuillez renseigner l'aggravation")
      validate(need(input$AGGRAV < 2,""))
      messageE2("")
      
      
      # aggrav non
      
     
      
      
      
      
      # aggrav oui 
      if (input$AGGRAV==0) {
        messageE2("Veuillez renseigner choc sceptique ")
        validate(need(input$CS<2,""))
        messageE2("")
        
        
        
      
        
        step(3) 
        if (input$CS==0)
        {
          finish2(TRUE)
        return(TCaldur[which((TCaldur["STEP"]=="STEP3")&(TCaldur["AGGRAV"]==input$AGGRAV)&(TCaldur["CS"]==input$CS)),])
        } 
          
        
        if (input$CS==1)
        {
          finish2(TRUE)
          return(TCaldur[which((TCaldur["STEP"]=="STEP3")&(TCaldur["AGGRAV"]==input$AGGRAV)&(TCaldur["CS"]==input$CS)&(TCaldur["ALLERG"]==input$ALLERGIE2)),])
        } 
      }
      
      
      
      # (input$AGGRAV==1)  aggrva = non 
      
      
      
      
      else  {
        
        # (input$AGGRAV==1)
          
         
        AFFICHE_step4(TRUE)
        
        messageE2("Veuillez renseigner foyer clinique")
        validate(need(input$FCI2 < 7,""))
        messageE2("")
        
        
        
        messageE2("Veuillez renseigner sortie aplasie")
        validate(need(input$SAPPLA<2,""))
        messageE2("")
        
        
        
        step(4)  
        VARSTEP <- "STEP4"
        
     
        # traitement de la fiecre 
        if ((input$SAPPLA==1)&(input$FCI2==0))
        {
          messageE2("Veuillez renseigner fievre")
          validate(need(input$FIEVRE<2,""))
          finish2(TRUE)
          messageE2("")
          
          return(TCaldur[which((TCaldur["STEP"]=="STEP4")&(TCaldur["ALLERG"]==input$ALLERGIE2)&(TCaldur["APLA"]==input$SAPPLA)&(TCaldur["FIEVRE"]==input$FIEVRE)&(TCaldur["FCI2"]==input$FCI2)),])
          
        }
        finish2(TRUE)
        return(TCaldur[which((TCaldur["STEP"]=="STEP4")&(TCaldur["ALLERG"]==input$ALLERGIE2)&(TCaldur["APLA"]==input$SAPPLA)&(TCaldur["FCI2"]==input$FCI2)),])
        
      }
      
      
      
    }
    
    
    
    
    
  }
  
  
  
  
  # View(Tdur$STEP[which(Tdur["ALLERG"]==as.character(VARALLERG))&(Tdur["FCI"]==VARFCI)&(Tdur["STEP"]==VARSTEP)])
  
  
  
  
  
  
}


fonction_calcul_micro  <- function () {
  
  res <- ""
  
  TabbenCours3 <- Tableau_TT3[,]
  
  rownames(TabbenCours3) <- TabbenCours3$SURNOM
  TabbenCours3 <- TabbenCours3[order(TabbenCours3$LIGNEMATRICE),]
  
  messageE2("Veuillez renseigner la documentation microbiologique")
  validate(need(input$DOCUMICRO<2,""))
  messageE2("")
  
  
 
  messageE2("Veuillez renseigner la documentation microbiologique pour au moins un germe ")
  validate(need(((input$GERM_SA==0)|(input$GERM_SCN==0)|(input$GERM_EFEC==0)|(input$GERM_EFAE==0)|(input$GERM_STR==0)|(input$GERM_AGP==0)|(input$GERM_PA==0)|(input$GERM_E==0)|(input$GERM_AGN==0)|(input$CLOS==1)|
                  (input$MYCO==1)|(input$LEGI==1)),""))
  messageE2("")
  
  
  
  # respecter l'ordre de laffichage des variables car indentation de var 
  
  col <- "SA3"
  
  
  
  for(i in 1:nrow(Tabb_SA)){
    
    var <-    Tabb_SA[i,"SURNOM"]
    var1 <- paste0("GERM_SA",var)
    ligne <-  Tabb_SA[i,"SURNOM"]
    
    
    varinput <- ""
    
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Staphylocoque aureus")
    validate(need(input$GERM_SA<2,""))
    messageE2("")
    
    
    
    
    
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    
    
    
    if (input$GERM_SA==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
    
    
    
    
  }
  
  
  
  
  
  
  col <- "SCN3"
  
  for(i in 1:nrow(Tabb_SCN)){
    
    var <-    Tabb_SCN[i,"SURNOM"]
    var1 <- paste0("GERM_SCN",var)
    ligne <-  Tabb_SCN[i,"SURNOM"]
    
    
    varinput <- ""  
    
    
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Staphylocoque non-aureus")
    validate(need(input$GERM_SCN <2,""))
    messageE2("")
    
    
    # 
    # 
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    TabbenCours3[ligne,col] <- varinput
    
    
    
    
    if (input$GERM_SCN==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
  } 
  
  
  
  
  col <- "EFEC3"
  
  for(i in 1:nrow(Tabb_EFEC)){
    
    var <-    Tabb_EFEC[i,"SURNOM" ]
    var1 <- paste0("GERM_EFEC",var)
    ligne <-  Tabb_EFEC[i,"SURNOM"]
    
    
    varinput <- ""
    
    
    
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Entérocoque fecalis")
    validate(need(input$GERM_EFEC<2,""))
    messageE2("")
    
    
    
    
    # 
    #
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    
    if (input$GERM_EFEC==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
  } 
  
  
  
  
  
  
  col <- "EFAE3"
  
  for(i in 1:nrow(Tabb_EFAE)){
    
    var <-    Tabb_EFAE[i,"SURNOM" ]
    var1 <- paste0("GERM_EFAE",var)
    ligne <-  Tabb_EFAE[i,"SURNOM"]
    varinput <- ""
    
    
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Entérocoque faecium")
    validate(need(input$GERM_EFAE <2,""))
    messageE2("")
    
    
    
    #
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    if (input$GERM_EFAE==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
  }
  # 
  
  
  
  
  
  col <- "STR3"
  
  for(i in 1:nrow(Tabb_STR)){
    
    var <-    Tabb_STR[i,"SURNOM" ]
    var1 <- paste0("GERM_STR",var)
    ligne <-  Tabb_STR[i,"SURNOM"]
    varinput <- ""
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Streptococcus")
    validate(need(input$GERM_STR <2,""))
    messageE2("")
    
    
    
    #
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    if (input$GERM_STR==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
    
    
  }
  
  
  
  
  
  col <- "AGP3"
  
  for(i in 1:nrow(Tabb_AGP)){
    
    var <-    Tabb_AGP[i,"SURNOM" ]
    var1 <- paste0("GERM_AGP",var)
    ligne <-  Tabb_AGP[i,"SURNOM"]
    
    varinput <- ""
    
    
    
    
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Autre cocci gram +")
    validate(need(input$GERM_AGP <2,""))
    messageE2("")
    
    
    #
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    if (input$GERM_AGP==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
    
    
  }
  
  
  
  
  
  col <- "PA3"
  
  
  
  for(i in 1:nrow(Tabb_PA)){
    
    var <-    Tabb_PA[i,"SURNOM"]
    var1 <- paste0("GERM_PA",var)
    ligne <-  Tabb_PA[i,"SURNOM"]
    varinput <- ""
    
    
    messageE2("Veuillez renseigner la documentation microbienne pour Pseudomonas aeruginosa")
    validate(need(input$GERM_PA <2,""))
    messageE2("")
    
 
    
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    TabbenCours3[ligne,col] <- varinput
    
    
    if (input$GERM_PA==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
    
    
  }
  
  
  
  
  
  
  col <- "E3"
  
  for(i in 1:nrow(Tabb_E)){
    
    var <-    Tabb_E[i,"SURNOM" ]
    var1 <- paste0("GERM_E",var)
    ligne <-  Tabb_E[i,"SURNOM"]
    varinput <- ""
    
    
    
    
    
    messageE2(" Veuillez renseigner la documentation microbienne pour Enterobacterie ")
    validate(need(input$GERM_E <2,""))
    messageE2("")
    
    
    # print(var1)
    
    #
    tryCatch(
    
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
      
    )
    
    
    # traitement particulier  pour ACNA NORFLO OFLOX CIPRO
    
    
    
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    
    
    if (input$GERM_E==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
    
    
    
    
    
    
    
  }
  
  

  
  
  col <- "AGN3"
  
  for(i in 1:nrow(Tabb_AGN)){
    
    var <-    Tabb_AGN[i,"SURNOM" ]
    var1 <- paste0("GERM_AGN",var)
    ligne <-  Tabb_AGN[i,"SURNOM"]
    varinput <- ""  
 
    messageE2(" Veuillez renseigner la documentation microbienne pour Autre bactérie gram-  ")
    validate(need(input$GERM_AGN <2,""))
    messageE2("")
 
    # print(var1)
    tryCatch(
      
      varinput <-  eval(parse(text=paste0("input$",var1)))
      
    )
    
    
    
    
    TabbenCours3[ligne,col] <- varinput
    
    if (input$GERM_AGN==1) {
      
      
      TabbenCours3[ligne,col] <- "NON"
      
    }
    
  } 
  
 
  
  # pour les staphes  sensibilité de la clox -> tous les BLP sont sensibles 
  
  
  TabbenCours3$SA3[which(TabbenCours3$BLP=="1")]  <- TabbenCours3$SA3[which(TabbenCours3$SURNOM=="CLOX")]
  
  TabbenCours3$SCN3[which(TabbenCours3$BLP=="1")]  <- TabbenCours3$SCN3[which(TabbenCours3$SURNOM=="CLOX")]
  
  
  
  
  TabbenCours3$ICON <- ""
  TabbenCours3$RANK2 <- ""
  TabbenCours3$TROISETOILES <- ""
  
  TabbenCours3$RES <- apply(TabbenCours3[,c("PA3","E3","AGN3","SCN3","SA3","EFEC3","EFAE3","STR3","AGP3")], 1, function(x) length(which(x=="S")))
  
  
  
  # Aucun winner si au moins une bactérie résistant à tout
  
  V1  <-apply(TabbenCours3[,liste_des_germes], 2, function(x) length(which(x=="S")))
  V2 <- apply(TabbenCours3[,liste_des_germes], 2, function(x) length(which(x=="I"))) 
  
  
  
  resistant <- FALSE
  for (i in 1:length(liste_des_germes))
    
  {
    
    # print(liste_des_germes[i])
    # print(V1[[liste_des_germes[i]]])
    # print(V2[[liste_des_germes[i]]])
    
    resistant <- ((V1[[liste_des_germes[i]]]+V2[[liste_des_germes[i]]]>0)&(V1[[liste_des_germes[i]]]==0))|resistant
    
    # print(paste0("resistant à tout" , (V1[[liste_des_germes[i]]]+V2[[liste_des_germes[i]]]>0)&(V1[[liste_des_germes[i]]]==0)) )
    
    
  }
  
  

  
  
  if ((TabbenCours3$E3[which(TabbenCours3$SURNOM=="ACNA")]=="I")||(TabbenCours3$E3[which(TabbenCours3$SURNOM=="NORFLO")]=="I")||
            (TabbenCours3$AGN3[which(TabbenCours3$SURNOM=="ACNA")]=="I")||(TabbenCours3$AGN3[which(TabbenCours3$SURNOM=="NORFLO")]=="I"))
        {

          TabbenCours3$RES[which(TabbenCours3["RACIDE"]==1)] <- 0
          TabbenCours3$TROISETOILES[which(TabbenCours3["RACIDE"]==1)] <- "FLUO-RESIST"

  }
  
  
  # Traitement ne pouvant etre donne  ne servent que pour la sensiblite 
  
  TabbenCours3$RES[which(TabbenCours3["SURNOM"]=="NORFLO")] <- 0
  TabbenCours3$RES[which(TabbenCours3["SURNOM"]=="ACNA")] <- 0
  
  
  # 1 == allergie severe , dans ce cas on ne donne pas de medicament provoquant des allergies 
  
  if (input$ALLERGIE2==1) {
  TabbenCours3$RES[which(TabbenCours3["ALLERGIE"]==2)] <- 0
  TabbenCours3$RES[which(TabbenCours3["ALLERGIE"]==1)] <- 0
  
  
  TabbenCours3$ICON[which(TabbenCours3["ALLERGIE"]==2)] <- "ALLG" 
  
  TabbenCours3$ICON[which(TabbenCours3["ALLERGIE"]==1)] <- "ALLNG" 

 
  
  }
  
  
  
  # 0  == allergie non severe  dans ce cas on ne donne pas de medicament provoquant des allergies moderees soit =1 dans la liste 
  if (input$ALLERGIE2==0) {
    TabbenCours3$RES[which(TabbenCours3["ALLERGIE"]==1)] <- 0
    TabbenCours3$ICON[which(TabbenCours3["ALLERGIE"]==1)] <- "ALLNG" 
  }
  
  
  # Fin Nouveau calcul des winners en tenant compte des allergies  --------------
  
  
  
  
  
  # # # ne pas etre le vainqueur si aucune sensiblite
  
  TabbenCours3$RANK2[which(TabbenCours3["RES"]==0)] <- "" 

  
  TabbenCours3[,] <- TabbenCours3[,] %>%
    # group_by(CLASSE) %>%
    arrange(-RES,LIGNEMATRICE) %>%
    mutate(RANK2 = row_number())
  
  
   # si une seule bacterie resistant à tout les traitements -< avis spécialisé <- pas de vainqueur 
  if (resistant){ 
    TabbenCours3$RANK2 <- ""
    }
  
  # le traitement ne peut être donné si pas de RES = 0 -> pas de traitement par défaut 
  
  TabbenCours3$RANK2[which(TabbenCours3["RES"]==0)] <- "" 
  
  TabbenCours3$ICON[which(TabbenCours3["RANK2"]==1)] <- "WINNER" 

  
  

  
# iteration des winners  
 # On calcule le winner nommé RANK2 
 #  On calcule le winner nommé RANK_WINNER2 ( pour ce calcum on ne prend pas les colonnes des germes déja couverts et des germes NA )
 #  On calcule le winner nommé RANK_WINNER4 ( pour ce calcum on ne prend pas les colonnes des germes déja couverts par RANK2 et WINNERANK2 et des germes NA )
  
  

#   faire dans une boucle ou une fonction mais mieux 


# # Traitement Winner2 ------------------------------------------------------
# 
#   faire pour chaque value  allergie
  
  # apply ne fonctionne pas sur une seule colonne , il faut capter le cas où il ne reste plus que 1 colonne dans le calcul 
  
  TabbenCours3$VIDE <- 0
  
  
  
  
ForRES3 <- "VIDE"
    
tempPA <-  TabbenCours3[((TabbenCours3$PA3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$PA3)) )  , ]

if (nrow(tempPA) == 0 ) {ForRES3 <- c(ForRES3,"PA3")  }
 

tempE <-  TabbenCours3[((TabbenCours3$E3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$E3))), ]
if (nrow(tempE) == 0 ) { ForRES3 <- c(ForRES3,"E3") } 



tempAGN <-  TabbenCours3[((TabbenCours3$AGN3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$AGN3))) , ]
if (nrow(tempAGN) == 0 ) { ForRES3 <- c(ForRES3,"AGN3") } 



tempSCN <-  TabbenCours3[ ( (TabbenCours3$SCN3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$SCN3)) ) , ]

if (nrow(tempSCN) == 0 ) { ForRES3 <- c(ForRES3,"SCN3")}


tempSA <-  TabbenCours3[((TabbenCours3$SA3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$SA3)) ) , ]
 

if (nrow(tempSA) == 0 ) {ForRES3 <- c(ForRES3,"SA3")} 


tempEFEC <-  TabbenCours3[((TabbenCours3$EFEC3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$EFEC3)))  , ]

if (nrow(tempEFEC) ==  0 ) {ForRES3 <- c(ForRES3,"EFEC3")} 



tempEFAE <-  TabbenCours3[((TabbenCours3$EFAE3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$EFAE3)) ) , ]

if (nrow(tempEFAE) == 0 ) {ForRES3 <- c(ForRES3,"EFAE3")} 


tempSTR <-  TabbenCours3[ ( (TabbenCours3$STR3 =="S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$STR3)))  , ]

if (nrow(tempSTR)== 0) {ForRES3 <- c(ForRES3,"STR3")} 


# tempAGP <-  TabbenCours3[!is.na(TabbenCours3$AGP3) & !is.na(TabbenCours3$RANK2) & (TabbenCours3$AGP3 == "S") & (TabbenCours3$RANK2 == 1 )  , ]

tempAGP <-  TabbenCours3[ ((TabbenCours3$AGP3 == "S") & (TabbenCours3$RANK2 == 1 ) & (!is.na(TabbenCours3$AGP3)) ) , ]

if (nrow(tempAGP) ==  0 ) {ForRES3 <- c(ForRES3,"AGP3")} 

# Winner2


 
if (length(ForRES3)>0)
{
TabbenCours3$RES3 <- apply(TabbenCours3[,ForRES3], 1, function(x) length(which(x=="S")))

}
  else 
{
TabbenCours3$RES3 <- 0 }

TabbenCours3$RANK_WINNER2 <- ""

TabbenCours3[,] <- TabbenCours3[,] %>%
  # group_by(CLASSE) %>%
  arrange(-RES3,LIGNEMATRICE) %>%
  mutate(RANK_WINNER2 = row_number())




# si une seule bacterie resistant à tout les traitements -< avis spécialisé <- pas de vainqueur 
# A faire des le debut -> amelioration

if (resistant){ 
  TabbenCours3$RANK_WINNER2 <- ""
}



# ne peux pas etre winner 2 si aucune sensibilite -> pas de traitement possible 
# capter quand plus aucune colonne pour WInner2  tous les germes sont aneanties




TabbenCours3$RANK_WINNER2[which(TabbenCours3["RES3"]==0)] <- "" 
TabbenCours3$ICON3 <- "" 
TabbenCours3$ICON3[which(TabbenCours3["RANK_WINNER2"]==1)] <- "WINNER2" 


# fin de section winner2 --------------------------------------------------

# -------------------insert section winner 4 ------------------------------------------------------

TabbenCours3$VIDE <- 0
ForRES4 <- "VIDE"


# y a il un winner dans iteration precedente  (RANK_WINNER2) 
# si non on garde la colonne  du germe pour le calcul 

temp <-  TabbenCours3[!is.na(TabbenCours3$PA3) & (TabbenCours3$PA3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1))  , ]
if (nrow(temp) == 0 ) { ForRES4 <- c(ForRES4,"PA3")} 


temp <-  TabbenCours3[!is.na(TabbenCours3$E3) & (TabbenCours3$E3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1))  , ]
if (nrow(temp) == 0 ) { ForRES4 <- c(ForRES4,"E3") } 


temp <-  TabbenCours3[!is.na(TabbenCours3$AGN3) & (TabbenCours3$AGN3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp) == 0 ) { ForRES4 <- c(ForRES4,"AGN3")}

temp <-  TabbenCours3[!is.na(TabbenCours3$SCN3) & (TabbenCours3$SCN3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp) == 0 ) { ForRES4 <- c(ForRES4,"SCN3")}


temp <-  TabbenCours3[!is.na(TabbenCours3$SA3) & (TabbenCours3$SA3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp)== 0 ) {ForRES4 <- c(ForRES4,"SA3")} 


temp <-  TabbenCours3[!is.na(TabbenCours3$EFEC3)  & (TabbenCours3$EFEC3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1))  , ]
if (nrow(temp) ==  0 ) {ForRES4 <- c(ForRES4,"EFEC3")} 


temp <-  TabbenCours3[!is.na(TabbenCours3$EFAE3) & (TabbenCours3$EFAE3 =="S") & ( (TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp) == 0 ) {ForRES4 <- c(ForRES4,"EFAE3")} 

temp <-  TabbenCours3[!is.na(TabbenCours3$STR3) & (TabbenCours3$STR3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp)== 0) {ForRES4 <- c(ForRES4,"STR3")} 

temp <-  TabbenCours3[!is.na(TabbenCours3$AGP3) &  (TabbenCours3$AGP3 =="S") & ((TabbenCours3$RANK2 == 1)|(TabbenCours3$RANK_WINNER2 == 1) ) , ]
if (nrow(temp)==  0 ) {ForRES4 <- c(ForRES4,"AGP3")} 

# print(ForRES4)
# Winner2
 

if (length(ForRES4)>1)
{
  TabbenCours3$RES4 <- apply(TabbenCours3[,ForRES4], 1, function(x) length(which(x=="S")))}
else 

{
  TabbenCours3$RES4 <-0 }
 

TabbenCours3$RANK_WINNER4 <- ""

TabbenCours3[,] <- TabbenCours3[,] %>%
# group_by(CLASSE) %>%
  arrange(-RES4,LIGNEMATRICE) %>%
  mutate(RANK_WINNER4 = row_number())


# ne peux pas etre winner 4 si aucune sensibilite -> pas de traitement possible 


# si une seule bacterie resistant à tout les traitements -< avis spécialisé <- pas de vainqueur 
if (resistant){ 
  TabbenCours3$RANK_WINNER4 <- ""
}


TabbenCours3$RANK_WINNER4[which(TabbenCours3["RES4"]==0)] <- "" 
TabbenCours3$ICON4 <- "" 
TabbenCours3$ICON4[which(TabbenCours3["RANK_WINNER4"]==1)] <- "WINNER4" 


# fin de winner 4 ---------------------------------------------------------

 
finish2(TRUE)
  return(list(Tab=TabbenCours3, rest=resistant))
}


fonction_calcul_micro2  <- function () {
  
  VancoEn3 <- FALSE
  TabbenCours4 <- Tableau_TT4[,]

  rownames(TabbenCours4) <- TabbenCours4$SURNOM
  TabbenCours4 <- TabbenCours4[order(TabbenCours4$LIGNEMATRICE),]
  
  # 
  TabbenCours4["VANCO2","CLOS"] <- input$CLOS
  TabbenCours4["AZIT","LEGI"] <- input$LEGI
  TabbenCours4["AZIT","MYCO"] <- input$MYCO
  # 
  
  TabbenCours4$RES4 <- apply(TabbenCours4[,c("CLOS","LEGI","MYCO")], 1, function(x) length(which(x=="1")))

  TabbenCours4$RANK_WINNER4 <- ""
  
  TabbenCours4[,] <- TabbenCours4[,] %>%
    #  #   group_by(CLASSE) %>%
  arrange(-RES4,LIGNEMATRICE) %>%
  mutate(RANK_WINNER4 = row_number())
  
TabbenCours4$RANK_WINNER4[which(TabbenCours4["RES4"]==0)] <- "" 
TabbenCours4$ICON4 <- "" 
TabbenCours4$ICON4[which(TabbenCours4["RANK_WINNER4"]==1)] <- "WINNER4" 
  
  # si un germe est resistant à tout , alors pas de vainqueur 
if (fonction_calcul_micro()$rest ) {TabbenCours4$RANK_WINNER4 <- "" }


if ((input$LEGI==1)&(input$CLOS==1))
  
{VancoEn3 <- TRUE}

if ((input$MYCO==1)&(input$CLOS==1))
  
{VancoEn3 <- TRUE}

  
finish2(TRUE)
  
return(list(Tab=TabbenCours4,VancoEn3=VancoEn3))
 
}


output$Algo2Table <- renderDataTable({
  
  # TABBRES <- fonction_calcul_matrice()
  # 
  
  
  colonnes <- c(liste_des_germes,"LIGNEMATRICE","CLASSE","RES","RES3","RANK2","RANK_WINNER2")
  
  # 
  # 
  # ,"RES4","RANK_WINNER4","WINNER4"
  
  
  TABTOSHOW <- TABMICRO()[,colonnes]
  
  # View(TABTOSHOW)
  uval <- unique(TABTOSHOW[!is.na(TABTOSHOW)])
  
  library(DT)
  options(DT.options = list(pageLength = nrow(TABTOSHOW)))
  
  
  datatable(TABTOSHOW[order(TABTOSHOW$LIGNEMATRICE), ],escape=F) %>% 
    formatStyle(names(TABTOSHOW[-1]),   fontWeight = 'bold',
                color = styleEqual(c("N", uval), 
                                   c('red', rep(NA, length(uval)))))%>%  
    formatStyle(names(TABTOSHOW[-1]),   fontWeight = 'bold',
                color = styleEqual(c("NON", uval), 
                                   c('green', rep(NA, length(uval)))))%>%  
    formatStyle("CLASSE",  target = 'row',
                backgroundColor = styleEqual(c("1","2","3","4"), c("lightyellow","lightblue","white","#9370DB")))%>%  
    formatStyle(names(TABTOSHOW[-1]),   fontWeight = 'bold',
                backgroundColor = styleEqual(c("WINNER", uval), 
                                             c('red', rep(NA, length(uval)))))
  
  
  
  
  
  
})



TABMICRO <- reactive (fonction_calcul_micro()$Tab)

resist <- reactive (fonction_calcul_micro()$rest)

# TABMICRO2 <- reactive (fonction_calcul_micro2()$Tab)
TABMICRO2 <- reactive (fonction_calcul_micro2()$Tab)



Tdur <- reactive (fonction_calcul_duree())









Tdur <- reactive(fonction_calcul_duree())

output$DUREE <- renderText({
  
  res = "calcul de la duree"
  # Tdur <- fonction_calcul_duree()
  
  if (is.na(as.character(Tdur()$DUR[])))
  {
    return("")
    
  }
  else 
  {
    return(as.character(Tdur()$DUR[]))
  }
  
  
  
  
  
  
  
})





output$STRATEGIE <- renderText({
  
  res = "calcul de la strategie"
  
  
  return(as.character(Tdur()$Strategie[]))
  
  
})


output$BOX1OLIVIER <- renderText({
  
  res = "BOX1 OLIVIER"
  # Tdur <- fonction_calcul_duree()
  print(Tdur()$BOX1[])
  if (is.na(as.character(Tdur()$BOX1[])))
  {
    
    return(paste0("TEXT  OLIVIER  vide") )
    
  }
  else 
  {
    return(paste0("TEXT  OLIVIER   ", as.character(Tdur()$BOX1[])))
  }
  
  
  
  
  
  
  
})


output$LIGNE <- renderText({
  
  
  return(paste0("ligne du fichier Excel   ",Tdur()$LIGNE[]))
  
  
  

})


Box_DEBUG  <- 
  fluidRow( 
  box (id="Box_DEBUG_BG",
         actionButton("go", "Take a screenshot")  ,
         dataTableOutput("Algo2Table")))


Box_RESULT_STRATEGIE <- 
  
  fluidRow( 
    box (id="Box_RESULT_STRATEGIE",
         width=12, 
         panel( 
           style = box_debug_style ,
           # style="color: blue;background-color: #white;border-color: #9370DB;",
           "STRATEGIE",
           textOutput("STRATEGIE"))
         
         
         
         
    )
    
  ) 

Box_BOX1_OLIVIER <- 
  
  fluidRow( 
    box (id="Box_BOX1_OLIVIER",
         width=12, 
         panel( 
           style = box_debug_style,
           # style="color: blue;background-color: #white;border-color: #9370DB;",
           "BOX1 OLIVIER",
           textOutput("LIGNE"),
           textOutput("BOX1OLIVIER"))
         
    )
    
  ) 


observeEvent(
  input$info4, {
    shinyalert(text =  tr("TooltipEntero"))               # 
                 # "[E.coli ; Klebsiella ; Enterobacter ; Citrobacter ; Proteus ; Morganella ;Hafnia ... ]")
  })


observeEvent(
  input$info8, {
    shinyalert(text =  tr("TooltipAllergie"))  
  })




observeEvent(
  input$debug2, { 
    insertUI(selector = "#Box_RESULT_STRATEGIE",where ="beforeEnd",  ui = Box_RESULT_STRATEGIE)
    insertUI(selector = "#Box_BOX1_OLIVIER",where ="beforeEnd",  ui = Box_BOX1_OLIVIER)
  }
  , once = TRUE)

observeEvent(input$go, {
  screenshot()
})



BLOC1 <- reactive(fonction_TT_BLOC1)

fonction_TT_BLOC1 <- function (){
  print(input$CL1!=as.character("Choisir"))
  
  messageE2(tr("message2Box1vide"))
  # messageE2("Veuillez renseigner le traitement en cours dans box 1 ")
  validate(need(input$CL1!=as.character("Choisir"),""))
  messageE2("")
  
  
  return(ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL1))])
  }





fonction_calcul_BOX1  <- function (){
  
  res <- "BOX 1 pas calculé"
  
  
  messageE2(tr("message2Box1vide"))
  # messageE2("Veuillez renseigner le traitement en cours dans box 1 ")
  validate(need(input$CL1!=as.character("Choisir"),""))
  messageE2("")
  
  
  BOX2_ENCOURS <- NULL
  
  BOX3_ENCOURS <- NULL
  
  BOX4_ENCOURS <- NULL
  

  
  BOX2_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL2))]
  
  BOX3_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL3))]
  
  BOX4_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL4))]
  
  
  
  # TT tel quel 
  TTBOX1 <- NULL
  
  TTBOX2 <- NULL
  
  TTBOX3 <- NULL
  
  TTBOX4 <- NULL
  
  TTBOX1  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX1R[]))])
  
  TTBOX2  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX2R[]))])
  
  TTBOX3  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX3R[]))])
  
  TTBOX4  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX4R[]))])
  
  
  
  
  if (as.character(Tdur()$BOX1R[])=="IDEM") 
  {
    
    return(as.character(input$CL1))
    
  }  
  
  
  
  
  if (as.character(Tdur()$BOX1R[])=="STOP") 
  {
    
    return("STOP")
    
  }  
  
  
  
  
  # pointage sur un traitement direct 
  
  if (length(TTBOX1)>0) 
  {
    
    res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX1R[]))])
    return (res)
  } 
  
  else
    
  {
    res <- "L'algorithme ne répond pas"
    # calcul par rapport à la box1 
    
    
    
    
    
    RankCL1 <- ATB$RANK[which(ATB["NOM"]==as.character(input$CL1))]
    
 
    
    col <- paste0("RANK",RankCL1)
    
  
    
    leslignesdecoupees <- str_split(as.character(Tdur()$BOX1R[]),"-",simplify=TRUE)
    

  
  
    
    # certains régele ont besoin de TT3 
    messageE2(tr("message2Box3vide"))
              # 
              # "Veuillez renseigner le traitement en cours dans box3  ")
    validate(need(input$CL3>0,""))
    messageE2("")
    
    for (i in 1:ncol(leslignesdecoupees)) {
      # on cherche a ligne qui est NA pour ce Traitement et ce rank 
      
      ligne  <- NULL
      ligne <- leslignesdecoupees[1,i]
 

        # la ligne est une lettre , la box1 est ranké pas aucun pas autre -> matrice 
        if (!(is.na(DESESCALADE[ligne,col])))
        {
          
          result <- as.character(DESESCALADE[ligne,col]) 
          
        
          
          if (result=="IDEM")  
          {
            
            return(as.character(input$CL1))
          }
          
          if (result=="RANK3")  
          {
            res <- "RANK 3 à détailler"
            
            return(res)
          }
          
          if (result=="AVIS")  
          {
            res <- "Avis spécialisé"
            
            return(res)
          }
          
          if (as.character(ATB$NOM[which(ATB["SURNOM"]==result)])>0)  
          {
            return(as.character(ATB$NOM[which(ATB["SURNOM"]==result)]))
          } 
          
          return(paste0("Problèmes lecture de la ligne ", ligne, col) )
          
        }
      
      
      # print(leslignesdecoupees[1,i])
      
      
      
      
      
      if (leslignesdecoupees[1,i]=="R11")  {
        # Si BLOC1 = RANK 4 ET BLOC3 vide -> IMIPENEM (TIENAM) 1 g IV x 3/j 
         
   
        
        if ((RankCL1==4)&(as.character(input$CL3)==as.character("Aucun"))) {
          print(leslignesdecoupees[1,i])
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="IMIP")])
          return(res)
        } 
      }
      
      
      
      if (leslignesdecoupees[1,i]=="R12")  {
        # R12	 Si RANK 4 ET BLOC3 plein -> Avis spécialisé
        
        
         
        
        
        
        
        if ((RankCL1==4)&(as.character(input$CL3)!=as.character("Aucun"))&(as.character(input$CL3)!=as.character("Autre"))) {
          res <- "Avis spécialisé"
          return(res)
        } 
        
        
      }
      
      
      
      if (leslignesdecoupees[1,i]=="R13")  {
        # R13	 Si RANK 5  -> Avis spécialisé
        
        print(leslignesdecoupees[1,i])
        if (RankCL1==5) {
          res <- "Avis spécialisé"
          return(res)
        }
      }
      
      
      
      
      #  la condition 
      if (leslignesdecoupees[1,i]=="R14")  {
        
        if (as.character(input$CL1)==as.character("Autre")) {
          res <- "L'algorithme ne répond pas "
          return(res)
        }
      }
      
      if (leslignesdecoupees[1,i]=="R15")  {
        if (as.character(input$CL1)==as.character("Aucun")) {
          res <- "L'algorithme ne répond pas "
          return(res)
        }
      }
      
      if (leslignesdecoupees[1,i]=="R16") {
        # 
        
        # print(leslignesdecoupees[1,i])
        if (RankCL1==5) {
          res <- "Non défini"
          return(res)
        }
      }
      
      
      
      
      
      # print(leslignesdecoupees[1,i])
      
      
      # R171 Si BLOC1 = TAZOCILLINE  -> IDEM
      
      
      if (leslignesdecoupees[1,i]=="R171")  {
        
        
        
        if (as.character(input$CL1)==as.character("Piperacilline-tazobactam")) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="PIPETAB")])
          return(res) 
        }
      }
      
      # R172	 Si BLOC1 = CEFEPIME -> IDEM							
      
      
      
      if (leslignesdecoupees[1,i]=="R172")  {
        
        if (as.character(input$CL1)==as.character("Cefepime")) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="CEFE")])
          return(res) 
        }
      }
      
      # R173	 Si BLOC1 =   AZACTAM -> IDEM							
      
      
      
      
      if (leslignesdecoupees[1,i]=="R173")  {
        
        if (as.character(input$CL1)==as.character("Aztreonam")) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="AZTR")])
          return(res) 
        }
        
      }
      
      
      
      
      # R18	Si BLOC1 =  CEFTAZIDIME -> CEFEPIME (AXEPIM) 2 g IV x 3/j					
      
      
      if (leslignesdecoupees[1,i]=="R18")  {
        
        if (as.character(input$CL1)==as.character("Ceftazidime")) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="CEFE")])
          return(res)
        }
        
        
      }
      
      
      # R19 Si BLOC1 = TAZOCILLINE ou CEFEPIME ou CEFTAZIDIME -> CEFEPIME (AXEPIM) 2 g IV x 3/
      
      if (leslignesdecoupees[1,i]=="R19")  {
        # 
        if ((as.character(input$CL1)==as.character("Piperacilline-tazobactam"))|
            (as.character(input$CL1)==as.character("Cefepime"))|
            (as.character(input$CL1)==as.character("Ceftazidime"))
        ) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="CEFE")])
          return(res)
        }
        
        
        
        
      }
      
      
     
      
      
      
      
    }
  } 

} 

box1 <-  reactive(as.character(fonction_calcul_BOX1()))

calculbloc1 <- FALSE
calculbloc2 <- FALSE
calculbloc3 <- FALSE
calculbloc4 <- FALSE

 
res2 <- "non calculé"
res3 <- "non calculé"
res4 <- "non calculé"



res1  <- function (){

BLOC1()

res <- "Non calculable"

if (as.character(Tdur()$Strategie[])=="MATRICE")
  
{
    
   if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==1))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==1))]}
  #    
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==1))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==1))] }
  
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==1))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==1))]  }
  
  
  else if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {"Aucun"}
  
  else     if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1))]))==0)
  {
    "Avis Spécialisé" }
  
  
  
  
  # on a parcouru toutes les possiblités et rien trouvé à donner mais il y a un traitement en cours alors STOP 
  else  if (ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL1))]>0)
  {
    "STOP"
  }  
  
}
else 
{
  
  res <- "Calcul non finalisé"
  
  tryCatch(
    res <- box1()
  )
}

}

output$TextresultAlgo_des_TT1 <- renderText({
 
  res1()
 
})
      
      
     



output$TextresultAlgo_poso_TT1 <- renderText({
  

  tryCatch(
           res <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(res1()))])
    )
 
})







res2  <- function (){


res <- "Non calculable"

if (as.character(Tdur()$Strategie[])=="MATRICE")
{
  
  
  # 
  # issue #84 : finalement le WINNER4 est un wWInner dans sa propore classe uniquement 

  # 
  
    
    
    if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==2))]}
  #    
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==2))] }
  
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==2))] }
  
  # pas de winner dans tt1 et pas de winner dans tt2 
  
  else     if ((length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1))]))==0)&(length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1))]))==0))
  {
    "Avis Spécialisé" }
  # 
  
  
 else  if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {"Aucun"}
 
  # pas de réponse dans la matrice mais un traitement en cours -> STOP 
  
  else  if (as.character(input$CL2)!=as.character("Aucun"))
  {
    "STOP"
  }
  
  
}


# res <- "Strategie en cours de Programmation dans cette box "

else 
{
  
  
  
  res <- box2()
  
}

}




fonction_calcul_BOX2  <- function () {
  
  res <- "Box2 non calculé "
  
  
  BLOC1()
  
  BOX2_ENCOURS <- NULL
  
  BOX3_ENCOURS <- NULL
  
  BOX4_ENCOURS <- NULL
  
 
  
  BOX2_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL2))]
  
  BOX3_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL3))]
  
  BOX4_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL4))]
  
  
  
  
  
  
  
  # TT tel quel 
  TTBOX1 <- NULL
  
  TTBOX2 <- NULL
  
  TTBOX3 <- NULL
  
  TTBOX4 <- NULL
  
  TTBOX1  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX1R[]))])
  
  TTBOX2  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX2R[]))])
  
  TTBOX3  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX3R[]))])
  
  TTBOX4  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX4R[]))])
  
  
  
  
  
  if (as.character(Tdur()$BOX2R[])=="IDEM") 
  {
    
    return(as.character(input$CL2))
    
  }  
  
  
  
  
  if (as.character(Tdur()$BOX2R[])=="STOP") 
  {
    
    return("STOP")
    
  }  
  
  
  
  
  # pointage sur un ttraitement direct 
  
  if (length(TTBOX2)>0) 
  {
    
    
    res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX2R[]))])
    return (res)
  } 
  
  else
    
  {
    
    
    # on éclate la chaine qui se trouve dans la matrice 
    
    
    lesreglesdecoupees <- str_split(as.character(Tdur()$BOX2R[]),"-",simplify=TRUE)
    
    # saisie obligatoire y compris aucun
    
    
    
    
    
    
    
    for (i in 1:ncol(lesreglesdecoupees)) {
      # on cherche a ligne qui est NA pour ce Traitement et ce rank 
      
      
      
      
      # print(leslignesdecoupees[1,i])
      # if ((RankCL1==4)&&(as.character(input$CL3)!=as.character("Aucun"))&&(as.character(input$CL3)!=as.character("Autre"))) {
      # 
      
      if (lesreglesdecoupees[1,i]=="R21")  {
        # box2 pleine
        
        
        if (as.character(input$CL2)!=as.character("Aucun"))
        {
          res <-"STOP"
          return(res)
        } 
        else 
        {
          res <-""
          return(res)
        } 
      }
      
      
      if (lesreglesdecoupees[1,i]=="R22")  {
        # box2 vide Aucun ou meme vide 
        
        
        
        if (as.character(input$CL2)==as.character("Aucun"))
        {
          
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]=="AMIK")])
          return(res)
          
        } 
        else
          
          # regle R23
        {
          res <-"Avis Spécialisé"
          return(res)
        }
        
      } 
      
      
      
    } 
    
    return(res)
  } 
} 



box2 <-  reactive(as.character(fonction_calcul_BOX2()))



output$TextresultAlgo_des_TT2 <- renderText({
  
  
  res2()
  
  
})




output$TextresultAlgo_poso_TT2 <- renderText({
  
  
  tryCatch(
    res <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(res2()))])
  )
  # 
  # res <- "Non calculable"
  # 
  # if (as.character(Tdur()$Strategie[])=="MATRICE")
  # {
  #   
  #   if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {"Aucun"}
  #   
  #   else if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  #   {TABMICRO()$POSO[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==2))]}
  #   #    
  #   else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  #   {TABMICRO()$POSO[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==2))] }
  #   
  #   else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==2))]))==1)
  #   {TABMICRO()$POSO[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==2))] }
  #   
  #   
  #   
  # 
  #   
  #   # res <- "Strategie en cours de Programmation dans cette box "
  #   
  # }
  # else 
  # {
  #   res <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(box2()))])
  # }
  # 
  # 
  
})



fonction_calcul_BOX3  <- function () {
  
  res <- ""
  
  
  BLOC1()
 
  
  BOX2_ENCOURS <- NULL
  
  BOX3_ENCOURS <- NULL
  
  BOX4_ENCOURS <- NULL
  

  
  BOX2_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL2))]
  
  BOX3_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL3))]
  
  BOX4_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL4))]
  
  
  
  
  
  
  
  # TT tel quel 
  TTBOX1 <- NULL
  
  TTBOX2 <- NULL
  
  TTBOX3 <- NULL
  
  TTBOX4 <- NULL
  
  TTBOX1  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX1R[]))])
  
  TTBOX2  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX2R[]))])
  
  TTBOX3  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX3R[]))])
  
  TTBOX4  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX4R[]))])
  
  
  
  
  
  if (as.character(Tdur()$BOX3R[])=="IDEM") 
  {
    
    return(as.character(input$CL3))
    
  }  
  
  
  
  
  if (as.character(Tdur()$BOX3R[])=="STOP") 
  {
    
    return("STOP")
    
  }  
  
  
  
  
  # pointage sur un traitement direct 
  
  if (length(TTBOX3)>0) 
  {
    
    res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX3R[]))])
    return (res)
  } 
  
  else
    
  {
    
    
    # on éclate la chaine qui se trouve dans la matrice 
    
    
    lesreglesdecoupees <- str_split(as.character(Tdur()$BOX3R[]),"-",simplify=TRUE)
    
    # saisie obligatoire y compris aucun
    
    #  saisie obligatoire du Ttraitement box 1 , mais le message devrait etre levé de façon correct directement dans box1 
    #  paratge des variables de TT1 entre les fonctions , amélirations +++ 
    messageE2(tr("message2Box1vide"))
    # messageE2("Veuillez renseigner le traitement en cours dans box 1 ")
    validate(need(input$CL1!=as.character("Choisir"),""))
    messageE2("")
    
    # messageE2("Veuillez renseigner le traitement en cours dans box3  ")
    messageE2(tr("message2Box3vide"))
    validate(need(input$CL3>0,""))
    messageE2("")
    
    
    for (i in 1:ncol(lesreglesdecoupees)) {
      
    
    if (lesreglesdecoupees[1,i]=="R30")  {
      
      if (as.character(input$CL3)==as.character("Aucun")) {
        res <- ""
        return(res)
      }
    } 
      
      if (lesreglesdecoupees[1,i]=="R31")  {
        
        if (as.character(input$CL3)!=as.character("Aucun"))
        {
          res <-"STOP"
          return(res)
        } 
        else 
        {
          res <-""
          return(res)
        } 
      }
      
      if (lesreglesdecoupees[1,i]=="R32")  {
        # box  3 en cours est Aucun   
        
        
        if (as.character(input$CL3)==as.character("Aucun") )
        {
          
          
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
          
          
          
          return(res)
        } 
        
        
      } 
      
      if (lesreglesdecoupees[1,i]=="R33")  {
        
        
        # box  3 en cours est pas Aucun 
        if (as.character(input$CL3)!=as.character("Aucun"))
        {
          res <-"Avis Spécialisé"
          return(res)
        } 
        
      } 
      
      
      TTvalable <- NULL
      # ajouter un try catch ici pour eviter le méssage d'errur dans l abox 
      
      
      tryCatch(
        
        TTvalable  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(box1()))])
        
      )
      
      
      condbox1 <- isTRUE(TTvalable>0)
      
      
      
      if (lesreglesdecoupees[1,i]=="R34")  {
        # calculable que si box1 est pleine 
        
        
        
        if (condbox1) {
          res <- "L'algorithme ne répond pas"
          if ((as.character(input$CL3)!=as.character("Aucun"))&(as.character(box1())==as.character("Aztreonam")))
          {
            res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
            
            return(res)
          } 
          # 
        } 
        
       
        
        
        
      } 
      
      
      if (lesreglesdecoupees[1,i]=="R35") {
        # calculable que si box1 est pleine 
        if (condbox1) { 
          
          
          
          if ((as.character(input$CL3)!=as.character("Aucun"))&(as.character(box1())!=as.character("Aztreonam")))
          {
            res <- "STOP"
            return(res)
          } 
          
          
          
        } 
        else 
        {
          
          res <- "L'algorithme ne répond pas"
          return(res)
        }
        
        
      } 
      
      
      
      
      if (lesreglesdecoupees[1,i]=="R36")  {
        
        
        
        if (as.character(input$CL3)!=as.character("Aucun"))
        {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
          return(res)
          
        } 
        
      } 
      
      # R361	 Si BLOC3 plein ET Si Box 1=! AZACTAM ->  "Avis spécialisé"									
      
      if (lesreglesdecoupees[1,i]=="R361")  {
        
        
        
        if ((as.character(input$CL3)!=as.character("Aucun"))&(as.character(box1())!=as.character("Aztreonam")))
        {
          res <- "Avis spécialisé"	
          return(res)
          
        } 
        
      } 
      
      
      
      
      if (lesreglesdecoupees[1,i]=="R37")  {
        if (condbox1) { 
          if (as.character(box1())==as.character("Aztreonam"))
          {
            res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
            return(res)
          } 
          
          
          
        } 
      }  
      
      if (lesreglesdecoupees[1,i]=="R38")  {
        
        if (as.character(input$CL3)!=as.character("Aucun")) {
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
          return(res)
        }
      } 
      
      
      
      # R39	Si BLOC3=AUCUN ET Si Box 1=! AZACTAM ->  VIDE					
      
      
      if (lesreglesdecoupees[1,i]=="R39")  {
        
        if ((as.character(input$CL3)==as.character("Aucun")&(as.character(box1())!=as.character("Aztreonam")))) {
          res <- ""
          return(res)
        }
      } 
      
      
      
      if (lesreglesdecoupees[1,i]=="R398")  {
        
        if ((as.character(input$CL3)==as.character("Aucun")&(as.character(box1())==as.character("Aztreonam")))) {
          res <- "L'algorithme  ne répond pas"
          return(res)
        }
      } 
      
      
      if (lesreglesdecoupees[1,i]=="R399")  {
        
        if (as.character(input$CL3)==as.character("Aucun")) {
          res <- "L'algorithme  ne répond pas"
          return(res)
        }
      } 
      
      
      if (lesreglesdecoupees[1,i]=="R397")  {
        # calculable que si box1 est pleine 
        
      
        
        if (condbox1) {
          res <- "L'algorithme ne répond pas"
          if ((as.character(box1())==as.character("Aztreonam")) || (as.character(box1())==as.character("Ceftazidime")))
          {
            
            res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("VANCO"))])
            
            return(res)
          } 
          
          
         else if (as.character(input$CL3)!=as.character("Aucun"))
          {
            res <- "STOP"
            return(res)
          }
        }  
          # 
       
        else
        {
          
          
          if ((as.character(input$CL3)!=as.character("Aucun")))
          {
            res <- "STOP"
            return(res)
          }
        } 
        
        } 

      
   
  } 
  
  }  
  
}  



box3 <-  reactive(as.character(fonction_calcul_BOX3()))


res3  <- function (){

  
  res <- "Non calculable"
if (as.character(Tdur()$Strategie[])=="MATRICE")
{
  

  
 
  
   if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==3))]}
  #    
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==3))] }
  
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==3))] }
  
  
 else  if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {
    
    if (fonction_calcul_micro2()$VancoEn3)
      # VANCO2 nécessaire pour les matrice extra , il faut afficher dans cette box 
      # if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RES4"]>0)&(TABMICRO2()["SURNOM"]=="VANCO2"))]))==1)
      #   remplacer par la la variable 
      
    {TABMICRO2()$NOM[which(TABMICRO2()["SURNOM"]=="VANCO2")] } 
    else 
    {
      
      "Aucun"
    }
  }
  
  else     if ((length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1))]))==0)&(length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1))]))==0))
  {
    "Avis Spécialisé" }
  
  
  else  if (as.character(input$CL3)!=as.character("Aucun"))
  {
    "STOP"
  }
  
}
else 
{
  
  
  res <- box3()
  
}

}


output$TextresultAlgo_des_TT3 <- renderText({
  
res3()
  # 
  # if (as.character(Tdur()$Strategie[])=="MATRICE")
  # {
  # 
  #   #  test si un winner dans  table micro2 ? 
  #   # les 3 bactéries matrice extra   sont lues dans TABMICRO2 : elles prédominenet sur le reste de la matrice pour la classe 4 et VANCO2  doit afficher dans la box 3
  #  
  #   
  #   
  # 
  #   if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {
  #     
  #     
  #     # VANCO2 nécessaire pour les matrice extra , il faut afficher dans cette box 
  #     if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RES4"]>0)&(TABMICRO2()["SURNOM"]=="VANCO2"))]))==1)
  #       
  #       
  #       
  #     {TABMICRO2()$NOM[which(TABMICRO2()["SURNOM"]=="VANCO2")] } 
  #     else 
  #     {
  #       
  #       "Aucun"
  #     }
  #   }
  #   
  #  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  #   {TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==3))]}
  #   #    
  #   else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  #   {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==3))] }
  #   
  #   else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==3))]))==1)
  #   {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==3))] }
  #   
  # 
  #   else  if (as.character(input$CL3)!=as.character("Aucun"))
  #   {
  #     "STOP"
  #   }
  #   
  # }
  # else 
  # {
  #   
  #   
  #   res <- box3()
  #   
  # }
  # 
  
  
})



output$TextresultAlgo_poso_TT3 <- renderText({
  
  tryCatch(
    res <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(res3()))])
  )
 
})



fonction_calcul_BOX4  <- function () {
  
  res <- ""
  
  BLOC1()

  
  BOX2_ENCOURS <- NULL
  
  BOX3_ENCOURS <- NULL
  
  BOX4_ENCOURS <- NULL
  

  
  BOX2_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL2))]
  
  BOX3_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL3))]
  
  BOX4_ENCOURS <- ATB$SURNOM[which(ATB["NOM"]==as.character(input$CL4))]
  
  
  # TT tel quel 
  TTBOX1 <- NULL
  
  TTBOX2 <- NULL
  
  TTBOX3 <- NULL
  
  TTBOX4 <- NULL
  
  TTBOX1  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX1R[]))])
  
  TTBOX2  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX2R[]))])
  
  TTBOX3  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX3R[]))])
  
  TTBOX4  <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX4R[]))])
  
  
  
  
  
  
  
  # pointage sur un ttraitement direct 
  
  if (length(TTBOX4)>0) 
  {
    
    res <-  "on pointe un TT directement mais pas trouvé"
    res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(Tdur()$BOX4R[]))])
    return(res)
  } 
  
  else
    
  {
    
    
    # on éclate la chaine qui se trouve dans la matrice 
    lesreglesdecoupees <- NULL
    
    
    
    if (is.na(as.character(Tdur()$BOX4R[])))  {return(res)} 
    
    
    
    
    lesreglesdecoupees <- str_split(as.character(Tdur()$BOX4R[]),"-",simplify=TRUE)
    
    
    
    
    for (i in 1:ncol(lesreglesdecoupees)) {
      # on cherche a ligne qui est NA pour ce Traitement et ce rank 
      
      regle  <- NULL
      regle <- lesreglesdecoupees[1,i]
      
      
      
      if (regle=="R41")  {
       res <-"AZITHROMYCINE (ZITHROMAX) 500 mg PO (IV si PO impossible)/j"
        return(res)
     
      }
      
      
      if (regle=="R42")  {
        
        res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("METRO"))])
        return(res)
      } 
      
      
  
      
      if (regle=="R44")  {
        # 
        if (as.character(box1())==as.character("Levofloxacine"))
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("METRO"))])
        return(res)
        
      } 
      
      
      if (regle=="R45")  {
        # 
        if (as.character(box1())==as.character("Cefotaxime"))
          res <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character("METRO"))])
        return(res)
        
      } 
      
      
      
      
      if (lesreglesdecoupees[1,i]=="R46")  {
        res <-""
     
        
        if (as.character(input$CL4)!=as.character("Aucun"))
        {
          res <-"STOP"
        
        } 

        if (as.character(input$CL4)==as.character(""))
        {
          res <-""
          
        } 
        
        
        return(res)
        
      }
      
      
      if (regle=="R47")  {
        # 
        if (as.character(box1())!=as.character("Cefotaxime"))
          res <-  ""
        return(res)
        
      } 
      
      if (regle=="R48")  {
        # 
        if (as.character(box1())!=as.character("Levofloxacine"))
          res <-  ""
        return(res)
        
      } 
      
      
    }
    
    
    return(res)
    
    
  } 
  
  
}   

box4 <-  reactive(as.character(fonction_calcul_BOX4()))


res4  <- function (){

res <- "Non calculable"

if (as.character(Tdur()$Strategie[])=="MATRICE")
{
  
  
  
  # les 3 bactéries matrice extra   sont lues dans TABMICRO2 : elles prédominenet sur le reste de la matrice pour la classe 4
  if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RANK_WINNER4"]==1)&(TABMICRO2()["CLASSE"]==4))]))==1)  {
    
    
    #    
    if (length(as.character(TABMICRO2()$NOM[which((TABMICRO2()["RES4"]>0)&(TABMICRO2()["SURNOM"]=="AZIT"))]))==1)
      
      
    {TABMICRO2()$NOM[which(TABMICRO2()["SURNOM"]=="AZIT")] } 
    
    else 
    {
      
      {TABMICRO2()$NOM[which(TABMICRO2()["SURNOM"]=="VANCO2")] } 
    }
  }
  
  else     if ((length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1))]))==0)&(length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1))]))==0))
  {
    "Avis Spécialisé" }
  # 
  
  
  
  
  else if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==4))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK2"]==1)&(TABMICRO()["CLASSE"]==4))]}
  #    
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==4))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER2"]==1)&(TABMICRO()["CLASSE"]==4))] }
  
  # en principe pas de winner 4 dans la matrice principale 
  else  if (length(as.character(TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==4))]))==1)
  {TABMICRO()$NOM[which((TABMICRO()["RANK_WINNER4"]==1)&(TABMICRO()["CLASSE"]==4))] }
  
  
  
  else  if (as.character(input$CL4)!=as.character("Aucun"))
  {
    "STOP"
  }
  
  
  # res <- "Strategie en cours de Programmation dans cette box "
  
}
else 
{
  
  
  
  res <- box4()
  
}
}

output$TextresultAlgo_des_TT4 <- renderText({
  
  
  res4()
 
  

  
})



output$TextresultAlgo_poso_TT4 <- renderText({
  
  
  tryCatch(
    res <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(res4()))])
  )
  
})


box5 <-  reactive(as.character(fonction_calcul_BOX5()))

fonction_calcul_BOX5  <- function () {
  
  
  
  
  
  if (as.character(Tdur()$Strategie[])=="MATRICE")
  {
    
    
    return("")
    
  }
  

  
  TTvalable <- NULL
  # ajouter un try catch ici pour eviter le méssage d'errur dans l abox 
  
  
  tryCatch(
    
    TTvalable  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(box1()))])
    
  )
  
  
  condbox1 <- isTRUE(TTvalable>0)
  
  
  # si les recommandations e tles recommandations conditionnelles sont nulles , les recommandantions sont vides
  
  if (is.na(as.character(Tdur()$BOX5[]))&(is.na(as.character(Tdur()$BOX5R[]))))
  {
    
    
    return("")
    
  }
  else 
  {
  
    
    text  <- NULL

    textcompl <-NULL
    
    
    if (!is.na(as.character(Tdur()$BOX5[])))
    
    {     
      
      text <-  as.character(Tdur()$BOX5[])
      text <- AjouteRetour(text)
      
    }
      
      if (!is.na(as.character(Tdur()$BOX5R[])))
      
      
      {    
      lesreglesdecoupees <- str_split(as.character(Tdur()$BOX5R[]),"-",simplify=TRUE)
      
  
      
      for (i in 1:ncol(lesreglesdecoupees)) {
        
     
        if (lesreglesdecoupees[1,i]=="BOX5R1")  {
          
         
          if (condbox1) 
          { 
          
         if  (as.character(box1())==as.character("Piperacilline-tazobactam"))  {   
           
           textcompl <- AjouteRetour(textcompl) 
           
           textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R1")])
           
           }
              
          }
          
          
        }
        

        if (lesreglesdecoupees[1,i]=="BOX5R2")  {
          
          if (condbox1) 
          { 
          
      
          
          if  (as.character(box1())==as.character("Piperacilline-tazobactam"))  {   
            
            textcompl <- AjouteRetour(textcompl) 
            
            textcompl <-  paste(textcompl, RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R2")])
            
          }
          
          }
          
          
        }
        
        
        
        if (lesreglesdecoupees[1,i]=="BOX5R3")  {

          
          if (condbox1) 
          { 
            
          
          if  (as.character(box1())==as.character("Piperacilline-tazobactam"))  {   
           
            textcompl <- AjouteRetour(textcompl) 
            
            textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R3")])
              
           
            
          }
            
          }
          
          
          
        }

        
        if (lesreglesdecoupees[1,i]=="BOX5R4")  {
          
       
          
          
          if (condbox1)
          { 
          if  (as.character(box1())==as.character("Imipenem"))  {   
            
            textcompl <- AjouteRetour(textcompl) 
            
            textcompl <-  paste(textcompl, RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R4")])
            
          }
          }
          
          
          
        }  
        
        
        
        if (lesreglesdecoupees[1,i]=="BOX5R5")  {
          if (condbox1)
          { 
            if ((as.character(box3())==as.character("Vancomycine IV")))
           
            textcompl <- AjouteRetour(textcompl) 
            
            textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R5")])
            
          }
        }
        
        
        if (lesreglesdecoupees[1,i]=="BOX5R6")  {
       
            
            RankCL1 <- ATB$RANK[which(ATB["NOM"]==as.character(input$CL1))]
            
            
          
            if ( (RankCL1 ==0)|(RankCL1 ==1)|(RankCL1 ==2))
              
                 { 
             
              textcompl <- AjouteRetour(textcompl) 
              
              textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R6")])
              
        
        }
        
        
        
        if (lesreglesdecoupees[1,i]=="BOX5R7")  {
        if (condbox1)
        { 
        if ((as.character(input$CL3)!=as.character("Aucun"))&(as.character(box1())!=as.character("Aztreonam")))
          
        textcompl <- AjouteRetour(textcompl) 
        
        textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R7")])
        
        }
      }
 
      
      
        
      
        
        
        
      } 
      
  
          
          if (lesreglesdecoupees[1,i]=="BOX5R7")  {
            if (condbox1)
            { 
              if ((as.character(input$CL3)!=as.character("Aucun"))&(as.character(box1())!=as.character("Aztreonam")))
                
              textcompl <- AjouteRetour(textcompl) 
              
              textcompl <-  paste(textcompl,RECOMCOND$TEXT[which(RECOMCOND["REGLE"]=="BOX5R7")])
              
            }
          }
          
          
        
          
      
   
    }
   
   
    
   
  }
  
   
  
  }   
  
  
  # HTML(paste("hello", "world", sep="<br/>"))
  # 
  return(HTML(paste(text,textcompl)))
  # return(paste(text, textcompl))
}   





output$TextresultAlgo_Box5 <- renderText({
  
  
  
  res <- box5()
  
})  





output$ERROR2 <- renderText({
  messageE2()
})



output$question2Allergie<- renderText({
  
  tr("Question2Allergie")
}) 


output$question2Docum<- renderText({
  
  tr("Question2Docum")
}) 


 


output$question2CSI<- renderText({
  
  tr("Question2CSI")
}) 



output$question2AggC<- renderText({
  
  tr("Question2AggC")
}) 



output$question2CSA  <- renderText({
  
  tr("Question2CSA")
}) 







output$question2CliniqueIdentMicro <- renderText({
  
  tr("QuestionCliniqueIdent")
}) 



output$question2CliniqueIdent1 <- renderText({
  
  tr("QuestionCliniqueIdent")
}) 





output$question2CliniqueIdent2 <- renderText({
  
  tr("QuestionCliniqueIdent")
}) 





output$question2SAplasie<- renderText({
  
  tr("Question2SAplasie")
}) 


output$question2Fievre<- renderText({
  
  tr("Question2Fievre")
}) 


output$question2AmelC<- renderText({
  
  tr("Question2AmelC")
}) 


output$tooltipAllergie<- renderText({
  
  tr("TooltipAllergie")
}) 




    
    
    
    # varAutres  <- if (input$autres==0)  {"OUI"} else  {"NON"}

    
    
    






output$finisher2 <- reactive({
  return(finish2()) 
}
)




output$messageNotEmpty2 <- reactive({
  return(!(messageE2()==""))
})


outputOptions(output, "finisher2", suspendWhenHidden = FALSE)
outputOptions(output, "messageNotEmpty2", suspendWhenHidden = FALSE)



 




observeEvent(rv2$download_flag2, {
  
output$report2 <- downloadHandler(

  
  lenomdufichier2 <- filename2(),
  
 
  content = function(file) {
    

    
    tempReport <- file.path(tempdir(), "algo2.Rmd")
    file.copy("algo2.Rmd",tempReport,overwrite= TRUE)
    e2 <- new.env()
    
    
    e2$parametre <-list(docname =lenomdufichier2)
    
    
    e2$listeparEncours <- 
      list( 
        class1 = NAMES_L1 ,
      ttencours1 =   as.character(input$CL1),
      class2 = NAME_L2,
      ttencours2 =   as.character(input$CL2),
      class3 = NAME_L3,
      ttencours3 =   as.character(input$CL3),
      class4 = NAME_L4,
      ttencours4 =   as.character(input$CL4)
      )
    
    
    
    e2$listepar <- list(
      class1 = NAMES_L1 ,
      tt1 = res1(),
      poso1 = tryCatch(
        as.character(ATB$POSO[which(ATB["NOM"]==as.character(res1()))])
      )      ,
      class2 = NAME_L2,
      tt2 = res2(),
      poso2=   tryCatch(
        as.character(ATB$POSO[which(ATB["NOM"]==as.character(res2()))])
      ),
      class3 = NAME_L3,
      tt3 =  res3(),
      poso3 =  tryCatch(
        as.character(ATB$POSO[which(ATB["NOM"]==as.character(res3()))])
      ),
      class4 = NAME_L4,
      tt4 = res4(),
      poso4 =   tryCatch(
        as.character(ATB$POSO[which(ATB["NOM"]==as.character(res4()))])
      ),
      
      reco =  tryCatch(as.character(box5())) ,
  
      duree = tryCatch(as.character(Tdur()$DUR[]))
      )
    
    
    varPen2 <-  varDOCUMICRO <- varFI  <- varCSINIT  <-  varAC <- varFCICS <-  varAGGRAV <-   varCS <- varFCI2  <- varSAPPLA <-  varFIEVRE <-  NULL
    
   
    
    if (input$DOCUMICRO==0) 
    {   
      
     lavarFI <- if (length(input$FI)>0)  {switch(input$FI,  
                                                "1"="Bactériémie isolée",
                                                "2"= "Poumon",
                                                "3"="Urines",
                                                "4"="Digestif",
                                                "5"= "Peau",
                                                "6"="Autre")}
      lavarCSINIT <-  lavarAC <- lavarFCICS <-  lavarFCICS_P <- lavarFCICS_D <- lavarAGGRAV <-  lavarCS <-    lavarFCI2 <-  lavarSAPPLA <-   lavarFIEVRE <-  NULL
      
      
      
      
      
      
  
    }
    
    else 
      
    { 
    lavarFI <- NULL 
    
  
    lavarCSINIT <- if (length(input$CSINIT)>0) {switch(input$CSINIT,"0"="Oui","1"="Non","")}
    lavarAC <- if (length(input$AC)>0) {switch(input$AC,"1"="Oui","0"="Non","")}
    
    lavarFCICS <- NULL  
    lavarFCICS_P <- NULL 
    lavarFCICS_D <- NULL 
    
    if ((length(input$CSINIT)>0)&(length(input$AC)>0))  {
      if ((input$CSINIT==0)&(input$AC==1))
        
      {   
        
        lavarFCICS <- if (length(input$FCICS)>0)  {switch(input$FCICS, "0"="Aucun",
                                                          "1"="Poumon",
                                                          "3"="Digestif",
                                                          "4"="Cathéter veineux central",
                                                          "5"="Périnée",
                                                          "6"="Cutané (autre que cathéter central ou périnée)",
                                                          "7"="Autre","")}
        
        
        lavarFCICS_P <- if (length(input$FCICS_P)>0)  {switch(input$FCICS_P,"0"="Oui","1"="Non","")} 
        lavarFCICS_D <- if (length(input$FCICS_D)>0)  {switch(input$FCICS_D,"0"="Oui","1"="Non","")} 
      }
      
    
      
    }   
    
    
    lavarFCI2 <- NULL 
    
    if ((length(input$CSINIT)>0)&(length(input$AGGRAV)>0))    
    {  
      if ((input$CSINIT==1)&(input$AGGRAV==1))
      {   
        lavarFCI2 = if (length(input$FCI2)>0)  {switch(input$FCI2,"0"="Aucun",
                                                        "1"="Poumon",
                                                        "3"="Digestif",
                                                        "5"="Périnée",        
                                                        "6"="Cutané","")}
      }
      
      
      
      
    }
    
    
  
    
   
    lavarAGGRAV <- if (length(input$AGGRAV)>0) {switch(input$AGGRAV,"0"="Oui","1"="Non","")}
    lavarCS <- if (length(input$CS)>0)   {switch(input$CS,"0"="Oui","1"="Non","")}

    lavarSAPPLA <- if (length(input$SAPPLA)>0)  {switch(input$SAPPLA,"0"="Oui","1"="Non","") }
    lavarFIEVRE <-  if (length(input$FIEVRE)>0)  { switch(input$FIEVRE,"0"="Oui","1"="Non","")}
    } 
    
    
    
    
    e2$listeparSaisie <- list(
      logname = logname ,
      varPen2 =  if (length(input$ALLERGIE2>0)) {switch(input$ALLERGIE2,"2"="Non","0"="Non sévère","1"="Sévère","")} ,
      varDOCUMICRO = if (length(input$DOCUMICRO>0)) {switch(input$DOCUMICRO,"0"="Oui","1"="Non","")},
      varFI = lavarFI,
      varCSINIT = lavarCSINIT,
      varAC = lavarAC,
      varFCICS = lavarFCICS,
      varFCICS_P = lavarFCICS_P,
      varFCICS_D = lavarFCICS_D,
      varAGGRAV = lavarAGGRAV,
      varCS = lavarCS,
      varFCI2 = lavarFCI2,
      varSAPPLA = lavarSAPPLA,
      varFIEVRE = lavarFIEVRE 
    ) 


    
    rmarkdown::render('algo2.Rmd',
                      output_format = rmarkdown::pdf_document(),
                      output_file=file,
                      envir = e2)
    
    
  
    
    file.copy(file,outputDir)
    
    
    file.rename(paste0(outputDir,path_file(file)),paste0(outputDir,lenomdufichier2))
  
    filenamed(lenomdufichier2)
    rv2$download_flag2 <- rv2$download_flag2 + 1
    # good <- filenaming_write(uncode)
    
  }
  
)

} )




observeEvent(rv3$download_flag3, {


  output$reportMatrice <- downloadHandler(
    
    
    lenomdufichier3 <- filename3(),
   
    
 
  
    content = function(file) {
      
    
      
      
      tempReport <- file.path(tempdir(), "algo2-Matrice.Rmd")
      file.copy("algo2-Matrice.Rmd",tempReport,overwrite= TRUE)
      
      
      
      e2 <- new.env()

      
      e2$parametre2 <- list(docname = lenomdufichier3)


      TABTOSHOW <- TABMICRO()[-1,c("NOMLIGNE","PA3","E3","AGN3","SCN3","SA3","EFEC3","EFAE3","STR3","AGP3")] 
      
      
      V1  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="S")))
      
      V2  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="I")))
      
      V3  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="N")))
      
      
      TABTOSHOW[TABTOSHOW == "S"] <- "Sensible"
      TABTOSHOW[TABTOSHOW == "I"] <- "Résistant"
      TABTOSHOW[TABTOSHOW == "N"] <- "Non testé"
      TABTOSHOW[TABTOSHOW == "NON"] <- "/"
      # TABTOSHOW[is.na(TABTOSHOW)] <- ""

      germesPA <- (V1["PA3"]+V2["PA3"])>0
      PA <- TABTOSHOW[,c("NOMLIGNE","PA3")]
      PA <- subset(PA,!is.na(PA$PA3))

      PAFIRST <- PA[1,]
      
      
      colnames(PA)[colnames(PA) == "PA3"] <- 'Pseudomonas aeruginosa'
      colnames(PA)[colnames(PA) == "NOMLIGNE"]  <- ''
      
      colnames(PAFIRST)[colnames(PAFIRST) == "PA3"] <- 'Pseudomonas aeruginosa'
      colnames(PAFIRST)[colnames(PAFIRST) == "NOMLIGNE"]  <- ''
      
      
      
    
      germesE <- (V1["E3"]+V2["E3"])>0
      E <- TABTOSHOW[,c("NOMLIGNE","E3")]
      E <- subset(E,!is.na(E$E3))
     
      EFIRST <- E[1,]
      
      
      colnames(E)[colnames(E) == "E3"] <- 'Enterobacterie' 
      colnames(E)[colnames(E) == "NOMLIGNE"]   <- ''
      
      colnames(EFIRST)[colnames(EFIRST) == "E3"] <- 'Enterobacterie' 
      colnames(EFIRST)[colnames(EFIRST) == "NOMLIGNE"]  <- ''
      
   
      
      germesAGN  <- (V1["AGN3"]+V2["AGN3"])>0
      AGN <-  TABTOSHOW[,c("NOMLIGNE","AGN3")]
      AGN <- subset(AGN,!is.na(AGN$E3))
      
  
      AGNFIRST <- AGN[1,]
      
      
      colnames(AGN)[colnames(AGN) == "AGN3"] <- 'Autre gram négatif'  
      colnames(AGN)[colnames(AGN) == "NOMLIGNE"]  <- ''
      
      colnames(AGNFIRST)[colnames(AGNFIRST) == "AGN3"] <- 'Autre gram négatif'  
      colnames(AGNFIRST)[colnames(AGNFIRST) == "NOMLIGNE"]  <- ''
      
      
      
      germesSCN <- (V1["SCN3"]+V2["SCN3"])>0
      SCN =  TABTOSHOW[,c("NOMLIGNE","SCN3")]
      SCN <- subset(SCN,!is.na(SCN$SCN3))
      
      
      SCNFIRST <- SCN[1,]
      
      colnames(SCN)[colnames(SCN) == "SCN3"] <- 'Staphylocoque à coagulase négative'
      colnames(SCN)[colnames(SCN) == "NOMLIGNE"]  <- ''
      
      colnames(SCNFIRST)[colnames(SCNFIRST) == "SCN3"] <- 'Staphylocoque à coagulase négative'
      colnames(SCNFIRST)[colnames(SCNFIRST) == "NOMLIGNE"]  <- ''
      
      
      
      germesSA  <- (V1["SA3"]+V2["SA3"])>0
      SA <-  TABTOSHOW[,c("NOMLIGNE","SA3")]
      SA <- subset(SA,!is.na(SA$SA3))
      SAFIRST <- SA[1,]
      
      colnames(SA)[colnames(SA) == "SA3"] <- 'Staphylocoque aureuse'
      colnames(SA)[colnames(SA) == "NOMLIGNE"]  <- ''
   
      
      colnames(SAFIRST)[colnames(SAFIRST) == "SA3"] <- 'Staphylocoque aureuse'
      colnames(SAFIRST)[colnames(SAFIRST) == "NOMLIGNE"]  <- ''
      
      
      
      germesEFEC <-  (V1["EFEC3"]+V2["EFEC3"])>0
      EFEC <- TABTOSHOW[,c("NOMLIGNE","EFEC3")]
      EFEC <- subset(EFEC,!is.na(EFEC$EFEC3))
      
      EFECFIRST <- EFEC[1,]
      
      
      colnames(EFEC)[colnames(EFEC) == "EFEC3"] <- 'Entérocoque fecalis'
      colnames(EFEC)[colnames(EFEC) == "NOMLIGNE"] <- ''
      
  
      colnames(EFECFIRST)[colnames(EFECFIRST) == "EFEC3"] <- 'Entérocoque fecalis'
      colnames(EFECFIRST)[colnames(EFECFIRST) == "NOMLIGNE"] <-  ''
      
      
      germesEFAE <-  (V1["EFAE3"]+V2["EFAE3"])>0
      EFAE <- TABTOSHOW[,c("NOMLIGNE","EFAE3")]
      EFAE <- subset(EFAE,!is.na(EFAE$EFAE3))
      EFAEFIRST <- EFAE[1,]
      
      colnames(EFAEFIRST)[colnames(EFAEFIRST) == "EFAE3"] <- 'Entérocoque faecium'
      colnames(EFAEFIRST)[colnames(EFAEFIRST)  == "NOMLIGNE"]  <- ''

      colnames(EFAE)[colnames(EFAE) == "EFAE3"] <- 'Entérocoque faecium'
      colnames(EFAE)[colnames(EFAE)  == "NOMLIGNE"]  <- ''
      
      germesSTR <- (V1["STR3"]+V2["STR3"])>0
      STR <- TABTOSHOW[,c("NOMLIGNE","STR3")]
      STR <- subset(STR,!is.na(STR$STR3))
     
      STRFIRST <- STR[1,]
      
      colnames(STRFIRST)[colnames(STRFIRST) == "STR3"] <- 'Streptocoque'
      colnames(STRFIRST)[colnames(STRFIRST)  == "NOMLIGNE"]  <- ''
      
      colnames(STR)[colnames(STR) == "STR3"] <- 'Streptocoque'
      colnames(STR)[colnames(STR)  == "NOMLIGNE"]  <- ''
      
      germesAGP <- (V1["AGP3"]+V2["AGP3"])>0
      AGP <- TABTOSHOW[,c("NOMLIGNE","AGP3")]
      AGP <- subset(AGP,!is.na(AGP$AGP3))
      
      AGPFIRST <- AGP[1,]
      
      
      
      colnames(AGP)[colnames(AGP) == "AGP3"] <- 'Autre gram positif'
      colnames(AGP)[colnames(AGP) == "NOMLIGNE"]  <- '' 
      
      colnames(AGPFIRST)[colnames(AGPFIRST) == "AGP3"] <- 'Autre gram positif'
      colnames(AGPFIRST)[colnames(AGPFIRST) == "NOMLIGNE"] <- ''  
      
      
      
    

      
      e2$listeparTeste <- list(
        
        germesPA  = germesPA    ,
        PA = PA,
        PAFIRST = PAFIRST ,
        germesE = germesE ,
        E = E,
        EFIRST =EFIRST,
     
        germesAGN =   germesAGN ,
        AGN = AGN ,
        AGNFIRST =AGNFIRST,
        germesSCN = germesSCN,
        SCN = SCN ,
        SCNFIRST = SCNFIRST ,
        germesSA = germesSA,
        SA = SA,
        SAFIRST = SAFIRST ,
        germesEFEC = germesEFEC  ,
        EFEC = EFEC  ,
        EFECFIRST = EFECFIRST ,
        germesEFAE =  germesEFAE ,
        EFAE = EFAE ,
        EFAEFIRST = EFAEFIRST ,
        germesSTR = germesSTR  ,
        STR = STR,
        STRFIRST = STRFIRST ,
        germesAGP = germesAGP ,
        AGP =AGP, 
        AGPFIRST = AGPFIRST ,
        GERMCLOS = input$CLOS,
        GERMMYCO = input$MYCO,
        GERMLEGI= input$LEGI
        
      
      
        
      )

      
      rmarkdown::render('algo2-Matrice.Rmd',
                        output_format = rmarkdown::pdf_document(),
                        output_file=file,
                        envir = e2)
      
      
      
      file.copy(file,outputDir)
      
      
      file.rename(paste0(outputDir,path_file(file)),paste0(outputDir,lenomdufichier3))
      filenamed(lenomdufichier3)
      rv3$download_flag3 <- rv3$download_flag3 + 1
      
      # good <- filenaming_write(uncode)
      
    }
  
)

} 
  
)
# tableSortie <- function() {
#   
#  
#  
# 
# TABTOSHOW <- TABMICRO()[-1,c("NOMLIGNE","PA3","E3","AGN3","SCN3","SA3","EFEC3","EFAE3","STR3","AGP3")] 
# 
# 
# V1  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="S")))
# 
# V2  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="I")))
# 
# V3  <-  apply(TABTOSHOW[,liste_des_germes], 2, function(x) length(which(x=="N")))
# 
# 
# TABTOSHOW[TABTOSHOW == "S"] <- "Sensible"
# TABTOSHOW[TABTOSHOW == "I"] <- "Résistant"
# TABTOSHOW[TABTOSHOW == "N"] <- "Non testé"
# TABTOSHOW[TABTOSHOW == "NON"] <- "/"
# TABTOSHOW[is.na(TABTOSHOW)] <- ""
# 
# 
# 
# 
# 
# 
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "NOMLIGNE"] <- 'Antibiotique\n'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "PA3"] <- 'Pseudomonas \aeruginosa'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "E3"] <- 'Enterobacterie\n'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "AGN3"] <- 'Autre gram \nnegatif'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "SCN3"] <- 'Staphylocoque \nà coagulase négative'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "SA3"] <- 'Staphylocoque \n aureus'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "EFEC3"] <- 'Entérocoque \n fecalis'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "EFAE3"] <- 'Entérocoque \n faecium'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "STR3"] <- 'Streptocoque \n'
# colnames(TABTOSHOW)[colnames(TABTOSHOW) == "AGP3"] <- 'Autre gram \n positif'
#  
# 
# 
#  
# 
#   return(TABTOSHOW)
#   
#    
#   
#     
  AjouteRetour <- function(text1) {
 
    if (length(text1)>0)   {text1  <-  paste(text1,"<br>")}
    return(text1)
  } 
  
# }

 


