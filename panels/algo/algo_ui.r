

Box_ERROR <- 
  
  box (id="Box_ERROR",
       conditionalPanel(condition = "output.messageNotEmpty==true",
       width=12, 
       
       panel(
         style =  box_alerte_style,
         # "Message alerte",
         textOutput("ERROR1"))
       
       
  )
)

styleMessageInfo5 <- "#info5 {
                                            display: inline;
                                            margin: 10px;
                                            color: blue;
                                            }"



styleMessageInfo6 <- "#info6 {
                                            display: inline;
                                            margin: 10px;
                                            color: orange;
                                            }"



styleMessageInfo7 <- "#info7 {
                                            display: inline;
                                            margin: 10px;
                                            color: orange;
                                            }"




styleMessageInfo9 <- "#info9 {
                                            display: inline;
                                            margin: 10px;
                                            color: orange;
                                            }"

Box_STEP0 <-   
  fluidRow(style="margin-right : 1px",
           column(12,
                  style=style_box,
                  align="left", 
                  
                  # 
                  radioButtons("vaso",  textOutput("questionVasoPresseur") ,c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))
           #   ,
           #   # 
           # 
           # radioButtons("lact2", textOutput("questionLactacte"), c("Non disponible"=0, " ≤  2"=1," > 2"=2),selected=character(0),inline = TRUE)) 
  )    




Box_STEP1 <- 
  # box(id="Box_STEP1",
  
  fluidRow( style="margin-right : 1px",
            # width=12,  
            conditionalPanel(condition = "output.step1flag==true",
                             # fluidRow(
                             column(width = 12,
                                    
                                    style=style_box,
                                    # align="left", 
                                    
                                    fluidRow(
                                      
                                      column(width = 6,
                                             
                                             
                                             
                                             # numericInput("PAS","Pression artérielle systolique", value =  "",min = 10, max = 300),
                                             numericInput("PAS",textOutput("questionPressionArt"), value =  "",min = 10, max = 300),
                                             
                                             # numericInput("PAD","Pression artérielle diastolique", value = "",min = 10, max = 300),
                                             numericInput("PAD",textOutput("questionPressionDia"), value = "",min = 10, max = 300),
                                             
                                             # numericInput("GCS","Score de Glasgow", value = "",min = 3, max = 15),
                                             numericInput("GCS",textOutput("questionGlasgow"), value = "",min = 3, max = 15),
                                             
                                             # numericInput("FResp","Fréquence respiratoire", value = "",min = 5, max = 60)
                                             numericInput("FResp",textOutput("questionFreqResp"), value = "",min = 5, max = 60)
                                             
                                             
                                      )      
                                      ,
                                      
                                      column(width = 6,
                                             
                                             br(),
                                             br(),
                                             tags$div(id="pam",style=style_box_PAM),
                                             br(),
                                             br(),  br(),  br(),
                                             tags$div(id="sofa",style=style_box_SOFA))
                                      # )
                                      
                                    )
                                    ,   
                                    
                                    
                                    fluidRow(
                                      column(width = 12,
                                             radioButtons("hypotension", textOutput("questionHypo") ,choices = c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))
                                    ),
                                    
                                    fluidRow(
                                      tags$head(
                                        tags$style(
                                          HTML(styleMessageInfo6)))
                                      ,
                                      
                                      column(width = 12,
                                            
                                             
                                             # "Autres signes d'hypoperfusion périphérique"
                                             radioButtons("autres",  HTML(tr("TSignesperf"),
                                                                          as.character(actionLink(inputId = "info6", 
                                                                                                  label = "", 
                                                                                                  icon = icon("info-circle")))),choices=c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))
                                      
                                      
                                      
                                    )
                             )
            )
            
            # )
  )




Box_FC <-
  
  box(id="Box_FC",
      # style="margin-right : 1px",
      width=12, 
      fluidRow(
        align="left",   
        column(12,        
               style=style_box_FC,
          
               selectInput("FCI", textOutput("questionCliniqueIdent"),choices = c(
                 "Aucun"=0,
                 "Poumon"=1,  
                 # Grippe non, ToDoList ligne 246 : V10	ALGO1	 				
                 # "Grippe"=2,
                 "Diarrhée/colite"=3,
                 "Cathéter veineux central"=4,
                 "Périnée"=5,
                 "Cutané (autre que cathéter central ou périnée)"=6,
                 "Autre"=7)
               ),
             
               
               conditionalPanel(condition = "input.FCI == 1",
                                radioButtons("FCI_P", textOutput("questionPneunoInter"),c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE)),
               conditionalPanel(condition = "input.FCI == 6", 
                                radioButtons("FCI_D", textOutput("questionDermoHypo"),c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))
               
               
        )                          
      )
  )    



BOX_ATC <- 
  box(
    width=12, 
    conditionalPanel(condition = "output.step2flag==true",
                     
                     fluidRow(
                       
                       column(12,      
                              
                              
                              strong(textOutput("questionTroismois")),
                              align="left",   
                              style=style_box_ATC,
                              

                            
                              
                              
                              radioButtons("blse", 
                                           textOutput("questionEnte"),c("Oui"=0, "Non"=1,"Ne sait pas"=2),selected=character(0),inline = TRUE),
                              
                              radioButtons("sarm", 
                                           textOutput("questionStaph"),c("Oui"=0, "Non"=1,"Ne sait pas"=2),selected=character(0),inline = TRUE)
                              
                              
                       )   
                       
                     )
    )
  )

# BoxresultFRC <-  
#   
#   
#   box (id="BoxresultFRC" ,
#        width=12, 
#        style  =   box_result_style_FR,
#        
#        conditionalPanel(condition = "output.step3flag==true",
#                         
#                         fluidRow(
#                           textOutput("reponseFacteurRisque"),
#                           
#                           
#                           strong(textOutput("ResultFRC_RES")),
#                           
#                           # style = "padding : 15px",
#                           textOutput("ResultFRC")
#                           
#                           
#                         )
#                         
#                         
#        )
#   )

Box_R <- 
  box(id="Box_R", 
      width=12, 

     
      # Affichage de cette box que si pas de foyer infectieux detecte , on cherche si il y a au moins un facteur de risque
      conditionalPanel(condition = "output.step3flag==true && input.FCI == 0",
                       
                       
                       fluidRow(
        
                         style= style_box_FRI,
                        
                         checkboxGroupInput(inputId="FRICB", label = textOutput("questionFacteurRisque") ,width="100%",
                                            choices=  c(
                                              tr("TFRICB1"),
                                              # "Hémopathie maligne (dont lymphome)",
                                              tr("TFRICB2"),
                                            
                                              tr("TFRICB3"),
                                              # "Sonde urinaire à demeure",
                                              tr("TFRICB4"),
                                              # # "Antibiothérapie (de plus de 48h) dans les 30 jours précédents",
                                              tr("TFRICB5"),
                                              # # "Hospitalisation dans les 30 jours précédents",
                                              tr("TFRICB6"),
                                              # # "Antécédent d'infection à pseudomonas aeruginosa",
                                              tr("TFRICB7")
                                              # # "Mucite sévère empechant l'alimentation solide")
                                            
                                       
                                              # "Comorbidité significative", 
                                            
                                             
                                            
                                              
                                              
                                              
                                              ))
                                            ,
                         tags$head(
                           tags$style(
                             HTML(styleMessageInfo9))),
                        checkboxInput("FRICBCA", label = HTML( tr("TFRICB8"),
                                                               as.character(actionLink(inputId = "info9",
                                                                                       label = "",
                                                                                       icon = icon("info-circle")))),value=NULL)
                                      
                             
                         
                       )
                       
                       
      )
     
  )   

Box_A <-
  
  box(id="Box_A",
      width=12, 
      conditionalPanel(condition = "output.step3flag==true",
                       
                       fluidRow(
                         
                         style=style_box_A,
                         tags$head(
                           tags$style(
                             HTML(styleMessageInfo5))),
                         column(12,
                              
                                radioButtons("PEN", HTML(tr("QuestionAllergie"),
                                                         as.character(actionLink(inputId = "info5", 
                                                                                 label = "", 
                                                                                 icon = icon("info-circle")))) ,choices = c("Non"=0, "Non sévère"=1,"Sévère"=2),selected=character(0),inline = TRUE) 
                                
                                
                         )     
                       )
      )
      
  )


Box_S <- 
  
  box(id="Box_S",
      width=12, 
      conditionalPanel(condition = "output.step4flag==true",
                       
                       fluidRow(  
                         
                         # style=paste0("color: #00000;background-color:",box_S_color,";",border_radius,";",margin_bottom,";",fontColorBlanc) ,
                         style=style_box_S,
                         column(12,
                                tags$head(
                                  tags$style(
                                    HTML(styleMessageInfo7)))
                                ,
                                
                                
                                align="left",
                                
                                radioButtons("DOMI", label = HTML(tr("QuestionDomi") ,
                                # Retour au domicile envisagé",
                                                                  as.character(actionLink(inputId = "info7", 
                                                                                          label = "", 
                                                                                          icon = icon("info-circle")))),choices=c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE)
                                
                                
                         )
                         
                         
                         
                         
                       )
                       
      )
      
  )


Box_BUTTON <- 
  box (id="Box_BUTTON",
       width=12,
       conditionalPanel(condition = "output.finisher==true",
                        
                        column(6,  
                               downloadButton("report","Pdf")),
                        column(6,        
                               actionButton("reset1", "RESET",style = paste0(fontColorBlanc,";","background-color :",reset_color ,";","border-color :",reset_color))) 
       )
  )


 

algo_panel <- tabPanel("Antibiothérapie initiale aux urgences",

                       conditionalPanel(condition = "output.utilisateurer==false",
                                        {
                                          fluidPage(
                                            
                                            
                                            
                                            # div(class="panel panel-default",
                                            #     div(class="panel-body",
                                            #         "ANTIBIO-NEED"),style = "color:#6de4d7"),
                                            div(
                                              # class="panel panel-default",
                                              div(class="panel-body",
                                                  strong(span("Votre centre n’est pas encore randomisé. Vous n’avez donc pas accès aux algorithmes"))
                                                  
                                              )
                                              
                                              
                                            )
                                          )
                                          
                                          
                                          
                     }),
                     conditionalPanel(condition = "output.utilisateurer==true",
                     
                                        {
                                          # align = "center",
                                          # "Antibiothérapie initiale aux urgences",
                                          # actionButton("reset_button", "Reset Page"),

                                          tags$style(
                                            HTML("
                              .shiny-output-error-validation {
                              color: tomato; font-size : 14px ;
                              }
                              ")
                                          )
                                          #
                                          #            tags$style("#Box_STEP1 {
                                          # background-color:   #ffe300  ;color: #00000;}"),
                                          # #

                                          dashboardBody(
                                            useShinyjs(),
                                            div(
                                              id = "form",

                                              tags$style("#pam {",
                                                         border_radius,";background-color:",resultat_color ,
                                                         ";color : black ;font-size : 14px ;
                                  text-align : center;
                                  border-color :",box_step1_color,";
                                  }"),


                                              tags$style("#sofa {",
                                                         border_radius,";background-color:",resultat_color ,
                                                         ";color : black ;font-size : 14px ;
                                  text-align : center;
                                  border-color :",box_step1_color,";
                                  }"),



                                              #





                                              fluidRow(

                                                width=12,

                                                column(4,
                                                       Box_STEP0,
                                                       Box_STEP1,

                                                )
                                                ,
                                                column(4,
                                                       Box_FC,

                                                       BOX_ATC,

                                                       Box_R,

                                                       Box_A,

                                                       Box_S


                                                ),


                                                column(4,
                                                       tags$div(id="Box_RESULT_ALGO2"),

                                                       tags$div(id="Box_RESULT_RECO2")

                                                )  ,


                                              )

                                              ,
                                              # Box_ALGO_POPUP,
                                              fluidRow(

                                                column(12,
                                                       Box_ERROR

                                                ),

                                                # column(12,
                                                #        tags$div(id="Box_RESULT_ALGO2")
                                                #
                                                # )  ,
                                                # Box_ALGO_POPUP,
                                                Box_BUTTON ,
                                                column(12,
                                                       tags$div(id="Box_DEBUG")
                                                )
                                                # ,
                                                # column(12,
                                                #        tags$div(id="Box_RESULT_ALGO")
                                                # )   ,

                                              )

                                              # ,
                                              # dataTableOutput("Algo1Table")


                                              #

                                              #
                                            )

                                          )
                                        })
)
                         
                   



#                          fluidPage(
#                            
#                            
#                            
#                            # div(class="panel panel-default",
#                            #     div(class="panel-body",        
#                            #         "ANTIBIO-NEED"),style = "color:#6de4d7"),
#                            div(
#                              # class="panel panel-default",
#                              div(class="panel-body",
#                                  strong(span("Votre centre n’est pas encore randomisé. Vous n’avez donc pas accès aux algorithmes"))
#                                  
#                              )
#                              
#                              
#                            )
#                          )
#                          
#                          
#                        }
#                        
# )
