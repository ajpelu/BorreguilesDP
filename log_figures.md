### Log and notes of Figures
#### Figura 1 - mapa 
* Capa vectorial de las parcelas `./4_geoinfo/shapes_borreguiles_conRZ_oct2013.shp`
* Hemos creado una geodatabase (`./4_geoinfo/borreguilesDP.mdb`) (ojo no está subida en github por problemas de espacio; pero se mantiene en Dropbox) con diferentes capas: 
	* limites Parque natural y nacional
	* Curvas de nivel 
	* municipios Andalucia 
	* parcelas de muestreo 
	* hidrografia 
* El mapa se ha generado con ArcGIS, el archivo está en `./4_geoinfo/mapas/mapaLocationBorreg.mxd`. El mapa está compuesto por tres paneles. Los shapes cuando no se indique, están en la geodatabase comentada. 

###### Panel (a) SNLocation_Europe
Contiene las siguientes capas:

 * boundaryNaturalPark. Proviende de (`./Cartoteca/Medio_socioeco/Espacios_Protegidos/RENPA_old/granada/PNSIERRA_NEVADA/limitesnevada10000.shp`) 
 * raster Hillshade. Proviene de `./CartoTeca/Medio_biofisico/Relieve/mde_Europa/hillshade1x1.tif` 

###### Detail map SN (b) SNView_Satelite:
Contiene las siguientes capas:
 
 * boundaryNaturalPark. Proviende de `./Cartoteca/Medio_socioeco/Espacios_Protegidos/RENPA_old/granada/PNSIERRA_NEVADA/limitesnevada10000.shp` 
 * boundaryNationalPark: Proviende de `./Cartoteca/Medio_socioeco/Espacios_Protegidos/RENPA_old/granada/PNACSIERRA_NEVADA/limitespnacsnevada10000.shp` 
 * filtro_NaturalPark. Ver en la geodatabase `borreguilesDP.mdb` 
 * municipiosAndalucia.  Proviene de  `./Cartoteca/Medio_socioeco/Limi_Admi/Andalucia/municipiosandalucia.shp` 
 * Vista Landsat: `./Dropbox/Satelite_Parque_Nacional/mosaico-landsat-tm-03.sid
 
###### DetailMapPlot (c)
Contiene las siguientes capas:
 
 * parcelasBorreguiles. Es el dataset `ParcelasBorreguiles`, dentro de Parcelas, que está en la geodatabase, pero viene  de `./4_geoinfo/shapes_borreguiles_conRZ_oct2013.shp` 
 * sombra10geo. Proviene de `./CartoTeca/Medio_biofisico/Relieve/mde_10m_cma\sombra10geo` 
 * filtro_NationalPark. Ver en la geodatabase 
 * Hidrografia. Proviene de `./CartoTeca/Medio_biofisico/hidro/hidrografia_granada_10000.shp` 
 * Ortofotos. Provienen de `./CartoTeca/ORTOFOTOS/ortoMIGRAME/` 

El mapa se exporta en tres formatos (`jpg`, `png` y `pdf`) con el nombre `./4_geoinfo/mapas/map_dpBorregu_2014.*`

#### Figura 2 - Order 
* Se trata de una figura que muestra el % de registros por phyllum y luego para cada clase, se muestra el % de registros que hay para cada orden. 
* La figura se genera con [este](https://github.com/ajpelu/BorreguilesDP/blob/master/3_scripts/r/gbif_borreguiles_006_plot_phylum_class.md) script `./3_scripts/r/ gbif_borreguiles_006_plot_phylum_class.R`
* Posteriormente hay que hacer unas pequeñas modificaciones en photoshop. Se añaden los nombres de los phylum y algunas flechas. Ver el resultado en `./8_figures/taxonomicCoverage/orderCov_modified.png`

#### Figura 3 - Familias 
* Se ha hecho la figura 3 de cobertura taxonomica de familias con los datos actualizados de las consultas. 
* Ver la figura en `./8_figures/taxonomicCoverage/`
* El script  para generarlo es [este](https://github.com/ajpelu/BorreguilesDP/blob/master/3_scripts/r/gbif_borreguiles_003_plot_family.md) `./3_scripts/r/gbif_borreguiles_003_plot_family.R` 

#### Figura 4
* Se trata de una figura combinada donde incluimos un esquema de las cotas, y varias fotos con datos del muestreo. 
* Figura y fotos utilizadas en `./8_figures/muestreo/`
* Las fotos b es de CP Sanchez y las  c,d son de AJ Pérez 

#### Figura 5
* Vista general del borreguil de San Juan con esquemas o perfiles de los borreguiles. 
* Figura y fotos utilizadas en `./8_figures/perfil_borreguiles/`