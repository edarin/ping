
library(osmdata); library(tidyverse); library(sf)

setwd("~/gens/Lucie/ping")

table_tennis <-  getbb('Paris') %>% 
  opq() %>% 
  add_osm_feature(key = 'sport', value = 'table_tennis') %>% 
  osmdata_sf ()

table_tennis_pts <- table_tennis$osm_points

st_write(table_tennis_pts, "data/in/table_paris.gpkg")


