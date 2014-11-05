#############################################################################
#### SCRIPT: gbif_borreguiles_002_TAXONOMIA.R                            ####
#### VERSION: 3                                                          ####
#### FECHA: 04/11/2014                                                   ####
#### AUTOR: ajperez@ugr.es                                               ####
#############################################################################

## Directorio 
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP'

########### LECTURA DATOS ###############
## Leer datos de todos los taxones
taxones <- read.table(file=paste(di,'/2_Diccionarios/TAXONES_GBIF2014.txt', sep=''),head=TRUE,sep='\t')

## Leo los datos accesorios (Species2000)
# Vienen de Bases de datos de de nombres de plantas en Spain con LSIDs
# http://www.gbif.es/recursos1.php


urlfile <- url('http://iecolab.es/datasets/Species2000_IPNI_ANTHOS_Plant_Names_LSID_GBIF_2012.txt')
species2000 <- read.table(urlfile, head=TRUE, sep=';')
########################################


########### PREPARAR DATOS ############
## desgregar datos de TAXONES EN tres variables
## Crear variable de genus, species, infraespecies vac?as con NA
taxones$genus <- rep("NA",nrow(taxones))
taxones$species<- rep("NA",nrow(taxones))
taxones$infraspecies <- rep("NA",nrow(taxones))
# Con este bucle, parto la cadena de texto "taxon" por espacios y guardo los resultados de los split en cada una de las rows del data.frame  
for (i in 1:nrow(taxones)){ 
  taxones[i,3] <- strsplit(as.character(taxones$TAXON)," ")[[i]][1]
  taxones[i,4] <- strsplit(as.character(taxones$TAXON)," ")[[i]][2]
  taxones[i,5] <- strsplit(as.character(taxones$TAXON)," ")[[i]][4]}

# Reemplazar NA por espacios en blanco
# taxones[is.na(taxones)]   <- "" 
#########################################################

########### GENEROS ############
## SELECCIONAR AQUELLOS REGISTROS QUE SON SOLO GENEROS ##
taxonesG <- subset(taxones, is.na(taxones$species))
# me salen 22 registros

# Unir taxonesG con species2000
generos <- merge(taxonesG, species2000, by.x='genus', by.y='genus')
# Quedarme solo con un registro por genus
generos.unique <- generos[!duplicated(generos$genus),]

# Seleccionar los campos que necesito
generos.unique <- generos.unique[c('genus','TAXON','COD_TAXON','kingdom','phylum','class','order','family')]

# Tenemos que a??adir el campo de autoria de genero. Hemos buscado en IPNI
gen.autores <- data.frame(genus=c("Agrostis", "Bromus", "Carex", "Cerastium", "Epilobium", 
                        "Eryngium", "Festuca", "Gagea", "Galium", "Gentiana", "Juncus", 
                        "Luzula", "Poa", "Ranunculus", "Rumex", 
                        "Sedum", "Trifolium", "Veronica", "Viola"),
                author=c('L.','L.','L.','L.','L.',
                         'L.','L.','Salisb.','L.','L.','L.',
                         'DC.','L.','L.','L.',
                         'L', 'L.','L.','L.'))

generos.unique <- merge(generos.unique, gen.autores, by='genus')

# ver que genero de los taxonesBorreguiles no esta en esta lista
noesta <- setdiff(taxonesG$genus, generos.unique$genus)
noesta

##########################################################
## SELECCIONAR AQUELLOS REGISTROS QUE SON SOLO ESPECIES ##
taxonesSp <- subset(taxones, !is.na(taxones$species) & is.na(taxones$infraspecies))
# me salen 66 registros

# Unir taxonesSp con species2000
species <- merge(taxonesSp, species2000, by.x=c('genus','species'), by.y=c('genus','species'))
# Tengo que elegir aquellos registros que no tenga infraspecific
# Como existen varios registros por especie, selecciono aquellos infraspecies_marker=='spec.'
species.unique <- species[species$infraspecies_marker=='spec.',]
species.unique <- species.unique[which(species.unique$infraspecies.y ==''),]
species.unique <- species.unique[!duplicated(species.unique$scientific_name),]


# Como existen varios registros por especie, selecciono aquellos infraspecies_marker=='spec.'
species.unique <- species.unique[species.unique$infraspecies_marker=='spec.',]
# OJO --- TENEMOS UNA LISTA DE 104 registros, que en verdad son nombres de la misma planta, que hacemos?? --> agregar
species.unique <-species.unique[!duplicated(species.unique$COD_TAXON), ] 

# ver que species de los taxonesBorreguiles no esta en esta lista
noestaSP <- setdiff(taxonesSp$TAXON, species.unique$TAXON)
noestaSP

### QUE OCURRE CON ESTOS TAXONES
# No aparecen ni en el txt ni en la mdb de SPECIES2000, pero si en ipni, en TPL
require(Taxonstand)
cne <- TPL(genus='Carex', species='nevadensis', infra=FALSE, corr=TRUE)
cni <- TPL(genus='Carex', species='nigra', infra=FALSE, corr=TRUE)
hb <- TPL(genus='Herniaria',species='boissieri', infra=FALSE, corr=TRUE)
sm <- TPL(genus='Scorzoneroides',species='microcephala', infra=FALSE, corr=TRUE)
sn <- TPL(genus='Scorzoneroides',species='nevadensis', infra=FALSE, corr=TRUE)

# Seleccionar los campos que necesito
species.unique <- species.unique[c('genus','species','TAXON','COD_TAXON','scientific_name','author','kingdom','phylum','class','order','family')]

##########################################################
## SELECCIONAR AQUELLOS REGISTROS QUE SON SubESPECIES   ##
taxonesSub <- subset(taxones,  !is.na(taxones$infraspecies))
# me salen 9 registros

# Unir taxonesSub con species2000
subsp <- merge(taxonesSub, species2000, by.x=c('genus','species','infraspecies'), by.y=c('genus','species','infraspecies'))
# Quedarme solo con un registro por taxon
subsp.unique <- subsp[!duplicated(subsp$TAXON),]

# ver que taxones subspecies de los taxonesBorreguiles no esta en esta lista
noestaSub <- setdiff(taxonesSub$TAXON, subsp.unique$TAXON)
noestaSub


# Seleccionar los campos que necesito
subsp.unique <- subsp.unique[c('genus','species','infraspecies','TAXON','COD_TAXON','scientific_name','author','kingdom','phylum','class','order','family')]


# UNIR TABLA SUBSP Y SP 
# OJO FALTAN LAS EXCEPCIONES 
taxSpSubsp <- merge(species.unique,subsp.unique, all=T)

### UNIR TABLAS GENERO Y SPECIES
union <- merge(generos.unique, taxSpSubsp, all=T)

# Seleccionar campos que necesito
union <- union[c('scientific_name','kingdom','phylum','class','order','family','genus','species','infraspecies','author','TAXON','COD_TAXON')]

## Completar el nombre scientific_name
union$scientific_name <- ifelse(is.na(union$species), 
                                paste(union$genus,union$author, sep=' '),
                                paste(union$scientific_name))

# A??adir excepciones (las de especies)
cneC <- data.frame(scientific_name=paste(paste(cne$Genus,cne$Species, sp=''), cne$Authority, sep=''), 
                   kingdom='Plantae', 
                   phylum='Magnoliophyta', 
                   class='Liliopsida', 
                   order='Poales', 
                   family=cne$Family, genus=cne$Genus, species=cne$Species, 
                   infraspecies=NA, author=cne$Authority, 
                   TAXON=noestaSP[1],
                   COD_TAXON=taxones[taxones$TAXON=='Carex nevadensis',]$COD_TAXON)

cniC <- data.frame(scientific_name=paste(paste(cni$Genus,cni$Species, sp=''), cni$Authority, sep=''), 
                   kingdom='Plantae', 
                   phylum='Magnoliophyta', 
                   class='Liliopsida', 
                   order='Poales', 
                   family=cni$Family, genus=cni$Genus, species=cni$Species, 
                   infraspecies=NA, author=cni$Authority, 
                   TAXON=noestaSP[2],
                   COD_TAXON=taxones[taxones$TAXON=='Carex nigra',]$COD_TAXON)

hbC <- data.frame(scientific_name=paste(paste(hb$Genus,hb$Species, sp=''), hb$Authority, sep=''), 
                  kingdom='Plantae', 
                  phylum='Magnoliophyta', 
                  class='Magnoliopsida', 
                  order='Caryophyllales', 
                  family=hb$Family, genus=hb$Genus, species=hb$Species, 
                  infraspecies=NA, author=hb$Authority, 
                  TAXON=noestaSP[3],
                  COD_TAXON=taxones[taxones$TAXON=='Herniaria boissieri',]$COD_TAXON)

smC <- data.frame(scientific_name=paste(paste(sm$Genus,sm$Species, sp=''), sm$Authority, sep=''), 
                  kingdom='Plantae', 
                  phylum='Magnoliophyta', 
                  class='Magnoliopsida', 
                  order='Asterales', 
                  family='Asteraceae', genus=sm$Genus, species=sm$Species, 
                  infraspecies=NA, author=sm$Authority, 
                  TAXON=noestaSP[4],
                  COD_TAXON=taxones[taxones$TAXON=='Scorzoneroides microcephala',]$COD_TAXON)

snC <- data.frame(scientific_name=paste(paste(sn$Genus,sn$Species, sp=''), sn$Authority, sep=''), 
                  kingdom='Plantae', 
                  phylum='Magnoliophyta', 
                  class='Magnoliopsida', 
                  order='Asterales', 
                  family='Asteraceae', genus=sn$Genus, species=sn$Species, 
                  infraspecies=NA, author=sn$Authority, 
                  TAXON=noestaSP[5],
                  COD_TAXON=taxones[taxones$TAXON=='Scorzoneroides nevadensis',]$COD_TAXON)

sp.excep <- rbind(cneC,cniC,hbC,smC,snC)

# Ahora a??ado la subsp que no esta. 
# Luzula campestris subsp. nevadensis
# Lcn <- data.frame(scientific_name='Luzula campestris subsp. nevadensis P. Monts', 
#                   kingdom='Plantae', 
#                   phylum='Magnoliophyta', 
#                   class='Liliopsida', 
#                   order='Poales', 
#                   family='Juncaceae', genus='Luzula', species='campestris', 
#                   infraspecies='nevadensis', author='P. Monts', 
#                   TAXON=noestaSub,
#                   COD_TAXON=taxones[taxones$TAXON=='Luzula campestris subsp. nevadensis',]$COD_TAXON)
# 
# scorzo <- data.frame(scientific_name='Scorzoneroides Moench', 
#                   kingdom='Plantae', 
#                   phylum='Magnoliophyta', 
#                   class='Magnoliopsida', 
#                   order='Asterales', 
#                   family='Asteraceae', genus='Scorzoneroides', species=NA, 
#                   infraspecies=NA, author='Moench', 
#                   TAXON='Scorzoneroides',
#                   COD_TAXON=taxones[taxones$TAXON=='Scorzoneroides',]$COD_TAXON)
# 
# pilose <- data.frame(scientific_name='Pilosella Hill', 
#                      kingdom='Plantae', 
#                      phylum='Magnoliophyta', 
#                      class='Magnoliopsida', 
#                      order='Asterales', 
#                      family='Asteraceae', genus='Pilosella', species=NA, 
#                      infraspecies=NA, author='Hill', 
#                      TAXON='Pilosella',
#                      COD_TAXON=taxones[taxones$TAXON=='Pilosella',]$COD_TAXON)

borag <- data.frame(scientific_name='Boraginaceae Juss.', 
                     kingdom='Plantae', 
                     phylum='Magnoliophyta', 
                     class='Magnoliopsida', 
                     order='Boraginales', 
                     family='Boraginaceae', genus=NA, species=NA, 
                     infraspecies=NA, author='Juss.', 
                     TAXON='Boraginaceae',
                     COD_TAXON=taxones[taxones$TAXON=='Boraginaceae',]$COD_TAXON)

poaceae <- data.frame(scientific_name='Poaceae Barnhart', 
                    kingdom='Plantae', 
                    phylum='Magnoliophyta', 
                    class='Liliopsida', 
                    order='Poales', 
                    family='Poaceae', genus=NA, species=NA, 
                    infraspecies=NA, author='Barnhart', 
                    TAXON='Poaceae',
                    COD_TAXON=taxones[taxones$TAXON=='Poaceae',]$COD_TAXON)


scorzo <- data.frame(scientific_name='Scorzoneroides', 
                  kingdom='Plantae', 
                  phylum='Magnoliophyta', 
                  class='Magnoliopsida', 
                  order='Asterales', 
                  family='Asteraceae', genus='Scorzoneroides', species=NA, 
                  infraspecies=NA, author='Moench', 
                  TAXON='Scorzoneroides',
                  COD_TAXON=taxones[taxones$TAXON=='Scorzoneroides',]$COD_TAXON)



excepciones <- rbind(sp.excep, borag, poaceae, scorzo)


## Ahora uno las excepciones a los taxones
tax <- rbind(union, excepciones)


# Ojo modificar los generos una vez exportada y quitar los NA una vez exportados 
tax[is.na(tax)] <- ''

# EXPORTAR
write.table(tax, file=paste(di,"/2_diccionarios/TAXONES_GBIF2014_completos.txt", sep=""), sep=";", row.names=FALSE)

