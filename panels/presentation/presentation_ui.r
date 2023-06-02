presentation_panel <- tabPanel("Présentation", icon = icon("info"),
                               fluidPage(
                        
                                 # div(class="panel panel-default",
                                 #     div(class="panel-body",        
                                 #         "ANTIBIO-NEED"),style = "color:#6de4d7"),
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span("Impact of computerized decision support for Antibiotic prescription in cancer patients with febrile Neutropenia in the Emergency Department on treatment failure. A randomized cluster controlled trial"))
                                   )),    
                                 
                                 div(
                                   # class="panel panel-default",
                                   div(
                                     class="panel-body",
                                     "L'étude a pour objectif d'évaluer une application accessible via son smartphone d'aide à la prescription initiale d'antibiotiques chez les patients neutropéniques fébriles aux urgences. Cette application permettra également la réévaluation précoce de l'antibiothérapie en cas d'hospitalisation. L'étude utilisera un design innovant de randomisation des centres par grappes (stepped wedge cluster) : chaque mois, un certain nombre de centres auront accès à l'application. ")
                                 ), 
                                 div(
                                   # class="panel panel-default",
                                   div(
                                     class="panel-body",
                                     strong(span("Critère de jugement principal :")),
                                     em(" échec  de l'antibiothérapie.   ")
                                   )),     
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span( "Critères de jugement secondaires :")),
                                       em(" Durée et spectre antibiotique ; consommation de carbapénèmes, d'aminosides et de glycopeptides; surinfections et colonisations à BMR ; durée de séjour à l'hôpital ; mortalité et coûts des soins médicaux. ") 
                                   ))  ,
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span( "Nombre de centres :")),
                                       em(" 30  ") 
                                   ))  ,
                                 
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span( "Durée de l'étude :")),
                                       em(" 10 mois ") 
                                   ))  ,
                                 
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span( "Nombre de Patients nécessaires :")),
                                       em(" 600 patients (soit 1,7 patient/centre/mois) ") 
                                   ))      ,
                                       
                                 div(
                                   # class="panel panel-default",
                                   div(class="panel-body",
                                       strong(span( "Critères d'inclusions :")),br(),
                                       em("Age ≥18 ans "),br(),
                                      em("Fièvre rapportée ou observée aux urgences (38,3°C à 1 occasion ou ≥38°C à 2 occasions en moins d’1 heure)") ,br(),
                                       em("Neutropénie post-chimiothérapie (PNN ≤500/mm3 ou ≤1000/mm3 avec une décroissance ≤500/mm3 attendue dans les 24-48h) ") ,br(),
                                       em("Ayant signé un consentement éclairé écrit  ") ,br()
                                   ))    # 
                                 # 
                                 # 
                                 # ,
                                 # column(6,  
                                 #        downloadButton("CRF","CRF (Pdf)"))
                                 
                                 
                                 
                               )        
                               
                               
                               
                               
                               
                               
                               
)
