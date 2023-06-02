

GetUser<-reactive({
  return(session$user)
})

logname <- "NOLOGNAME"

if (length(session$user)>0) {logname <- session$user} 


# print(logname)

output$logname <- renderText({
 logname
}) 
