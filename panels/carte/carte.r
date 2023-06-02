

  output$map <- renderLeaflet({
    m <- leaflet() %>% addTiles()
    MedicIcon <- makeIcon(
      iconUrl = "LOGO-ATBNEED.png",
      iconWidth = 50, iconHeight = 50,
    )





    leaflet(data = centres) %>% addTiles() %>%
      addMarkers(map=m,
                 lng =centres$long,
                 lat= centres$lat,
                 icon = MedicIcon,
                 popup=paste(centres$Hopital, "<br>",
                             "Investigateur : ", centres$`NomIP`, "<br>",
                             centres$Ville
                 ))
  })

    
    