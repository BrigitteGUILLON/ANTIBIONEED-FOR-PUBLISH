source("config.R")
 

navBarPageARGS = list(projectName)


if (presentation == T){

  source('panels/presentation/presentation_ui.r',local=T,encoding="UTF-8")
  navBarPageARGS = append(navBarPageARGS, list(presentation_panel) )
}
# 


if (APPLI == T){
  source('panels/appli/appli_ui.r',local=T,encoding="UTF-8")
  navBarPageARGS = append(navBarPageARGS, list(appli_panel))
}

if (carte == T){
  source('panels/carte/carte_ui.r',local=T,encoding="UTF-8")
  navBarPageARGS = append(navBarPageARGS, list(carte_panel))
}


if (ALGO1 == T){ 
  source('panels/algo/algo_ui.r',local=T,encoding="UTF-8")
  navBarPageARGS = append(navBarPageARGS, list(algo_panel))
}


if (ALGO2 == T){
  source('panels/algop2/algop2_ui.r',local=T,encoding="UTF-8")
  navBarPageARGS = append(navBarPageARGS, list(algop2_panel))
}




hauteur = 50 
navbarPagePerso = do.call(navbarPage, navBarPageARGS)





shinyUI(
  fluidPage(theme = shinytheme("flatly"),
           
            div(style="display: flex; align-items: center; width: 100%; justify-content: space-around;",
                img(src="APHP.png",style="height:3rem"), 
                img(src="INC.png",style="height:3rem"),
                img(src="APP_IMPEC.png",style="height:3rem"),
                img(src="LOGO-ATBNEED2.png",style="height:80px",id="logo2") ,
                img(src="USL.png",style="height:60px"),
                img(src="SBIM.png",style="height:3rem"),
                img(src="Inserm.png",style="height:3rem")
               
            ),
            
          
            # 

            tags$head(
           

              # Note the wrapping of the string in HTML()
              tags$style(HTML("
              
              
      @import url('https://fonts.googleapis.com/css2?family=Baloo&display=swap');
     
      h1 {
        font-family: 'Baloo', sans-serif;
      }
    ")),
              
              
              tags$style(HTML("




                          .navbar-default .navbar-brand{color: white;}
                           .navbar-default .navbar-nav > .active > a,
                           .navbar-default .navbar-nav > .active > a:focus,
                           .navbar-default .navbar-nav > .active > a:hover {
                                text-decoration:underline ;
                                color: #000000;
                                background-color: #fdecff;
                            }

")),
              
              
#               
#               tags$style(HTML("
# 
#          .navbar a[data-value='Antibiothérapie initiale aux urgences' ] {background-color: #fc913a;}
#           .navbar a[data-value='Réevaluation Antibiothérapie à J3'] {background-color: #ff4e50;}
#  
#   .navbar li:active {
# text-decoration:underline ;
#        }
#      
#  
# #   .navbar li:hover {
# # text-decoration:underline ;
# #        }
# 
# 
#                   "))
              # ,
            ),
            
            
            
            
            div( 
              h1(strong("ANTIBIONEED"), align="center", color =  box_step1_color, style = "font-family: 'Baloo'"),
            br(),
navbarPagePerso
            ))
)


print("ui.R done.")










