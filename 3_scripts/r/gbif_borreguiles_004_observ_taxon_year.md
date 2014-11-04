#### Goals

This scripts creates a table with the number of records by taxon and year in the Borreguiles dataset

``` r
# -----------------------------------------------------------
#############################################################################
#### SCRIPT: gbif_borreguiles_004_observ_taxon_year.R                    ####
#### VERSION: 2                                                          ####
#### FECHA: 04/11/2014                                                   ####
#### AUTOR: ajperez@ugr.es                                               ####
#############################################################################
# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
# load library
library('lubridate')
library('reshape2')

# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
## Directorio 
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP'

# read file
mydata <- read.table(file=paste(di, '/2_diccionarios/gbif2014_c2.txt', sep=''), header=TRUE, sep='\t')
# Ojo revisar el campo fecha este en formato dd/mm/yyyy 
# -----------------------------------------------------------
```

Now we need to extract the year from date field.

``` r
#--------------------------------------------------------------------
# Extract year 
mydata$date <- as.Date(mydata$FECHA, "%d/%m/%Y")
mydata$year <- year(mydata$date)
#--------------------------------------------------------------------
```

Then we aggregate the data of each taxon to get the counts of each taxon in each year. We get a table with three fields: taxon, year and count.

``` r
# -----------------------------------------------------------
# Aggregate by year and taxon. Number of records by taxon and year 
aux <- aggregate(mydata$TAXON, by=list(mydata$TAXON, mydata$year),FUN='length')
names(aux) <- c('TAXON', 'year', 'count')
```

Now we transform the output table. We want a column (field) by each sampling year. We use the function `dcast` from `lubridate` [package](http://cran.r-project.org/web/packages/lubridate/index.html). We also replace the NAs values with ''.

``` r
#--------------------------------------------------------------------
aux2 <- dcast(aux, TAXON ~ year , value.var = 'count' )
aux2[is.na(aux2)] <- ''
aux2  
```

    ##                                       TAXON 1988 1989 1990 2009 2010 2011
    ## 1                                  Agrostis                        9    6
    ## 2        Agrostis canina subsp. granatensis                  34  115   18
    ## 3                       Agrostis nevadensis                        3  110
    ## 4                       Anthericum baeticum                   1    1    1
    ## 5                    Arenaria serpyllifolia                   4    7    3
    ## 6                      Arenaria tetraquetra                   2    4    6
    ## 7                              Boraginaceae                              
    ## 8                        Botrychium lunaria                   6   21   10
    ## 9                                    Bromus                              
    ## 10                       Campanula herminii                   2   12   12
    ## 11                                    Carex   36    1    1    7   22    1
    ## 12                         Carex capillaris                   3   20    9
    ## 13                       Carex caryophyllea         8    3    1   70   49
    ## 14                           Carex echinata                   4   53   80
    ## 15                        Carex lepidocarpa                              
    ## 16                           Carex leporina                   1         5
    ## 17                         Carex nevadensis   15    7    8    9  120  131
    ## 18                              Carex nigra   37   15   16   25  167  162
    ## 19                                Cerastium                   1    5    1
    ## 20       Cerastium alpinum subsp. aquaticum                   4   32   16
    ## 21                    Cerastium cerastoides                       12   15
    ## 22          Cirsium acaule subsp. gregarium                              
    ## 23     Dactylis glomerata subsp. juncinella                              
    ## 24                          Draba lutescens                              
    ## 25                  Eleocharis quinqueflora   24    9    3   19  114  118
    ## 26                                Epilobium                        1     
    ## 27                           Erophila verna                              
    ## 28                                 Eryngium                   1         1
    ## 29                        Eryngium glaciale                        5    6
    ## 30                     Euphrasia willkommii   36   61   54   70  118  117
    ## 31                                  Festuca                   1   16    7
    ## 32                          Festuca frigida                             3
    ## 33                          Festuca iberica                  52  165  123
    ## 34                                    Gagea                             1
    ## 35                                   Galium                   2    7    5
    ## 36                         Galium nevadense                   3          
    ## 37                                 Gentiana                        4    3
    ## 38                          Gentiana alpina                        7   10
    ## 39                           Gentiana boryi   31   32   24   22   70   64
    ## 40    Gentiana pneumonanthe subsp. depressa    4    9    9   10   61   42
    ## 41                         Gentiana sierrae   25   12   12    9   85   54
    ## 42                      Gentianella tenella                        1    1
    ## 43                      Herniaria boissieri                   1    4    5
    ## 44                                   Juncus                        4    1
    ## 45                       Juncus articulatus                   3   45   34
    ## 46                          Juncus bufonius                   3   16    8
    ## 47                           Juncus effusus                   1          
    ## 48                       Juniperus communis                              
    ## 49      Linaria aeruginea subsp. nevadensis                   1    3    3
    ## 50      Lotus corniculatus subsp. glacialis   38   16   15   67  146  109
    ## 51                                   Luzula    8   11    7    4          
    ## 52                        Luzula campestris                   2   58   27
    ## 53                           Luzula spicata                   1    8    2
    ## 54                        Meum athamanticum                   1    1    1
    ## 55                           Montia fontana                        6     
    ## 56                     Myosotis minutiflora                             1
    ## 57                           Nardus stricta   44   41   29   92  241  189
    ## 58                      Parnassia palustris   10   17   13   21   47   39
    ## 59                 Paronychia polygonifolia                   2   10   12
    ## 60 Phleum brachystachyum subsp. abbreviatum                   9   21   17
    ## 61                    Pinguicula nevadensis   32   22   26   11   42   45
    ## 62                         Plantago nivalis    8    3    3   12   92   72
    ## 63                                      Poa                        4    2
    ## 64                              Poa bulbosa                        1     
    ## 65                               Poa supina                             1
    ## 66                                  Poaceae   21              1          
    ## 67                    Potentilla nevadensis                   1    2     
    ## 68                         Radiola linoides                             3
    ## 69                               Ranunculus                   1    1    7
    ## 70              Ranunculus acetosellifolius    3         1    1   10   12
    ## 71  Ranunculus angustifolius var. uniflorus   15   13    8    5   61   56
    ## 72                      Ranunculus demissus   11    3    3   12   23   10
    ## 73                                    Rumex                              
    ## 74                        Sagina saginoides                   6   59   34
    ## 75                           Scorzoneroides   40   25   37   88  160   66
    ## 76              Scorzoneroides microcephala                   3   31   66
    ## 77                Scorzoneroides nevadensis                   6   42   43
    ## 78                                    Sedum                        1     
    ## 79                       Sedum amplexicaule                              
    ## 80                        Sedum brevifolium                              
    ## 81                         Silene rupestris                   1   11    7
    ## 82                        Spergularia rubra                   2    8     
    ## 83                         Stellaria alsine                        1    1
    ## 84                        Thlaspi nevadense                              
    ## 85                                Trifolium    2                         
    ## 86                       Trifolium pratense   13   20   13   26   82   51
    ## 87                         Trifolium repens    8    9    4   30   82   53
    ## 88                     Vaccinium uliginosum    8    2    3    1   13   24
    ## 89                                 Veronica                   2    1    3
    ## 90                        Veronica arvensis                             1
    ## 91                      Veronica nevadensis                   3   23   19
    ## 92                                    Viola                        3     
    ## 93                       Viola crassiuscula                        1     
    ## 94                          Viola palustris   34   17   19    8   23   22
    ## 95                            Viola parvula                              
    ##    2012 2013
    ## 1     3    1
    ## 2    17   24
    ## 3    88   60
    ## 4     1    1
    ## 5          1
    ## 6     7    7
    ## 7          1
    ## 8    11   15
    ## 9          2
    ## 10    6    9
    ## 11    6   27
    ## 12   14    3
    ## 13   36   25
    ## 14   48   63
    ## 15    1    2
    ## 16    1    8
    ## 17   92  100
    ## 18  159  153
    ## 19          
    ## 20    4   11
    ## 21    9   14
    ## 22    1     
    ## 23         2
    ## 24    1     
    ## 25   95  118
    ## 26          
    ## 27         1
    ## 28         3
    ## 29    6    4
    ## 30  118  138
    ## 31    1    5
    ## 32    1     
    ## 33   78   73
    ## 34    2    5
    ## 35    5    4
    ## 36          
    ## 37    2    5
    ## 38    9   14
    ## 39   72   92
    ## 40   36   56
    ## 41   44   39
    ## 42          
    ## 43    7    5
    ## 44         1
    ## 45   26   48
    ## 46    2   28
    ## 47          
    ## 48         2
    ## 49    2    1
    ## 50   96  117
    ## 51    1    1
    ## 52   15   24
    ## 53    4    4
    ## 54    2     
    ## 55    1    3
    ## 56         7
    ## 57  169  225
    ## 58   34   28
    ## 59    7   18
    ## 60   12    7
    ## 61   41   44
    ## 62   59   72
    ## 63    2    4
    ## 64          
    ## 65          
    ## 66          
    ## 67          
    ## 68    3    5
    ## 69    5     
    ## 70    4    7
    ## 71   51   78
    ## 72   11   48
    ## 73         2
    ## 74    5   27
    ## 75   72   97
    ## 76   46   58
    ## 77   33   77
    ## 78    9    5
    ## 79         1
    ## 80    1     
    ## 81    4    3
    ## 82         7
    ## 83         1
    ## 84         1
    ## 85    1    2
    ## 86   26   47
    ## 87   49   68
    ## 88   22   30
    ## 89         1
    ## 90         6
    ## 91    5    8
    ## 92          
    ## 93         1
    ## 94   31   25
    ## 95         5

``` r
#--------------------------------------------------------------------
```

``` r
# -----------------------------------------------------------
### EXPORTAR DATOS
write.csv(aux2, file=paste(di, '/2_diccionarios/taxones_year.csv', sep=''), row.names=FALSE)
# -----------------------------------------------------------
```
