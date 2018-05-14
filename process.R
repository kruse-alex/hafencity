require(rgdal)
require(tidyverse)

# read shapefile of Hamburg
setwd("C:/Users/Alex/Downloads/")
hh_shape = readOGR(".","HH_ALKIS_Ortsteile")
hh_shape = hh_shape[hh_shape@data$Stadtteil == "HafenCity",]

setwd("C:/Users/Alex/Downloads/LoD1-DE_HH_2017-03-23/")
filenames = list.files(pattern = ".xml")
316-366,577-ende

for (i in 577:789) {
  tryCatch({
  thefile = filenames[i]
  g = ogrListLayers(thefile)
  g = readOGR(thefile,g[1])
  check = is.element('20457',g@data$PostalCodeNumber)
  if(check == T) print("JOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooooooooooooooooooooooooo")
  if(check == T) print(thefile)
  print(i)
  }, error=function(e){})
}


filesimp = c(
"LoD1_565_5930_1_HH.xml",
"LoD1_565_5931_1_HH.xml",
"LoD1_565_5932_1_HH.xml",
"LoD1_565_5933_1_HH.xml",
"LoD1_565_5934_1_HH.xml",
"LoD1_560_5944_1_HH.xml",
"LoD1_562_5930_1_HH.xml",
"LoD1_562_5931_1_HH.xml",
"LoD1_563_5930_1_HH.xml",
"LoD1_563_5931_1_HH.xml",
"LoD1_563_5932_1_HH.xml",
"LoD1_564_5931_1_HH.xml",
"LoD1_564_5932_1_HH.xml",
"LoD1_566_5930_1_HH.xml",
"LoD1_566_5931_1_HH.xml",
"LoD1_566_5932_1_HH.xml",
"LoD1_566_5933_1_HH.xml",
"LoD1_567_5930_1_HH.xml",
"LoD1_567_5931_1_HH.xml")

3,4,16,17,

g1 = ogrListLayers(filesimp[3])
g1 = readOGR(filesimp[3],g1[1])

proj4string(g1) <- CRS("+proj=utm +zone=32 +no_defs +ellps=GRS80 +datum=WGS84")
g1 <- spTransform(g1, CRS("+proj=longlat +no_defs +datum=WGS84"))

g2 = ogrListLayers(filesimp[4])
g2 = readOGR(filesimp[4],g2[1])

proj4string(g2) <- CRS("+proj=utm +zone=32 +no_defs +ellps=GRS80 +datum=WGS84")
g2 <- spTransform(g2, CRS("+proj=longlat +no_defs +datum=WGS84"))

g3 = ogrListLayers(filesimp[16])
g3 = readOGR(filesimp[16],g3[1])

proj4string(g3) <- CRS("+proj=utm +zone=32 +no_defs +ellps=GRS80 +datum=WGS84")
g3 <- spTransform(g3, CRS("+proj=longlat +no_defs +datum=WGS84"))

g4 = ogrListLayers(filesimp[17])
g4 = readOGR(filesimp[17],g4[1])

proj4string(g4) <- CRS("+proj=utm +zone=32 +no_defs +ellps=GRS80 +datum=WGS84")
g4 <- spTransform(g4, CRS("+proj=longlat +no_defs +datum=WGS84"))

g1 = g1[hh_shape,]
g2 = g2[hh_shape,]
g3 = g3[hh_shape,]
g4 = g4[hh_shape,]

leaflet() %>%
  addTiles() %>%
  addPolygons(data = g1, fillColor = "Green") %>%
  addPolygons(data = g2) %>%
  addPolygons(data = g3) %>%
  addPolygons(data = g4)
