library(leaflet); library(htmlwidgets); library(sf)
library(tidyverse)

setwd("~/gens/Lucie/ping")

table_tennis_pts <-  st_read("data/in/table_paris.gpkg")
vert <- st_read("data/in/espaces_verts/espaces_verts.shp") %>% 
  filter(!(type_ev %in% c('Décorations sur la voie publique')))

#https://icon-icons.com/fr/icone/Tennis-tennis-de-table-sport-ping-pon/12566
icon <-  makeIcon("data/in/icon_raquette.png", 18, 18)

map <- leaflet(table_tennis_pts) %>%  
  addProviderTiles(providers$Stamen.TonerHybrid) %>%
  addMarkers(icon = icon) %>% 
  addPolygons(data = vert, weight=0, fillColor = 'darkgreen')



saveWidget(map, file="map.html")
