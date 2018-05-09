require(rgdal)
require(tidyverse)
setwd("C:/Users/akruse/Downloads/LoD1-DE_HH_2017-03-23/")
filenames = list.files(pattern = ".xml")

for (i in 247:length(filenames)) {
  thefile = filenames[i]
  g = ogrListLayers(thefile)
  g = readOGR(thefile,g[1])
  check = is.element('20457',g@data$PostalCodeNumber)
  if(check == T) print("JOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")
  if(check == T) print(thefile)
  print(i)
}






proj4string(g) <- CRS("+proj=utm +zone=32 +ellps=GRS80 +datum=WGS84")
spgeo <- spTransform(g, CRS("+proj=longlat +datum=WGS84"))

map = get_map("Hamburg", zoom = 10)

ggmap(map) +
  geom_polygon(data = fortify(spgeo),
               aes(long, lat, group = group), size = 4)

leaflet(spgeo) %>%
  addTiles() %>%
  addPolygons()
  
  
 LoD1_560_5944_1_HH.xml
LoD1_562_5930_1_HH.xml
LoD1_562_5931_1_HH.xml
LoD1_563_5930_1_HH.xml
LoD1_563_5931_1_HH.xml
LoD1_563_5932_1_HH.xml
