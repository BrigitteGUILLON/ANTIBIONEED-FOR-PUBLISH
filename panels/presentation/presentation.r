
output$CRF<- downloadHandler(
  
 
  
  filename <- function() {
   
    paste("CRF", "pdf", sep=".")
  },
     
 

  content = function(f) {
    
    
    file.copy("www/CRF.pdf",f)
    
    
  }
  
  
)