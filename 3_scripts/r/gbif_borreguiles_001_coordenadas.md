
``` r
# -----------------------------------------------------------
#############################################################################
#### SCRIPT: gbif_borreguiles_001_coordenadas.R                          ####
#### VERSION: 2                                                          ####
#### FECHA: 28/10/2014                                                   ####
#### AUTOR: ajperez@ugr.es                                               ####
#############################################################################
# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
## Load packages necesarios 
library(xlsx)
library(rgdal)

# Cargo una funcion especifica que me reordena el dataframe como yo quiero
reordena <- function(data, x, y){
  columnas <- names(data) # Obtengo nombre de columnas
  n <- length(columnas) # numero de columnas
  numeros <- seq(from=1, to=n, by=1) # numeros de 1 hasta n
  pos.X <- match(x,columnas) # posicion de la columna x
  pos.Y <- match(y,columnas) # posicion de la columna y
  resto <- numeros[!numeros %in% c(pos.X, pos.Y)] # resto de posiciones
  datos.ordenados <- data[c(pos.X, pos.Y,resto)] # ordenar por posiciones
  print(datos.ordenados)}
# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
## Directorio 
# di <- "C:/Users/alpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP" 
# mac 
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP'

# Read data
coord <- read.xlsx(file=paste(di,'/2_diccionarios/spatial_coverage/dicc_parcelas_gbif.xlsx', sep=''), 1)
# -----------------------------------------------------------
```

Ahora preparo los datos a convertir.

-   Comprobar que las coordenadas UTM están en números enteros (sin decimales).
-   Comprobar que las coordenadas tiene formato de campo numérico.
-   Reordenar campos.

``` r
#--------------------------------------------------------------------
coord$UTM_X <- round(coord$UTM_X, 0)
coord$UTM_Y <- round(coord$UTM_Y, 0)
# Solo quiero el id de la parcela y las coordenadas GPS

#### PREPARO CONJUNTO DE DATOS PARA OBTENER COORDENADAS EN LAT/LONG
datos <- reordena(coord, x='UTM_X', y='UTM_Y')
datos$UTM_X <- as.numeric(datos$UTM_X)
datos$UTM_Y <- as.numeric(datos$UTM_Y)
#--------------------------------------------------------------------
```

Ahora convierto el dataset en un objeto espacial asignándole la proyección adecuada. Posteriormente convierto la proyección para obtener lat/long. Finalmente cambio el nombre de los campos lat y long.

``` r
# -----------------------------------------------------------
## CONVIERTO EN OBJETO SPATIAL
SP <- SpatialPoints(cbind(datos$UTM_X,datos$UTM_Y), 
                    proj4string=CRS("+proj=utm +zone=30"))

# Convierto objeto a longitud+latitud 
converso <- as.data.frame(spTransform(SP, CRS("+proj=longlat")))
datos.convertidos <- cbind(datos, converso)
# renombro
names(datos.convertidos)[5] <- 'long'
names(datos.convertidos)[6] <- 'lat'
# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
### EXPORTAR DATOS
write.table(datos.convertidos, file=paste(di,"2_diccionarios/spatial_coverage/coordenadas_convertidas.txt", sep=""), sep=";", row.names = FALSE)
# -----------------------------------------------------------
```
