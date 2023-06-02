
 
shinyServer(function(input, output,session) {
 

    # 
    # GetUser<-reactive({
    #   return(session$user)
    # })
    # 
    
  rv <- reactiveValues(download_flag = 0)
  rv2 <- reactiveValues(download_flag2 = 0)
  rv3 <- reactiveValues(download_flag3 = 0)
  

    UTILISATEUROK <- FALSE  
    UTILISATEUR <- reactiveVal(FALSE)  
    
    logname <- "NOLOGNAME"
    difday <- NULL

    if (length(session$user)>0) {logname <- session$user} 
    

 # Liste des centres 
    if (length(visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)])>0)
      
   { datej <- visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)] 
    UTILISATEUROK <- TRUE}
   
    
    
    if (length(visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)])>0)
      
    { datej <- visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)]
    UTILISATEUROK <- TRUE }
    
    
    
    
    if (length(visibiliteTest$DATEOUVERTURE[which(visibiliteTest["LOGIN"]==logname)])>0)
      
    { datej <- visibiliteTest$DATEOUVERTURE[which(visibiliteTest["LOGIN"]==logname)]
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
  


 
    filenaming <- function() {
      
      
      Listecodes <-  read_feather(paste0(FeatherDir,"PDFCODE.feather"))
      
      ListecodesDISPO <- subset(Listecodes,is.na(Listecodes$LOGIN))
      l <-  ListecodesDISPO[1,] 
      #   
      #   
      lecode <- l$CODEPDF 
      #   
      Listecodes$LOGIN[which(Listecodes["CODEPDF"]==lecode)]  <- logname
      # Listecodes$DATEPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.Date()) 
      # Listecodes$TIMEPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.time(), "%H")
      # Listecodes$TIMEMINUTESPDF[which(Listecodes["CODEPDF"]==lecode)]  <- format(Sys.time(), "%M")
      # print(lecode)
      
      
      write_feather(Listecodes,paste0(FeatherDir,"PDFCODE.feather"))
      return(lecode)
    } 
    
    
    filenamed <- function(lenom) {
    
      line <- paste0(lenom,":",logname,":",format(Sys.Date()),":",format(Sys.time(), "%H"),":",format(Sys.time(), "%M"))
 
      write(line,file="listedespdf.txt",append=TRUE)
    
    } 

    
  if(presentation == T)
    source("panels/presentation/presentation_ui.r", local=T)
 
    
  if(APPLI == T)
      source("panels/appli/appli.r", local=T)

  if(carte == T)
    source("panels/carte/carte.r", local=T,encoding="UTF-8")


  if(ALGO1 == T)
    source("panels/algo/algo.r", local=T )
    

  if(ALGO2 == T)
    source("panels/algop2/algop2.r", local=T)
    
     

 
    
  
  
  
  
    filename <- function() { return(paste0("ANTIBIONEED-J0-", filenaming(),".pdf"))} 
    
  
    
    filename2 <- function() { return(paste0("ANTIBIONEED-J3-", filenaming(),".pdf"))} 
    
    
    
    filename3 <- function() {  return(paste0("ANTIBIONEED-MATRICE-J3-", filenaming(),".pdf") )} 

 
    
    
    
    
    print("server.R done")
    

  })
  
   