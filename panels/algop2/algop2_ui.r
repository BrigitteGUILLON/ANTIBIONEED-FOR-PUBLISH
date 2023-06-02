# conflict_prefer("box", "shinydashboard")

 
resultat_color <- "#DCDCDC"


box_step1_color <- "#006688"
   

box_step2_color <- "#8FA39D"


box_step3_color  <-  "#25E4B4" 


box_step4_color <- "#006688"
 

fontColorRed<- "color: red" 

fontColorNoir <- "color : black" 


pdf_color <- "#25E4B4"



pdf_color <- "#FF0000"
screen_shot_color <- "#003366"

margin_bottom <- "margin-bottom:15px"

border_radius <- "border-radius:5px"




styleMessageInfo <- "#info4 {
                                            display: inline;
                                            margin: 10px;
                                            color: orange;
                                            }"


# box allergie
styleMessageInfo8 <- "#info8 {
                                            display: inline;
                                            margin: 10px;
                                            color: orange;
                                            }"


BOX_ALLER <-
  
  box(id="BOX_ALLER",
      width=12, 
      fluidRow(
        
        style=paste0("color: #00000;background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice,";","margin-right : 15px"),
        column(12,
               tags$head(
                 tags$style(
                   HTML(styleMessageInfo8)))
               ,
               # align="left",  
               
               
       
        
             # style=paste0(fontColorBlanc, "background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom) ,
        
           
             radioButtons("ALLERGIE2",
                          label = HTML(tr("QuestionAllergie"),
                                       as.character(actionLink(inputId = "info8", 
                                                               label = "", 
                                                               icon = icon("info-circle")))),
                          
                         choices = c("Non"=2,"Non sévère"=0, "Sévère"=1),selected=character(0),inline = TRUE)
             
         
 
      
  
  )
  )
)
 


BOX_DOCUMICRORB <-
  
  box(id="BOX_DOCUMICRORB",
      width=12, 
      fluidRow(
 
        style=paste0("color: #00000;background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice,";","margin-right : 15px"),

        column(12,
               radioButtons("DOCUMICRO",textOutput("question2Docum"),c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))),
        fluidRow(
          style=paste0("color: #00000;background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",petitePolice,";","margin-right : 15px"),
        column(12,
          
              
               conditionalPanel(condition = "input.DOCUMICRO == 0", 
               # style=paste0("color: #00000;background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice),
               
                                
                                fluidRow(
                                 
                                         
                                         column(12,
                                            

                                                tags$head(
                                                  tags$style(
                                                    HTML(
                                                      "#GERM_SA
        label {
          float:left;margin-left : 5px;
        }
      "
                                                    )))

                                               
      
                                                ,
                                   
                                                
                                                fluidRow(
                                                  # style=paste0("margin-left : 1px"),
                                                column(5,"Staphylococcus aureus"),
                                                column(7, radioButtons("GERM_SA",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  column(12,
                                                conditionalPanel(condition = "input.GERM_SA == 0", 
                                                                 
                                                                 tags$div(id="BOXSATAG"),
                                                                tags$div(id="BOXSA")
                                                                 
                                                              
                                                            
                                                                 
                                                                 
                                                              )
                                            
                                                                 # tags$style(HTML("#GERM_SACLOX label  {float:left; } " )),
                                                           
                                                
                                  )
                                  
                                
                                  ,
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_SCN
        label {
          float:left;margin-left : 5px; 
        }
      "
                                             ))),
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 1px"),
                                         column(5,"Staphylococcus non aureus"),
                                         column(7, radioButtons("GERM_SCN",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                   
                                   
                                  column(12,
                                           
                                                conditionalPanel(condition = "input.GERM_SCN == 0", 
                                                          
                                                                 tags$div(id="BOXSCNTAG"),
                                                                 tags$div(id="BOXSCN")
                                                                 
                                               
                     
                                  )
                                      )   ,
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_EFEC
        label {
          float:left;margin-left : 5px; 
        }
      "
                                             ))),
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 1px"),
                                         column(5,"Enterococcus faecalis"),
                                         column(7, radioButtons("GERM_EFEC",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                         
                                         
                                              
                                  column(12,
                                         
                                               
                                                conditionalPanel(condition = "input.GERM_EFEC == 0", 
                                                                 
                                                                 
                                                                 tags$div(id="BOXEFECTAG"),
                                                                 tags$div(id="BOXEFEC"),  
                                                                 
                                                                 
                                                                 
                                                              
                                                                 
                                                               
                                         )
                                         ),
                                  
                                  
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_EFAE
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 1px"),
                                         
                                         column(5,"Enterococcus faecium"),
                                         column(7, radioButtons("GERM_EFAE",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                  
                                  
                                  column(12,
                                         
                                    
                                                conditionalPanel(condition = "input.GERM_EFAE == 0", 
                                                                 
                                                                 tags$div(id="BOXEFAETAG"),
                                                                 tags$div(id="BOXEFAE")
                                                                 
                                                )),
                                  
                                  
                                  
                                  
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_STR
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Streptococcus"),
                                         column(7, radioButtons("GERM_STR",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                         
                                       
                                             column(12,
                                                conditionalPanel(condition = "input.GERM_STR == 0", 
                                                                   
                                                                 
                                                               
                                                                 
                                                                 
                                                                 
                                                                   tags$div(id="BOXSTRTAG"),
                                                                   tags$div(id="BOXSTR"),  
                                                                   
                                                                 )),
                                  
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_AGP
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Autre cocci gram+"),
                                         column(7, radioButtons("GERM_AGP",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                  
                                  
                                  column(12,
                                         
                                         
                                       
                                                conditionalPanel(condition = "input.GERM_AGP == 0", 
                                                                 
                                                                 
                                                                 
                                                                 tags$div(id="BOXAGPTAG"),
                                                                 tags$div(id="BOXAGP"),           
                                                                 )),
                                  column(12,
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_PA
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Pseudomonas aeruginosa"),
                                         column(7, radioButtons("GERM_PA",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                  
                                  column(12,
                                                 
                                                conditionalPanel(condition = "input.GERM_PA == 0", 
                                                                 
                                                                 tags$div(id="BOXPATAG"),
                                                                 tags$div(id="BOXPA"),            
                                            
                                                        
                                                                 
                                                                 
                                                                 )), 
                                  column(12,
                                         
                                         
                                         
                                         
                                        
                                        
                                         
                                         
                                     
                                                tags$head(
                                                  tags$style(
                                                    HTML(styleMessageInfo)))
                                                ,
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_E
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         
                                         fluidRow(
                                           # 
                                           # style=paste0("margin-left : 5px"),
                                         column(5,HTML("Entérobactérie",
                                                       as.character(actionLink(inputId = "info4", 
                                                                               label = "", 
                                                                               icon = icon("info-circle"))))),
                                       
                                         column(7, radioButtons("GERM_E",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                  
                                  column(12,
                                                # radioButtons("GERM_E",
                                                #              choices = c("Oui"=0, "Non"=1),
                                                #              label = HTML("Entérobactérie",
                                                #                           as.character(actionLink(inputId = "info4", 
                                                #                                                   label = "", 
                                                #                                                   icon = icon("info-circle")))),
                                                #              selected=1,inline = TRUE)
                                                
                                                
                                                # radioButtons("GERM_E", "Entérobactérie",c("Oui"=0, "Non"=1),selected=1,inline = TRUE),
                                                # radioTooltip(id="GERM_E", choice=0, title="[E.coli ; Klebsiella ; Enterobacter ; Citrobacter ; Proteus ; Morganella ;Hafnia ]",
                                                #              placement = "bottom", trigger = "hover")),
                                                # 
                                         
                                                conditionalPanel(condition = "input.GERM_E == 0", 
                                                                 
                                                                 
                                                                 tags$div(id="BOXETAG"),
                                                                 tags$div(id="BOXE"),           
                                                )),
                                  
                                  
                                  
                                
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#GERM_AGN
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Autre bactérie gram-"),
                                         column(7, radioButtons("GERM_AGN",label = "",choices = c("Oui"=0, "Non"=1),selected=1,inline = TRUE)))),
                                  
                                  
                                  column(12,
                                         
                                               
                                                conditionalPanel(condition = "input.GERM_AGN == 0", 
                                                                 tags$div(id="BOXAGNTAG"),
                                                                 tags$div(id="BOXAGN"),           
                                                )),
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#CLOS
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         # Attention oui = 1 et Non = 0 
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Clostridium difficile"),
                                         column(7,  radioButtons("CLOS", "",c("Oui"=1, "Non"=0),selected=0,inline = TRUE)))),
                                  
                                  

                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#MYCO
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Mycoplasma pneumoniae"),
                                         column(7, 
                                                radioButtons("MYCO", "",c("Oui"=1, "Non"=0),selected=0,inline = TRUE))))
                                         
                                  ,
                                  
                                  column(12,  
                                         
                                         tags$head(
                                           tags$style(
                                             HTML(
                                               "#LEGI
        label {
          float:left;margin-left : 5px;
        }
      "
                                             ))),
                                         
                                         fluidRow(
                                           # style=paste0("margin-left : 5px"),
                                         column(5,"Legionella"),
                                         column(7, 
                                                radioButtons("LEGI", "",c("Oui"=1, "Non"=0),selected=0,inline = TRUE))))
                              
                                         
                                 
                                  # 
                                  # column(12,  
                                  #        column(6,
                                  #               radioButtons("Influ", "Influenza A ou B",c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))
                                  #        
                                  # )
                                  
                                  
                                  
                                ) 
                                
               ) )
        
        
      )
      
  )




BOX_FI <-
  
  box(id="BOX_FI",
      width=12,  
      conditionalPanel(condition = "input.DOCUMICRO == 0", 
      
      fluidRow(
        style="margin-right : 15px",
  
                 
            column(12,     
                   style=paste0("color: #00000;background-color:" ,box_step1_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) ,       
                                selectInput("FI", textOutput("question2CliniqueIdentMicro"),choices = c(
                                  "Bactériémie isolée"=1,  
                                  "Poumon"=2,
                                  "Urines"=3,
                                  "Digestif"=4,
                                  "Peau"=5,
                                  "Autre"=6
                                )
                                )
                                
                                
                         )                          
                         
                         
                       ) 
                       
      )
   
  )




BOX_CSINIT <-
  
  box(id="BOX_CSINIT",
      width=12, 
      fluidRow(
        style="margin-right : 15px",
 
        # style="margin-right : 2px",
        column(12,
        style=paste0("color: #00000;background-color:",box_step2_color ,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) ,
        conditionalPanel(condition = "input.DOCUMICRO == 1", 
        radioButtons("CSINIT",textOutput("question2CSI"),c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))

)

)
)


BOX_AM <-
  
  box(id="BOX_AM", 
    width=12, 
    conditionalPanel(condition = "input.DOCUMICRO == 1", 
                               conditionalPanel(condition = "input.CSINIT == 0",
        fluidRow(
          style="margin-right : 15px",
          column(12,
                style=paste0("color: #00000;background-color:",box_step2_color ,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) ,       
                
             radioButtons("AC",textOutput("question2AmelC"),c("Oui"=1,"Non"=0),selected=character(0),inline = TRUE)))
      # 
      #   
      
  )   
)

)


 BOX_FCI <-
  
  box(id="BOX_FCI",
      width=12, 
      conditionalPanel(condition = "input.DOCUMICRO == 1", 
                       conditionalPanel(condition = "input.CSINIT == 0",
                                        conditionalPanel(condition = "input.AC == 1",     
      fluidRow(
        style="margin-right : 15px",
      # width=4, 
                 
      column(12,   
    
             style=paste0("color: #00000;background-color:",box_step2_color ,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice) ,
            
                      selectInput("FCICS", textOutput("question2CliniqueIdent1"),choices = c(
                        "Aucun"=0,
                        "Poumon"=1,  
                        "Digestif"=3,
                        "Cathéter veineux central"=4,
                        "Périnée"=5,
                        "Cutané (autre que cathéter central ou périnée)"=6,
                        "Autre"=7)
                      ),
                     
                      conditionalPanel(condition = "input.FCICS == 1",
                                       radioButtons("FCICS_P", "Pneumonie interstitielle",c("Oui"=0, "Non"=1),selected=9,inline = TRUE)),
                      conditionalPanel(condition = "input.FCICS == 6", 
                                       radioButtons("FCICS_D", "Dermo-hypodermite nécrotique",c("Oui"=0, "Non"=1),selected=9,inline = TRUE))
                      
                      
               )                          
      )
  
      ) 
      )
)
)





 
 BOX_AGGRAV <-
   
   box(id="BOX_AGGRAV",
       width=12, 
       conditionalPanel(condition = "input.DOCUMICRO == 1", 
                        conditionalPanel(condition = "input.CSINIT==1",
       fluidRow(
         style="margin-right : 15px",
         column(12,
                style=paste0("background-color:" ,box_step3_color,";",border_radius ,";",margin_bottom,";",fontColorNoir,";",MoyennePolice),
            
                                                  radioButtons("AGGRAV", textOutput("question2AggC"),c("Oui"=0, "Non"=1), selected=character(0),inline = TRUE)))
                
         )
       )   
       
       
   )
 
 
BOX_CS <-
  
  box(id="BOX_CS",
      width=12, 
      conditionalPanel(condition = "input.DOCUMICRO == 1", 
                       conditionalPanel(condition = "input.AGGRAV==0",
                                        conditionalPanel(condition = "input.CSINIT==1",
 fluidRow(
   style="margin-right : 15px",          
      column(12,
             
             style=paste0("background-color:" ,box_step3_color,";",border_radius ,";",margin_bottom,";",fontColorNoir,";",MoyennePolice),
   
             radioButtons("CS",textOutput("question2CSA"),c("Oui"=0, "Non"=1),selected=character(0),inline = TRUE))))
      # 
      #   
      )
    

)
)

BOX_FCI2 <-
  
  box(id="BOX_FCI2",
      width=12, 
      conditionalPanel(condition = "input.DOCUMICRO == 1", 
                       conditionalPanel(condition = "input.CSINIT == 1", 
      conditionalPanel(condition = "input.AGGRAV==1",
                       fluidRow(
                         style="margin-right : 15px",    
      column(12, 
             style=paste0("background-color:" ,box_step4_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice),
                   
                      selectInput("FCI2",   textOutput("question2CliniqueIdent2"),choices = c(
                        "Aucun"=0,
                        "Poumon"=1,  
                        "Digestif"=3,
                        "Périnée"=5,
                        "Cutané"=6
                      ))
                      
                      
                      
               )                          
      )
      )   
)
)
)

BOX_SAPPLA <-
  
  box(id="BOX_SAPPLA",
      width=12, 
      conditionalPanel(condition = "input.DOCUMICRO == 1", 
      conditionalPanel(condition = "input.CSINIT == 1", 
      conditionalPanel(condition = "input.AGGRAV==1" , 
                     
                    
                                        
                                        fluidRow(
                                          style="margin-right : 15px",               
                                          column(12,
                                                 style=paste0("background-color:" ,box_step4_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice),
                                                 
                                                 radioButtons("SAPPLA",textOutput("question2SAplasie"),c("Oui"=0, "Non"=1),selected=9,inline = TRUE))
                                          # 
                                          #   
                                          
                                        )   
                       )
                       
      )
      
  )
)

BOX_FIEVRE <-
  
  box(id="BOX_FIEVRE",
      width=12, 
      conditionalPanel(condition = "input.DOCUMICRO == 1", 
    conditionalPanel(condition = "input.CSINIT == 1", 
conditionalPanel(condition = "input.AGGRAV==1" , 
      conditionalPanel(condition = "input.SAPPLA==1",
                       conditionalPanel(condition = "input.FCI2==0",
    
                       fluidRow(
                         style="margin-right : 15px",               
                         column(12,
                                style=paste0("background-color:" ,box_step4_color,";",border_radius ,";",margin_bottom,";",fontColorBlanc,";",MoyennePolice),
                                
                                radioButtons("FIEVRE",textOutput("question2Fievre"),c("Oui"=0, "Non"=1),selected=9,inline = TRUE))
                         # 
                         #   
                         
                       )   
      )
  )
)
)
)
)

box_result_style <-
  paste0(border_radius,";background-color:",resultat_color ," ;
         # petitePolice,
         text-align : center;
         border-color :",box_step1_color,";  
         border-width : 1 px ;
         border-style : solid ;
         padding : 15px")


Box_RESULT_GEN <- 
  
  box (id="Box_RESULT_GEN",
       width=12, 
              #  # valueBoxOutput("BoxresultAlgo2",width=NULL ),
              #                             ("lightyellow","lightgreen","limegreen","lightblue","white","#9370DB")))%>%  
              # formatStyle(names(TABBRES)[-1],   fontWeight = 'bold',                         
       
              panel(
                style = box_result_style,
                    # style="color: blue;background-color: #white;border-color: #9370DB;",
                    "DUREE",
                    textOutput("DUREE")),
              
              panel( 
                style = box_result_style,
                "Recommandations",
              # textOutput("TextresultAlgo_Box5")
                # verbatimTextOutput("TextresultAlgo_Box5")
              htmlOutput("TextresultAlgo_Box5")
                )
          
    
  )





Box_ERROR2 <- 
  
  box (id="Box_ERROR2",
       width=12,
       conditionalPanel(condition = "output.messageNotEmpty2==true",
         style =  box_alerte_style2,
         textOutput("ERROR2")
      
  )     

)


Box_BUTTON_POPUP <- 
  box (id="Box_BUTTON_POPUP",
       width=12,
        conditionalPanel(condition = "output.finisher2==true",
                        
                         column(4,  
                               downloadButton("report2","Pdf")),
                         conditionalPanel(condition = "input.DOCUMICRO == 0",
                         column(4,  
                                downloadButton("reportMatrice","Pdf MAtrice"))),
                         
                         
                         column(4,        
                                actionButton("reset2", "RESET",style = style_reset)) )
       # ,
       # column(6,        
       #        actionButton("debug", "debug",style = paste0(fontColorBlanc,";","background-color :",reset_color )))
              
       
  )



# 
# Box_BUTTON2 <- 
#   box (id="Box_BUTTON2",
#        
#        width=12,
#        column(6,  
#               # sliderInput("slider", "Slider", 1, 100, 50),
#               # downloadButton("pdfGenere", "Générer le document"),
#               # downloadButton('Document')),
#               downloadButton("report2","Pdf"))
#        # column(6,        
#        #        actionButton("reset", "RESET",style = paste0(fontColorBlanc,";","background-color :",reset_color ))) 
#   )




# 
# Box_ALGO2_POPUP <- 
#   box (id="Box_ALGO2_POPUP",
#        width=12,
#        # conditionalPanel(condition = "output.finisher2==true",
#                         
#                         column(12 ,
#                                
#                                # style=paste0(moyennePolice),
#                                
#                                column(6,
#                                       textOutput("TextresultAlgo_des_TT1"))
#                                ,
#                                column(6,
#                                       textOutput("TextresultAlgo_poso_TT1"))
#                         ),
#                         column(12,
#                                # style=paste0(moyennePolice),
#                                column(6,
#                                       textOutput("TextresultAlgo_des_TT2"))
#                                ,
#                                column(6,
#                                       
#                                       textOutput("TextresultAlgo_poso_TT2"))
#                         ),
#                         column(12,
#                                # style=paste0(moyennePolice),
#                                # 
#                                
#                                column(6,
#                                       
#                                       textOutput("TextresultAlgo_des_TT3"))
#                                ,
#                                column(6,
#                                       
#                                       textOutput("TextresultAlgo_poso_TT3"))
#                         ),
#                         
#                         column(12,
#                                # style=paste0(moyennePolice),
#                                column(6,
#                                       
#                                       textOutput("TextresultAlgo_des_TT4"))
#                                ,
#                                column(6,
#                                       
#                                       
#                                       textOutput("TextresultAlgo_poso_TT4")))
#                        
#                         # column(12,
#                         #        column(12,
#                         #               style=paste0(StyleTitre),
#                         #               "Recommandations"),
#                         #        column(12,
#                         #               # style=paste0(moyennePolice),
#                         #               textOutput("TextresultAlgo_Box5"))
#                         # )
#        # )
#        
#   )
# 



 

 


algop2_panel <- tabPanel ("Réevaluation Antibiothérapie à J3",
                          
                          conditionalPanel(condition = "output.utilisateurer==false",
                                           { fluidPage(
                                             
                                             
                                             
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
                                           }
                          ),
                         
                          conditionalPanel(condition = "output.utilisateurer==true",
                          { 
                            dashboardBody(
                              
                              useShinyjs(),
                              div(
                                id = "form",     
                                
                                fluidRow(
                                  
                                  column(3,
                                         # "place pour les antibiothérapies en cours",
                                         
                                         tags$div(id="Box_ENCOURS")   
                                         
                                  ), 
                                  column(6,
                                         
                                         fluidRow(
                                           fluidRow(
                                             BOX_ALLER),
                                           fluidRow( 
                                             BOX_DOCUMICRORB), 
                                           
                                           fluidRow(
                                             BOX_FI),
                                           fluidRow(
                                             BOX_CSINIT),
                                           fluidRow(
                                             BOX_AM),
                                           fluidRow(
                                             BOX_FCI),
                                           fluidRow(  
                                             BOX_AGGRAV),
                                           fluidRow(
                                             BOX_CS),
                                           fluidRow(
                                             BOX_FCI2
                                           ),
                                           fluidRow(  
                                             BOX_SAPPLA),
                                           fluidRow(  
                                             BOX_FIEVRE)
                                           
                                         ) ,
                                         column(width = 10,
                                                fluidRow(  
                                                  Box_ERROR2), 
                                                fluidRow( 
                                                  Box_RESULT_GEN))
                                         
                                         
                                  ),
                                  
                                  
                                  
                                  column(3, 
                                         # fluidRow(
                                         #   tags$div(id="Box_RESULT")), 
                                         # textOutput("ERROR"), 
                                         
                                         fluidRow(
                                           tags$div(id="Box_RESULT_DES"))
                                         
                                  ),
                                  
                                  column(12, Box_BUTTON_POPUP),
                                  column(12, tags$div(id="Box_DEBUG_BG"))
                                  # column(12, Box_BUTTON2)
                                  
                                  
                                ),
                                
                                column(12, tags$div(id="Box_RESULT_STRATEGIE")),
                                column(12, tags$div(id="Box_BOX1_OLIVIER"))
                                
                                
                                
                              )
                              
                            )                               
                            
                            
                            
                          } ) 
                      
                          
)


