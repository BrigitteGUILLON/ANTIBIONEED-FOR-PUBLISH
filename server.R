
# Server for ANTINB
shinyServer(function(input, output,session) {
  
  
  # 
  # GetUser<-reactive({
  #   return(session$user)
  # })


# ShinyManager ------------------------------------------------------------

  
  res_auth <- secure_server(
    check_credentials = check_credentials("/home/bguillon/DB/antibioneed.sqlite")
  )
  # recuperation des infos utilisateurs
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  
  
  observeEvent(res_auth$user, {
    # all my server side functions here
    print("executing server functions...")
  })
  
  
  # si besoin, des inputs sont créés
  observe({
    print(input$shinymanager_where)
    print(input$shinymanager_language)
  })
  

# Tab ---------------------------------------------------------------------

  
  # Source the tab if true, possibility to choose which to show (set the parameter in global.R) 
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
  
  rv <- reactiveValues(download_flag = 0)
  rv2 <- reactiveValues(download_flag2 = 0)
  rv3 <- reactiveValues(download_flag3 = 0)
  

# User --------------------------------------------------------------------

  
  UTILISATEUROK <- FALSE  
  UTILISATEUR <- reactiveVal(FALSE)  
  # Default user : for development test
  
  logname <- "NOLOGNAME"
  difday <- NULL
  
  # if inside a session (deployed app), then memorize the user 
  if (length(session$user)>0) {logname <- session$user} 
  
  


# Visibility --------------------------------------------------------------

  #Test if the user is referenced in one of the visibility table 
  
  if (length(visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)])>0)
    
  { datej <- visibilite$DATEOUVERTURE[which(visibilite["LOGIN"]==logname)] 
  UTILISATEUROK <- TRUE}
  
  
  
  if (length(visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)])>0)
    
  { datej <- visibiliteDev$DATEOUVERTURE[which(visibiliteDev["LOGIN"]==logname)]
  UTILISATEUROK <- TRUE }
  
  
  
  
  if (length(visibiliteTest$DATEOUVERTURE[which(visibiliteTest["LOGIN"]==logname)])>0)
    
  { datej <- visibiliteTest$DATEOUVERTURE[which(visibiliteTest["LOGIN"]==logname)]
  UTILISATEUROK <- TRUE }
  
  
  
  # If user is referenced , calculation of the number of days, if > 1 then the user can view the app 
  
  
  
  
  if (UTILISATEUROK)
  {
    difday <- as.numeric(difftime(today(), datej,units = "days"))
  }
  else
  {print("l'utilisateur n'est pas autorisé à accéder à l'application ")
    stop()}
  
  
  
  if (difday>-1)  {UTILISATEUR(TRUE)}
  

# Pdf naming --------------------------------------------------------------

  
  
  
  filenaming <- function() {
    
    # read the next free code , free code have "Login column" value as NA 
    Listecodes <-  read_feather(paste0(FeatherDir,"PDFCODE.feather"))
    
    ListecodesDISPO <- subset(Listecodes,is.na(Listecodes$LOGIN))
    l <-  ListecodesDISPO[1,] 
    #   
    #   
    lecode <- l$CODEPDF 
    #   update the code roxw with the user name on column LOGIN 
    #.  this current code isnt anymore free 
    Listecodes$LOGIN[which(Listecodes["CODEPDF"]==lecode)]  <- logname
 

    
    write_feather(Listecodes,paste0(FeatherDir,"PDFCODE.feather"))
    return(lecode)
  } 
  
  filenamed <- function(lenom) {
    
    line <- paste0(lenom,":",logname,":",format(Sys.Date()),":",format(Sys.time(), "%H"),":",format(Sys.time(), "%M"))
    
    write(line,file="listedespdf.txt",append=TRUE)
    
  } 
  

# one function per document type  -----------------------------------------
  
  filename <- function() { return(paste0("ANTIBIONEED-J0-", filenaming(),".pdf"))} 
  
  filename2 <- function() { return(paste0("ANTIBIONEED-J3-", filenaming(),".pdf"))} 
  
  filename3 <- function() {  return(paste0("ANTIBIONEED-MATRICE-J3-", filenaming(),".pdf") )} 
  
  

  # print("server.R done")
  
  
})
  
   