


observeEvent(
  input$info5, {
    shinyalert(text =  tr("TooltipAllergie"))               

  })


observeEvent(
  input$info6, {
    shinyalert(text =  tr("TooltipHypo"))               
  })


observeEvent(
  input$info7, {
    shinyalert(text =  tr("TooltipDomi"))               
  })

observeEvent(
  input$info9, {
    shinyalert(text =  tr("TooltipComo"))         
  })

step <- reactiveVal(0)
 


# Step for algo 1 ---------------------------------------------------------



AFFICHE_ALGO1_step0 <-  reactiveVal()
AFFICHE_ALGO1_step0(TRUE)

AFFICHE_ALGO1_step1 <-  reactiveVal()

AFFICHE_ALGO1_step2 <-  reactiveVal()
# 
AFFICHE_ALGO1_step3 <-  reactiveVal()
# 
# #   
AFFICHE_ALGO1_step4 <-  reactiveVal()




messageE <- reactiveVal("")


finish <- reactiveVal()
finish(FALSE)


 # print(UTILISATEUR)


 


observeEvent(
  AFFICHE_ALGO1_step0(),{
    finish(TRUE)
    insertUI(selector = "#Box_RESULT_ALGO2",where ="beforeEnd",
             ui = Box_RESULT_ALGO2)
  }, once = TRUE)



observeEvent(
  AFFICHE_ALGO1_step0(),{
    
    insertUI(selector = "#Box_RESULT_RECO2",where ="beforeEnd",
             ui = Box_RESULT_RECO2)
  }, once = TRUE)


# Calculation PAS 
observeEvent(
  input$PAS, {
    insertUI(selector = "#pam",where ="beforeEnd",
                       ui = BoxresultPAM
                       )
  }
  , once = TRUE)


observeEvent(
  input$GCS, {insertUI(selector = "#sofa",where ="beforeEnd",
                       ui = BoxresultSOFA)
  
  }
  , once = TRUE)







BoxresultPAM <-  fluidRow(

  
  strong(tr("TPam")),
  
  textOutput("TextresultPAM")
  
  
)





BoxresultSOFA <-  fluidRow(
  
  
  
  strong(tr("TSofa")),
 
  textOutput("TextresultSOFA")
  
  
)



# Result Box for treatment 

Box_RESULT_ALGO2 <- 
  box (id="Box_RESULT_ALGO2",
       style =   box_result_style,
      
       width=12,
       align="left", 
       fluidRow(
        
         align="center",
         column(12 ,
         style=StyleTitreBlanc,
                  strong("Antibiothérapie proposée")),
        
                  column(12 ,
                         style= MoyennePlusPolice ,
                    column(5, 
                     textOutput("TextresultAlgo1_des_TT1"))
                    ,
                    column(7,
                           textOutput("TextresultAlgo1_poso_TT1"))
                  ),
                  column(12,
                         style= MoyennePlusPolice ,
                    column(5,
                           textOutput("TextresultAlgo1_des_TT2"))
                    ,
                    column(7,
          
                        textOutput("TextresultAlgo1_poso_TT2"))
                  ),
                  column(12,
                        # style=paste0(moyennePolice),
                        # 
                        style= MoyennePlusPolice ,
                    column(5,
                          
                           textOutput("TextresultAlgo1_des_TT3"))
                    ,
                    column(7,
                           
                           textOutput("TextresultAlgo1_poso_TT3"))
                  ),
         
                  column(12,
                         style= MoyennePlusPolice , # style=paste0(moyennePolice),
                  column(5,
                       
                         textOutput("TextresultAlgo1_des_TT4"))
                  ,
                  column(7,
                         
                       
                         textOutput("TextresultAlgo1_poso_TT4"))),
                  column(12,
                         style= MoyennePlusPolice  ,
                         column(5,
                                
                                textOutput("TextresultAlgo1_des_TT5"))
                         ,
                         column(7,
                                
                                 
                              textOutput("TextresultAlgo1_poso_TT5")))
         
         ))         




# Result Box for recommendations

Box_RESULT_RECO2 <- 
  box (id="Box_RESULT_RECO2",
       style =  box_reco_style,
       width=12,
        
       align="left", 
       fluidRow(
         
         align="center",
      column(12,
                       style=StyleTitre,
                       strong("Recommandations")),
                column(12,
                       style= MoyennePlusPolice ,
                       textOutput("TextresultAlgo1_reco"))
                
         ))






# valid <- ""


# Functions ---------------------------------------------------------------



fonction_calcul_Choc_Sep <- function () ({
  messageE(tr("message1Vaso"))
  validate(need(input$vaso<2,""))
  messageE("")
          
    
  var <- (input$vaso==0)
 
  return (var)
  
})

# calculate the PAM 

fonction_calcul_PAM <- function () ({
  
  messageE(tr("message1PAS"))
  validate(need(input$PAS>0,""))
  messageE("")
  
  messageE(tr("message1PAD"))
  # messageE("Veuillez saisir la pression artérielle diastolique ")
  validate(need(input$PAD>0,""))
  messageE("")
  
  pas <- input$PAS
  
  pad <- input$PAD
  
  pam = (pas+(2*pad))/3
  
  return(pam)
  
})


fonction_calcul_SOFA <- function () ({
  
  fonction_calcul_PAM()
  
  messageE(tr("message1GLasgow"))
  # messageE("Veuillez saisir la valeur du Score de Glasgow entre 3 et 15 ")
  validate(need(((input$GCS>2)&&(input$GCS<16)),""))
  messageE("")
  
  messageE(tr("message1FRresp"))
  # messageE("Veuillez saisir la fréquence respiratoire")
  validate(need(input$FResp>0,""))
  messageE("")
  
  
  if (input$PAS <= 100 ) {sofa_pas <- 1}   else  {sofa_pas <- 0}
  if  (input$FResp >= 22 ) {sofa_fr <- 1}    else  {sofa_fr <- 0}
  
  if (input$GCS < 15 ) {sofa_gcs <- 1}    else  {sofa_gcs <- 0}
  
  
  sofa <- 0 + sofa_pas + sofa_fr +  sofa_gcs
  
  return(sofa)
})





fonction_calcul_Sepsis <- function () ({
  

    
    Bool_PAM <- fonction_calcul_PAM()<65
    Bool_SOFA <- fonction_calcul_SOFA()>=2
    
    
 
    messageE(tr("message1Hypotension"))
    # messageE("Veuillez renseigner : Hypotension nécessitant un remplissage vasculaire")
    validate(need(input$hypotension<2,""))
    messageE("")
    
    messageE(tr("message1Hypoper"))
    # messageE("Veuillez renseigner : autres signes d'hypoperfusion")
    validate(need(input$autres<2,""))
    messageE("")

    Bool_Hypo <- (input$hypotension==0)
    # Bool_autres <- (input$autres==0)
    
    
    
    return (
      ( (!fonction_calcul_Choc_Sep())&&(Bool_PAM||Bool_SOFA||Bool_Hypo||(input$autres==0))))

})



fonction_calcul_tt <- function () ({
  
  finish(FALSE)
 
   
  
  
  resultat <- "Parametres incomplets"
  
  step(0) 
  
  i <- input$FCI
  
  
  # Pneumonie 
  if (input$FCI==1){
    messageE(tr("message1Poumon"))
    validate(need(input$FCI_P<2,""))  
    messageE("")
    if (input$FCI_P==0)  {i <- paste0(i,0)}
  }
  
  # Cutané 
  if (input$FCI==6){
    messageE(tr("message1Dermo"))
    validate(need(input$FCI_D<2,""))  
    messageE("")
    if (input$FCI_D==0)  {i <- paste0(i,0)}
  }
  
  
  
  
  
  # Intialization roxw for site of infection
  ligne <- paste0("FCI_",i)
  
  
  
  choc_sep <- fonction_calcul_Choc_Sep()
  
 
  
  if  (choc_sep) {
    
    step(0) 
    AFFICHE_ALGO1_step1(FALSE)
    AFFICHE_ALGO1_step2(FALSE)
    AFFICHE_ALGO1_step3(FALSE)
    AFFICHE_ALGO1_step4(FALSE)
  }
  
  
  
  else 
  { 

   
    AFFICHE_ALGO1_step1(TRUE)
    
 
    sepsis <- fonction_calcul_Sepsis()
    if  (sepsis) { 
      step(1) 
 
      AFFICHE_ALGO1_step2(FALSE)
      AFFICHE_ALGO1_step3(FALSE)
      AFFICHE_ALGO1_step4(FALSE)
    }
    
    else 
    { 
      AFFICHE_ALGO1_step2(TRUE)
      
      messageE(tr("message1BLSE"))
                  # Veuillez renseigner BLSE")
      validate(need(input$blse<3,""))
      messageE("")
      
      
      messageE(tr("message1SARM"))
      # messageE("Veuillez renseigner SARM")
      validate(need(input$sarm<3,"")) 
      messageE("")
      
      if (input$blse==0)   { 
        
        step(2)
        AFFICHE_ALGO1_step3(FALSE)
        AFFICHE_ALGO1_step4(FALSE)
        }
      
      else 
      {  
        AFFICHE_ALGO1_step3(TRUE)
  
        messageE(tr("message1Allergie1"))
        # messageE("Veuillez renseigner l'allergie à la pénicilline")
        validate(need(input$PEN<3,""))
        messageE("")
        
        
        # 
        # SARM oui == 0 
        if (input$sarm==0)   { 
          
          step(3)
          AFFICHE_ALGO1_step4(FALSE)
        }
        
        else { 
          
          
          
          frisques <- FALSE

          
          if (input$FCI>0)  {frisques <- TRUE }
          
          if (length(input$FRICB)>0)  {frisques <- TRUE}
          if (input$FRICBCA==1)  {frisques <- TRUE}
          # if (length(input$FRICBCA)>0)  {frisques <- TRUE}
        
          # SARM ==NON et facteur de risque == OUI 
        
        if (frisques)
   
        {
          
          step(3)
          AFFICHE_ALGO1_step4(FALSE)
          
        } 
        
        
        
        
    
        else 
          
        {  AFFICHE_ALGO1_step4(TRUE)
          messageE(tr("message1Domi"))
          # messageE("Veuillez renseigner le retour à domicile")
          validate(need(input$DOMI<2,""))
          messageE("")
          if (input$DOMI<3) { step(4)}
          
          else { step(5) }
          
          
        }   
          
        
      } 
      
    } 
  } 
  
  
    }
   


  
  
  
  if (step()==0) 
  { 
    if(choc_sep){
      AFFICHE_ALGO1_step2(FALSE)
      col <- "CS" 
    
    }
   
    
  }
  else
  {
    if (step()==1) 
      
    { 
      if (sepsis) { 
    
        col<- "SEP"} 
    }
    else 
      
    {
      
      if (step()==2) 
      {
        
        if (input$sarm==0) {col<- "BLSE_ET_SARM"}  
        
        if ((input$sarm>0)) {col<- "BLSE_ET_NONSARM"}
        
        
        
      }
      else 
      {
        if (step()==3) 
          
        { 
          # print(step())
          
          frisques <- FALSE
          
          allergie <- FALSE 
          
          
          # Foyer clinique identifié
          if (input$FCI>0)  { frisques <- TRUE }
          
          if (length(input$FRICB)>0)  {frisques <- TRUE}
          if (input$FRICBCA==1)  {frisques <- TRUE}
          # sarm==0 <-  SARM == OUI 
          
          if (input$sarm==0)  var1 <- 1 else var1 <- 0
          if (frisques) var2 <- 1  else var2 <- 0
          
          
          # c("Non"=0, "Allergie non sévère"=1,"Allergie sévère"=2 
          var_allergie <-  input$PEN 
          
          
          col <-paste0("STEP3_",var1,var2,var_allergie)
          
          
          
        }
        else  
        { 
          
          if (step()==4) 
            
            
          { 
            
            
            col <- paste0("STEP4_",input$PEN,input$DOMI)
            
            
            
          }
        }   
        
      }
    }   
    
  } 


  
  resultat <- Tableau_TT[ligne,col]
  
  
 
  
  tt1 <- poso_tt1 <-tt2 <-  poso_tt2 <- tt3 <- poso_tt3 <- tt4 <-  poso_tt4 <- tt5 <- poso_tt5 <- reco <-  ""
  
  
  if (!is.na(as.character(TabreadBR[ligne,col])))
    
  {
  reco <- as.character(TabreadBR[ligne,col])
  }
  
  
  
  if (!is.na(as.character(TabreadB1[ligne,col])))
    
  {
  tt1 <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(TabreadB1[ligne,col]))])
  poso_tt1  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(tt1))])
  
  }
  
  
 
  

  if (!is.na(as.character(TabreadB2[ligne,col])))

       {
  tt2 <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(TabreadB2[ligne,col]))])
  poso_tt2  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(tt2))])

  }


  if (!is.na(as.character(TabreadB3[ligne,col])))

  {
  tt3 <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(TabreadB3[ligne,col]))])
  poso_tt3  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(tt3))])
  }



  if (!is.na(as.character(TabreadB4[ligne,col])))

  {
  tt4 <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(TabreadB4[ligne,col]))])
  poso_tt4  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(tt4))])
  }


  if (!is.na(as.character(TabreadB5[ligne,col])))

  {

  tt5 <- as.character(ATB$NOM[which(ATB["SURNOM"]==as.character(TabreadB5[ligne,col]))])
  poso_tt5  <- as.character(ATB$POSO[which(ATB["NOM"]==as.character(tt5))])
  }
  
  
  finish(TRUE)
 
  
  resultats <- list("resultatR"=resultat,
                  "ligneR"=ligne,
                  "colR"=col,
                  "reco"=reco,
                  "tt1"=tt1,
                  "poso_tt1"=poso_tt1,
                  "tt2"=tt2,
                  "poso_tt2"=poso_tt2,
                  "tt3"=tt3,
                  "poso_tt3"=poso_tt3,
                  "tt4"=tt4,
                  "poso_tt4"=poso_tt4,
                  "tt5"=tt5,
                  "poso_tt5"=poso_tt5)


  
  return(resultats)
  
  
} 
  
  )


Algo1res <- reactive (fonction_calcul_tt())








output$TextresultPAM <- renderText({
 

  
  res <-  round(fonction_calcul_PAM(), digits = 0)
  
 
  
    
  
  
  
})



    
    




output$TextresultSOFA <- renderText({
  
  
  
  res <-  fonction_calcul_SOFA()
  
  
 
 

})




output$TextresultALGO <- renderText({
  Algo1res()$resultatR
  # if (!versionDemo) 
  # { as.character(Algo1res()$resultatR)}
  # else {""}
})





observeEvent(input$goALgo1, {
  screenshot()
  
})



observeEvent(
  input$reset1, { 
    # reset du reste
    updateRadioButtons(session,"vaso", selected=character(0))
    updateSelectInput(session,"FCI",  selected=0)
   updateNumericInput(session,"PAS", value="")
    updateNumericInput(session,"PAD",  value="")
    updateNumericInput(session,"GCS",  value="")
    updateNumericInput(session,"FResp",  value="")
    updateRadioButtons(session,"hypotension", selected=character(0))
    updateRadioButtons(session,"autres", selected=character(0))
    updateCheckboxGroupInput(session,"FRICB", selected=character(0))
    # remise à blanc de même foyer clinique poumon et dermato  , même si c'est un condition panel , il garde la valeur en mémoire et la publie dans le dpf 
    updateRadioButtons(session,"FCI_P", selected=character(0))
    updateRadioButtons(session,"FCI_D", selected=character(0))
    updateRadioButtons(session,"blse", selected=character(0))
    updateRadioButtons(session,"sarm", selected=character(0))
    updateRadioButtons(session,"PEN", selected=character(0))
    updateRadioButtons(session,"DOMI", selected=character(0))
    
    
    
  }
)




observeEvent(
  input$vaso, { 
    # reset du reste
    updateNumericInput(session,"PAS", value="")
    updateNumericInput(session,"PAD",  value="")
    updateNumericInput(session,"GCS",  value="")
    updateNumericInput(session,"FResp",  value="")
    updateRadioButtons(session,"hypotension", selected=character(0))
    updateRadioButtons(session,"autres", selected=character(0))
    updateCheckboxGroupInput(session,"FRICB", selected=character(0))
    updateRadioButtons(session,"blse", selected=character(0))
    updateRadioButtons(session,"sarm", selected=character(0))
    updateRadioButtons(session,"PEN", selected=character(0))
    updateRadioButtons(session,"DOMI", selected=character(0))
    
    
    
  }
)




observeEvent(input$hypotension, {
  updateRadioButtons(session,"blse", selected=character(0))
  updateRadioButtons(session,"sarm", selected=character(0))
  updateCheckboxGroupInput(session,"FRICB", selected=character(0))
  # remise à blanc de même foyer clinique poumon et dermato  , même si c'est un condition panel , il garde la valeur en mémoire et la publie dans le dpf 
  updateRadioButtons(session,"PEN", selected=character(0))
  updateRadioButtons(session,"DOMI", selected=character(0))
})


observeEvent(input$autres, {
  updateRadioButtons(session,"blse", selected=character(0))
  updateRadioButtons(session,"sarm", selected=character(0))
  updateCheckboxGroupInput(session,"FRICB", selected=character(0))
  updateRadioButtons(session,"PEN", selected=character(0))
  updateRadioButtons(session,"DOMI", selected=character(0))
})



observeEvent(input$sarm, {
  updateCheckboxGroupInput(session,"FRICB", selected=character(0))
  updateRadioButtons(session,"PEN", selected=character(0))
  updateRadioButtons(session,"DOMI", selected=character(0))
})


observeEvent(input$blse, {
  updateCheckboxGroupInput(session,"FRICB", selected=character(0))
  updateRadioButtons(session,"PEN", selected=character(0))
  updateRadioButtons(session,"DOMI", selected=character(0))
})

observeEvent(input$reset1, {
  reset("form")
})


output$step1flag <- reactive({
  
 
  return(AFFICHE_ALGO1_step1()) 
}
)


output$step2flag <- reactive({
  return(AFFICHE_ALGO1_step2()) 
}
)


output$step3flag <- reactive({
  return(AFFICHE_ALGO1_step3()) 
}
)


output$step4flag <- reactive({
  return(AFFICHE_ALGO1_step4()) 
}
)



output$finisher <- reactive({
  return(finish()) 
}
)


output$messageNotEmpty <- reactive({
return(!(messageE()==""))

})


 

 

output$utilisateurer <- reactive({

  return(UTILISATEUR())
}
)


outputOptions(output, "step1flag", suspendWhenHidden = FALSE)
outputOptions(output, "step2flag", suspendWhenHidden = FALSE)
outputOptions(output, "step3flag", suspendWhenHidden = FALSE)
outputOptions(output, "step4flag", suspendWhenHidden = FALSE)
outputOptions(output, "finisher", suspendWhenHidden = FALSE)
outputOptions(output, "utilisateurer", suspendWhenHidden = FALSE)
outputOptions(output, "messageNotEmpty", suspendWhenHidden = FALSE)



output$TextresultAlgo1_des_TT1 <- renderText({
 
   Algo1res()$tt1
  
})


output$TextresultAlgo1_poso_TT1 <- renderText({
  
  Algo1res()$poso_tt1
  
})


output$TextresultAlgo1_des_TT2 <- renderText({
  
  
  if (Algo1res()$tt2=="")
  {}
  else 
  {paste("+",Algo1res()$tt2)}
  

})


output$TextresultAlgo1_poso_TT2 <- renderText({
  
 Algo1res()$poso_tt2
  
})

output$TextresultAlgo1_des_TT3 <- renderText({
  
  
  if (Algo1res()$tt3=="")
  {}
  else 
  {paste("+",Algo1res()$tt3)}
  
 
  
  
})



output$TextresultAlgo1_poso_TT3 <- renderText({
  
  Algo1res()$poso_tt3
  
})


output$TextresultAlgo1_des_TT4 <- renderText({
  
  if (Algo1res()$tt4=="")
      {}
      else 
      {paste("+",Algo1res()$tt4)}
  
  
  
})



output$TextresultAlgo1_poso_TT4 <- renderText({
  
  Algo1res()$poso_tt4
  
})

output$TextresultAlgo1_des_TT5 <- renderText({
  
  Algo1res()$tt5
  
  
})

output$TextresultAlgo1_poso_TT5 <- renderText({
  
  Algo1res()$poso_tt5
  
})




output$TextresultAlgo1_reco <- renderText({
  
  Algo1res()$reco
  
 
 
  
})



output$ERROR1 <- renderText({
  messageE()
})





# ) 


 



output$questionVasoPresseur<- renderText({
  
  tr("QuestionVasoPresseur")
  
})



output$questionLactacte<- renderText({
  
  tr("QuestionLactacte")
  
})





output$questionCliniqueIdent<- renderText({
  
  tr("QuestionCliniqueIdent")
  
})




# output$sofa<- renderText({
#   
#   tr("TSofa")
# }) 


# 
# 
# output$pam<- renderText({
#   
#   tr("TPam")
# }) 




output$questionPressionArt<- renderText({
  
  tr("QuestionPressionArt")
  
})





output$questionPressionDia<- renderText({
  
  tr("QuestionPressionDia")
  
})





output$questionGlasgow<- renderText({
  
  tr("QuestionGlasgow")
  
})





output$questionFreqResp<- renderText({
  
  tr("QuestionFreqResp")
  
})



output$questionHypo<- renderText({
  
  tr("QuestionHypo")
}) 




output$questionAutres<- renderText({
  
  tr("QuestionAutres")
}) 





output$questionTroismois<- renderText({
  
  tr("QuestionTroismois")
}) 






output$questionEnte<- renderText({
  
  tr("QuestionEnte")
}) 




output$questionStaph<- renderText({
  
  tr("QuestionStaph")
}) 



output$questionFact<- renderText({
  
  tr("QuestionFact")
}) 



output$questionAllergie<- renderText({
  
  tr("QuestionAllergie")
}) 




output$questionFacteurRisque<- renderText({
  
  tr("QuestionFacteurRisque")
}) 



output$reponseFacteurRisque1 <- renderText({
  
  tr("ReponseFacteurRisque1")
}) 



 

output$questionDomi <- renderText({
  
  tr("QuestionDomi")
}) 





output$selectInputAucun<- renderText({
  
  tr("selectInputAucun")	
}) 



output$selectInputpoumon<- renderText({
  
  tr("selectInputpoumon")	
}) 


output$selectInputDiar<- renderText({
  
  tr("selectInputDiar")	
}) 


output$selectInputCatheter<- renderText({
  
  tr("selectInputCatheter")	
}) 


output$selectInputPerine<- renderText({
  
  tr("selectInputPerine")	
}) 



output$selectInputCutane<- renderText({
  
  tr("selectInputCutane")	
}) 




output$oui <- renderText({
  
  tr("Oui")	
}) 



output$non <- renderText({
  
  tr("Non")	
}) 






output$selectInputAutre<- renderText({
  
  tr("selectInputAutre")	
}) 


output$questionPneunoInter<- renderText({
  
  tr("QuestionPneunoInter")	
}) 


 

output$questionDermoHypo<- renderText({
  
  tr("QuestionDermoHypo")	
}) 





output$panelAlgo1<- renderText({
  
  tr("PanelAlgo1")	
}) 


# 
# 
# 
# 
# rv <- reactiveValues(download_flag = 0)
# 
# # 
# # # 
# observeEvent(rv$download_flag, {

  
observeEvent(rv$download_flag, {
  
  output$report <- downloadHandler(
    
    lenomdufichier <- filename(),
  
    finish(FALSE),
    
    content = function(file) {
      
      
      tempReport <- file.path(tempdir(), "algo1.Rmd")
      file.copy("algo1.Rmd",tempReport,overwrite= TRUE)
      
      e <- new.env() 
      
      vartt1 <- NULL 
      tryCatch( vartt1 <- 
                  as.character(Algo1res()$tt1))
      
      
      vartt2 <- NULL 
      tryCatch(  vartt2 <- 
                   as.character(Algo1res()$tt2))
      
      vartt3 <- NULL 
      tryCatch( vartt3 <-
                  as.character(Algo1res()$tt3))
      
      vartt4 <- NULL 
      tryCatch(
        vartt4 <- as.character(Algo1res()$tt4))
      
      e$parametre <-list(docname = lenomdufichier)
      
      
      
      e$listepar <- list(
        class1 = NAMES_L1,
        tt1 = vartt1 ,  
        poso1 =  as.character(Algo1res()$poso_tt1) ,  
        
        
        class2 = NAME_L2,
        tt2 = vartt2 , 
        poso2 = as.character(Algo1res()$poso_tt2) ,  
        
        class3 = NAME_L3, 
        tt3 =  vartt3 , 
        poso3 = as.character(Algo1res()$poso_tt3) ,  
        
        class4 = NAME_L4,
        tt4 = vartt4,
        poso4 = as.character(Algo1res()$poso_tt4) , 
        
        tt5 = as.character(Algo1res()$tt5) , 
        class5 = "Autres",
        poso5 = as.character(Algo1res()$poso_tt5) , 
        
        reco = as.character(Algo1res()$reco),
        login =session$user
      )
      
      
      
      vasoVar <-   varAutres   <-   varHypo <- NULL
      
      varFCI  <- varFCIP <-  varFCID <- varBlse  <-  varSarm  <- NULL
      
      
      varPas <- varPad <- varGlasgow <- varFresp <- ""
      
      e$listeparSaisie <- list(
        logname = logname ,
        varVaso = switch(input$vaso,"0"="Oui","1"="Non",""),
        varPas =  if (length(input$PAS)>0) {input$PAS},
        varPad = if (length(input$PAD)>0) {input$PAD},
        varGlasgow =  if (length(input$GCS)>0) {input$GCS}, 
        varFresp =    if (length(input$FResp)>0) {input$FResp},  
        varHypo  =  if (length(input$hypotension)>0) {switch(input$hypotension,"0"="Oui","1"="Non","")} ,
        varAutres =  if (length(input$autres)>0) {switch(input$autres,"0"="Oui","1"="Non","")} ,
        varFCI =     if (length(input$FCI)>0)  {switch(input$FCI,"0"="Aucun","1"=tr("Poumon"),"3"="Diarrhée/colite",
                                                       "4"="Cathéter veineux central",
                                                       "5"="Périnée",
                                                       "6"="Cutané (autre que cathéter central ou périnée)",
                                                       "7"="Autre","")} ,
        varFCIP = if (length(input$FCI_P)>0)  {switch(input$FCI_P,"0"="Oui","1"="Non","")} ,
        varFCID = if (length(input$FCI_D)>0) {switch(input$FCI_D,"0"="Oui","1"="Non","")} ,
        varBlse = if (length(input$blse)>0)  {switch(input$blse,"0"="Oui","1"="Non","")} ,
        varSarm = if (length(input$sarm)>0)  {switch(input$sarm,"0"="Oui","1"="Non","")} ,
        varPen =  if (length(input$PEN)>0) {switch(input$PEN,"0"="Pas d'allergie","1"="Allergie non sévère","2"="Allergie sévère","")} ,
        varDomi = if (length(input$DOMI)>0) {switch(input$DOMI,"0"="Oui","1"="Non","")},
        varFri = input$FRICB,
        varFriCa = input$FRICBCA
      ) 
      
      
      
      # # Render the document
      rmarkdown::render('algo1.Rmd',
                        # encoding ="UTF-8",
                        output_format = rmarkdown::pdf_document(),
                        # encodin ="UTF-8",
                        output_file=file,
                        envir = e)
      # 
      
      # 
      
      # good <- filenaming_write(uncode)


      file.copy(file,outputDir)
      
      # 
      file.rename(paste0(outputDir,path_file(file)),paste0(outputDir,lenomdufichier))
      
      
      
      filenamed(lenomdufichier)
      rv$download_flag <- rv$download_flag + 1
    }
    
    
  )
})
#





# 
# output$report <- downloadHandler(
#   
#   lenomdufichier <- filename(),
#   
#   finish(FALSE),
#   
#   content = function(file) {
# 
# 
#     tempReport <- file.path(tempdir(), "algo1.Rmd")
#     file.copy("algo1.Rmd",tempReport,overwrite= TRUE)
#     
#     e <- new.env() 
#     
#     vartt1 <- NULL 
#     tryCatch( vartt1 <- 
#                 as.character(Algo1res()$tt1))
#     
#     
#     vartt2 <- NULL 
#     tryCatch(  vartt2 <- 
#                  as.character(Algo1res()$tt2))
#     
#     vartt3 <- NULL 
#     tryCatch( vartt3 <-
#                 as.character(Algo1res()$tt3))
#     
#     vartt4 <- NULL 
#     tryCatch(
#       vartt4 <- as.character(Algo1res()$tt4))
#     
#     e$parametre <-list(docname = lenomdufichier)
#     
#  
#     
#     e$listepar <- list(
#       class1 = NAMES_L1,
#       tt1 = vartt1 ,  
#       poso1 =  as.character(Algo1res()$poso_tt1) ,  
#       
#       
#       class2 = NAME_L2,
#       tt2 = vartt2 , 
#       poso2 = as.character(Algo1res()$poso_tt2) ,  
#       
#       class3 = NAME_L3, 
#       tt3 =  vartt3 , 
#       poso3 = as.character(Algo1res()$poso_tt3) ,  
#       
#       class4 = NAME_L4,
#       tt4 = vartt4,
#       poso4 = as.character(Algo1res()$poso_tt4) , 
#       
#       tt5 = as.character(Algo1res()$tt5) , 
#       class5 = "Autres",
#       poso5 = as.character(Algo1res()$poso_tt5) , 
#       
#       reco = as.character(Algo1res()$reco),
#       login =session$user
#     )
#     
#     
#     
#     vasoVar <-   varAutres   <-   varHypo <- NULL
#     
#     varFCI  <- varFCIP <-  varFCID <- varBlse  <-  varSarm  <- NULL
#     
#     
#     varPas <- varPad <- varGlasgow <- varFresp <- ""
#     
#     e$listeparSaisie <- list(
#       logname = logname ,
#       varVaso = switch(input$vaso,"0"="Oui","1"="Non",""),
#       varPas =  if (length(input$PAS)>0) {input$PAS},
#       varPad = if (length(input$PAD)>0) {input$PAD},
#       varGlasgow =  if (length(input$GCS)>0) {input$GCS}, 
#       varFresp =    if (length(input$FResp)>0) {input$FResp},  
#       varHypo  =  if (length(input$hypotension)>0) {switch(input$hypotension,"0"="Oui","1"="Non","")} ,
#       varAutres =  if (length(input$autres)>0) {switch(input$autres,"0"="Oui","1"="Non","")} ,
#       varFCI =     if (length(input$FCI)>0)  {switch(input$FCI,"0"="Aucun","1"=tr("Poumon"),"3"="Diarrhée/colite",
#                                                      "4"="Cathéter veineux central",
#                                                      "5"="Périnée",
#                                                      "6"="Cutané (autre que cathéter central ou périnée)",
#                                                      "7"="Autre","")} ,
#       varFCIP = if (length(input$FCI_P)>0)  {switch(input$FCI_P,"0"="Oui","1"="Non","")} ,
#       varFCID = if (length(input$FCI_D)>0) {switch(input$FCI_D,"0"="Oui","1"="Non","")} ,
#       varBlse = if (length(input$blse)>0)  {switch(input$blse,"0"="Oui","1"="Non","")} ,
#       varSarm = if (length(input$sarm)>0)  {switch(input$sarm,"0"="Oui","1"="Non","")} ,
#       varPen =  if (length(input$PEN)>0) {switch(input$PEN,"0"="Pas d'allergie","1"="Allergie non sévère","2"="Allergie sévère","")} ,
#       varDomi = if (length(input$DOMI)>0) {switch(input$DOMI,"0"="Oui","1"="Non","")},
#       varFri = input$FRICB,
#       varFriCa = input$FRICBCA
#     ) 
#     
#     
#     
#     # # Render the document
#     rmarkdown::render('algo1.Rmd',
#                       # encoding ="UTF-8",
#                       output_format = rmarkdown::pdf_document(),
#                       # encodin ="UTF-8",
#                       output_file=file,
#                       envir = e)
#     # 
#   
#     # 
#     
#     # good <- filenaming_write(uncode)
#     
#     
#     
#     
#     
#     
#     file.copy(file,outputDir)
#     
#     # 
#    file.rename(paste0(outputDir,path_file(file)),paste0(outputDir,lenomdufichier))
# 
#    rv$download_flag <- rv$download_flag + 1
#   }
#   
# 
# )
# 




print("algo.R done.")


