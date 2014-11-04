# Este script sirve para  tomar todos los datos de la consulta de borreguiles y obenter el numero de registros que aparecen de cada 
# entidad taxonomica por year 

# load library
library('lubridate')
library('reshape2')

# Set working directory 
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP'

# read file
mydata <- read.table(file=paste(di, '/2_diccionarios/gbif2014_c2.txt', sep=''), header=TRUE, sep='\t')
# Ojo revisar el campo fecha est?? en formato dd/mm/yyyy 

# Extract year 
mydata$date <- as.Date(mydata$FECHA, "%d/%m/%Y")
mydata$year <- year(mydata$date)

# Aggregate by year and taxon. Number of records by taxon and year 
aux <- aggregate(mydata$TAXON, by=list(mydata$TAXON, mydata$year),FUN='length')
names(aux) <- c('TAXON', 'year', 'count')


aux2 <- dcast(aux, TAXON ~ year , value.var = 'count' )
aux2[is.na(aux2)] <- ''

write.csv(aux2, file=paste(di, '/2_diccionarios/taxones_year.csv', sep=''), row.names=FALSE) 






