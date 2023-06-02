# Server for ANTIBIONEED app
 
shinyServer(function(input, output,session) {
 

    # 
    # GetUser<-reactive({
    #   return(session$user)
    # })
    # 
    

    UTILISATEUROK <- FALSE  
    UTILISATEUR <- reactiveVal(FALSE)  
    
    logname <- "NOLOGNAME"
    difday <- NULL

    if (length(session$user)>0) {logname <- session$user} 
    

 
    if (length(visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)])>0)
      
   { datej <- visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)] 
    UTILISATEUROK <- TRUE}
   
    if (length(visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)])>0)
      
    { datej <- visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)]
    UTILISATEUROK <- TRUE }
    
    
    # 
 
    
    
 
    if (UTILISATEUROK)
    {
    difday <- as.numeric(difftime(today(), datej,units = "days"))
    }
  else
    {print("l'utilisateur n'est pas autorisé à accéder à l'application ")
      stop()}



if (difday>-1)  {UTILISATEUR(TRUE)}
  


 
   
  
    
  if(presentation == T)
    source("panels/presentation/presentation.r", local=T)
 
    
  if(APPLI == T)
      source("panels/appli/appli.r", local=T)

  if(carte == T)
    source("panels/carte/carte.r", local=T,encoding="UTF-8")


  if(ALGO1 == T)
    source("panels/algo/algo.r", local=T )
    
   

  if(ALGO2 == T)
    source("panels/algop2/algop2.r", local=T)
    

 
    
    
    
    filenaming <- function() {
      
      
      Listecodes <-  read_feather(paste0(FeatherDir,"PDFCODE.feather"))
      
      ListecodesDISPO <- subset(Listecodes,is.na(Listecodes$LOGIN))
      l <-  ListecodesDISPO[1,] 
      #   
      #   
      lecode <- l$CODEPDF 
      
      if (!is.na(lecode))
        
      {
      return(lecode)
      }
    } 
    

    filenaming_write <- function(lecode) {
      
      OK <-  FALSE
      Listecodes <-  read_feather(paste0(FeatherDir,"PDFCODE.feather"))
      
      ListecodesDISPO <- subset(Listecodes,is.na(Listecodes$LOGIN))
      
      
      l <-  ListecodesDISPO[1,] 
      
      if (l$CODEPDF == lecode) {
      Listecodes$LOGIN[which(Listecodes["CODEPDF"]==lecode)]  <- logname
      Listecodes$DATEPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.Date()) 
      Listecodes$TIMEPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.time(), "%H")
      Listecodes$TIMEMINUTESPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.time(), "%M")
      write_feather(Listecodes,paste0(FeatherDir,"PDFCODE.feather"))
     OK <-  TRUE
      }
      
      
      return(OK)
      
    
    } 
 
    
    
    print("server.R done")
    

  })
  
   