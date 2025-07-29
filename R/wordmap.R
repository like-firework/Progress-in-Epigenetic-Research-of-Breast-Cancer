setwd("E:\\Epigenetics and breast cancer\\vos\\GEO\\biaoguan")

library(sp)
library(rgdal)
spdata <- readOGR(dsn="E:\\Epigenetics and breast cancer\\vos\\GEO\\biaoguan\\TM_WORLD_BORDERS-0.3", layer = "TM_WORLD_BORDERS-0.3",
                  stringsAsFactors = F,
                  use_iconv = TRUE,
                  encoding = "UTF-8")
world<-spdata@data
map<-read.csv("map.csv")


world<-data.frame(world$NAME,world$LON,world$LAT)
colnames(world)<-c("label","lng","lat")
map<-data.frame(map)

world<-data.frame(lapply(world, function(v) {
  if (is.character(v)) return(toupper(v))
  else return(v)
}))

map<-data.frame(lapply(map, function(v) {
  if (is.character(v)) return(toupper(v))
  else return(v)
}))

library(tidyverse)
#vos combine
map$`label` <- recode(map$`label`, 'VIETNAM'='VIET NAM'  )
map$`label` <- recode(map$`label`, 'USA'='UNITED STATES')
map$`label` <- recode(map$`label`, 'BOSNIA & HERCEG'='BOSNIA AND HERZEGOVINA' )
map$`label` <- recode(map$`label`, 'COTE IVOIRE'="COTE D'IVOIRE" )
map$`label` <- recode(map$`label`, 'ENGLAND'='UNITED KINGDOM')
map$`label` <- recode(map$`label`, 'IRAN'='IRAN (ISLAMIC REPUBLIC OF)' )
map$`label` <- recode(map$`label`, 'LAOS'="LAO PEOPLE'S DEMOCRATIC REPUBLIC")
map$`label` <- recode(map$`label`, 'SOUTH KOREA'='REPUBLIC OF KOREA' )
map$`label` <- recode(map$`label`, 'NORTH KOREA'="DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA" )
map$`label` <- recode(map$`label`, 'PEOPLES R CHINA' = 'CHINA')
map$`label` <- recode(map$`label`, 'TAIWAN' = 'TAIWAN, CHINA')
map$`label` <- recode(map$`label`, 'NORTH IRELAND' = 'UNITED KINGDOM')
map$`label` <- recode(map$`label`, 'SCOTLAND' = 'UNITED KINGDOM')
map$`label` <- recode(map$`label`, 'WALES' = 'UNITED KINGDOM')



map<-left_join(map,world,by="label")


write.csv(map,"mapnew.csv",row.names = F)

