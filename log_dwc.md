## Creación de la vista (sql) de DWC-A de borreguiles

* Base de datos
	* Versión: BD_borreguiles_v5.9_20141025.mdb 
	* path: `./BorreguilesDP/1_bd/BD_borreguiles_v5.9_20141025.mdb`


### Versión de la BD 
* Versión: BD_borreguiles_v5.9_20141025.mdb 
* path: `./BorreguilesDP/1_bd/BD_borreguiles_v5.9_20141025.mdb`
* La llamaremos *BD_obsnev*

Para esta consulta consideramos una ocurrencia: *un taxon es observado en un plot y anotado en una fecha concreta* 

### Consultas a la BD_obsnev 
Creamos varias consultas sobre la BD_obsnev (la que está en linaria) para poder generar una vista DWC-A. A estas consultas las  llamaremos: 

* GBIF2014_C1 

##### GBIF2014_C1 
* Esta consulta parte de la tabla `TABL_INVENTARIO` 
* Sobre ella creamos una consulta, con la restricción de que el campo taxón sea no nulo (`TABL_INVENTARIO.COD_TAXON>0`)
* Creamos un indentificador para cada registro de la consulta, de forma que sea unívoco. Hemos generado un código o clave que es combinación de varios identificadores: ***BORREG-000-XXXXXX-AAAAAAAAA***
	* ***BORREG*** es el nombre de la metodología
	* ***000*** corresponde al *ID_PARCELA*
	* ***XXXXXX*** corresponde al *ID_VISITA*
	* ***AAAAAAAAA*** corresponde al *ID_INVENTARIO*
	* idGBIF: `'BORREG' & '-' & Format( [ID_PARCELA] ; "000") & '-' & Format ( [ID_VISITA] ; "000000") & '-' & Format( [ID_INVENTARIO] ; "000000000")`  
* El código `sql` se puede encontrar en `./3_scripts/sql/gbif2014_c1.sql`
* La consulta de creación de tabla no se puede desbloquear por lo que exportarmos la consulta como excel: `./2_diccionarios/gbif2014_c1.xlsx`


##### GBIF2014_C2 
* Para cada ocurrencia tengo que asociaciar, si la tiene, la cobertura estimada del taxon para cada parcela 
* La base de esta consulta es la consulta anterior *GBIF2014_C1* 
* El código `sql` se puede encontrar en `./3_scripts/sql/gbif2014_c1.sql`
* La consulta de creación de tabla no se puede desbloquear por lo que exportarmos la consulta como excel: `./2_diccionarios/gbif2014_c2.xlsx`

### Creación de base de datos de borreguiles para generar SQL view
* Creamos una bd con el nombre gbif2014_borreguiles en `./1_bd/gbif2014_borreguiles.mdb` 
* Importamos `./2_diccionarios/gbif2014_c2.xlsx` a la base de datos 

#### Cotas 
* Creamos una tabla (diccionario de cotas): GBIF_DICC_COTAS 
* Campos
	* ID_COTA: 1, 2, 3
	* COTA: 'Alta', 'Media', 'Baja'
	* Locality: 'Hoya del Moro (Bco. San Juan)', 'Hoya del Moro (Bco. San Juan)', 'Prado la Mojonera (Bco. San Juan)'
* 

#### Taxones 
* 1 Consultar las entidades taxonomicas 
	* Llamar a la consulta AgrupaTaxones. Se trata de una consulta que lista todos los taxones existentes. 	 
	* El código `sql` se puede encontrar en `./3_scripts/sql/gbif2014bd_agrupa_taxones.sql`
	* Consulta de creación de tabla ***TAXONES*** 
	* Exportamos la tabla como ***TAXONES_GBIF2014.txt*** 
* 



#### Spatial Coverage 

#### Collector 






