appli_panel <- tabPanel("Appli",icon = icon("info"),
                        fluidPage(
                          # textOutput("logname"), 
                          align = "left",
                          
                          
                          
            
                            # class="panel panel-default",
                          
                          
                          
                          
                          div(
                            # class="panel panel-default",
                            div(
                              class="panel-body",
                              strong(span("Cette application est le fruit d'un travail de plusieurs intervenants et corps de métiers"))
                              
                            )),     
                          br(),
                          div(
                            class="panel-body",
                            strong(span( "Ecriture des algorithmes , validation :")),
                            div(
                              ("Dr Olivier Peyrony, Praticien Hospitalier,  Service des Urgences, Hôpital Saint-Louis, AP-HP, Paris, France")) ,
                            div( "Dr Matthieu Lafaurie, Praticien Hospitalier, Service de Maladies Infectieuses et Tropicales, Unité Mobile d'Infectiologie, Hôpital Saint-Louis, AP-HP, Paris, France"),
                            div( "Dr Jean-Paul Fontaine, Praticien Hospitalier, Chef de Service, Service des Urgences, Hôpital Saint-Louis, AP-HP, Paris, France"))
                          
                          
                          ,
                          br(),
                          div(
                            # class="panel panel-default",
                            div(class="panel-body",
                                strong(span( "Références dont est issu l’algorithme:"))
                            ))                          # 
                          ,
                          
                          
                          
                          
                          div(
                            # class="panel panel-default",
                            div(class="panel-body",       
                                em("  Averbuch D, Orasch C, Cordonnier C, Livermore DM, Mikulska M, Viscoli C, Gyssens IC, Kern WV, Klyasova G, Marchetti O, Engelhard D, Akova M; ECIL4, a joint venture of EBMT, EORTC, ICHS, ESGICH/ESCMID and ELN. European guidelines for empirical antibacterial therapy for febrile neutropenic patients in the era of growing resistance: summary of the 2011 4th European Conference on Infections in Leukemia. Haematologica. 2013;98:1826-35. doi: 10.3324/haematol.2013.091025.")
                            ))
                          
                          ,
                          div(
                            # class="panel panel-default",
                            div(class="panel-body",
                                
                                em(" Freifeld AG, Bow EJ, Sepkowitz KA, Boeckh MJ, Ito JI, Mullen CA, Raad II, Rolston KV, Young JA, Wingard JR; Infectious Diseases Society of Americaa. Clinical practice guideline for the use of antimicrobial agents in neutropenic patients with cancer: 2010 Update by the Infectious Diseases Society of America. Clin Infect Dis. 2011;52:427-31. doi: 10.1093/cid/ciq147.")
                                
                                
                            )),
                          
                          
                          div(
                            # class="panel panel-default",
                            div(class="panel-body",
                                
                                em("Gudiol C, Aguilar-Guisado M, Azanza JR, Candel FJ, Cantón R, Carratalà J, Garcia-Vidal C, Jarque I, Lizasoain M, Gil-Bermejo JM, Ruiz-Camps I, Sánchez-Ortega I, Solano C, Suárez-Lledó M, Vázquez L, de la Cámara R. Executive summary of the consensus document of the Spanish Society of Infectious Diseases and Clinical Microbiology (SEIMC), the Spanish Network for Research in Infectious Diseases (REIPI) and the Spanish Society of Haematology and Haemotherapy (SEHH) on the management of febrile neutropenia in patients with hematological malignancies. Enferm Infecc Microbiol Clin (Engl Ed). 2020;38:174-181. doi: 10.1016/j.eimc.2019.01.013.")
                            )),
                          
                          div(
                            # class="panel panel-default",
                            div(class="panel-body",
                                
                                
                                em("la Martire G, Robin C, Oubaya N, Lepeule R, Beckerich F, Leclerc M, Barhoumi W, Toma A, Pautas C, Maury S, Akrout W, Cordonnier-Jourdin C, Fihman V, Venditti M, Cordonnier C. De-escalation and discontinuation strategies in high-risk neutropenic patients: an interrupted time series analyses of antimicrobial consumption and impact on outcome. Eur J Clin Microbiol Infect Dis. 2018;37:1931-1940. doi: 10.1007/s10096-018-3328-1.    ")
                                
                            ))
                          
                          , 
                          
                          div(
                              class="panel-body",
                            strong(span( "Design:")),
                            
                           
                                   div(
                                     "Olivier Peyrony")
                          )      
                                   ,
                                   
                                   # class="panel panel-default",
                             div(
                                     class="panel-body",  
                                     strong(span( "Conception, Développement, Déploiement :")),
                          
                                     div("Brigitte Guillon")),
                                   
                             div(
                                     # class="panel panel-default",
                                     div(class="panel-body",
                                         strong(span( "Avec la participation de :")),
                                         div(
                                           ("Coralie Boyer : développement javascript")) ,
                                         div(
                                         ("Emma Lafaurie : développement R Shiny, HTML")) ,
                                         div( ("Andrei Bonte/Nidhal Saad : administrateurs réseaux - SBIM"))
                                     )),
                            
                            div(
                              # class="panel panel-default",
                              div(class="panel-body",
                                  strong(span( "Version Application :")),
                                  div(
                                    versionAppli)
                              )),
                            div(
                              # class="panel panel-default",
                              div(class="panel-body",
                                  strong(span( "Version R :")),
                                  div(
                                    (version)) 
                              )),
                            
                            div(
                              # class="panel panel-default", 
                              div(class="panel-body",
                                  strong(span( "Sauvegarde et gestion de projet ")),
                                  div(
                                    ("gitlab")) 
                              )) ,
                          div(
                            class="panel-body",
                            strong(span("Vous êtes connecté en tant que" ), textOutput("logname") )
                            
                          )   
                    
                            # 
                            
                            
                          )
                        )
                        