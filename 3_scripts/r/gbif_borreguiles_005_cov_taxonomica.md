This script describes and analyzes the taxonomic coverage in the Borreguiles dataset.

``` r
# -----------------------------------------------------------
#############################################################################
#### SCRIPT: gbif_borreguiles_005_cov_taxonomica.R                       ####
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
phylum  <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_phylum.txt', sep=''), header=TRUE, sep=';')
class <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_class.txt', sep=''), header=TRUE, sep=';')
ord <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_order.txt', sep=''), header=TRUE, sep=';')
fam <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_family.txt', sep=''), header=TRUE, sep=';')
gen <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_genus.txt', sep=''), header=TRUE, sep=';')
tax <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_taxon.txt', sep=''), header=TRUE, sep=';')
# -----------------------------------------------------------
```

Phylum
------

``` r
#--------------------------------------------------------------------
# rename 
names(phylum) <- c("Phylum","n")
# compute total
phylum$tot <- sum(phylum$n)
# conpute percentage
phylum$per <- round((phylum$n / phylum$tot)*100, 2)

phylum 
```

    ##          Phylum     n   tot   per
    ## 1 Magnoliophyta 10940 11005 99.41
    ## 2     Pinophyta     2 11005  0.02
    ## 3  Pteridophyta    63 11005  0.57

``` r
#--------------------------------------------------------------------
```

Class

``` r
#--------------------------------------------------------------------
# rename 
names(class) <- c("Class","n")
# compute total
class$tot <- sum(class$n)
# conpute percentage
class$per <- round((class$n / class$tot)*100, 2)

class
```

    ##           Class    n   tot   per
    ## 1    Liliopsida 4883 11005 44.37
    ## 2 Magnoliopsida 6057 11005 55.04
    ## 3     Pinopsida    2 11005  0.02
    ## 4  Psilotopsida   63 11005  0.57

``` r
#--------------------------------------------------------------------
```

Orders

``` r
#--------------------------------------------------------------------
# rename 
names(ord) <- c("Order","n")
# compute total
ord$tot <- sum(ord$n)
# conpute percentage
ord$per <- round((ord$n / ord$tot)*100, 2)

# Sort by percentage 
ord1 <- ord[order(-ord$per),]
ord1
```

    ##             Order    n   tot   per
    ## 17         Poales 4870 11005 44.25
    ## 12       Lamiales 1378 11005 12.52
    ## 10        Fabales 1190 11005 10.81
    ## 3       Asterales 1032 11005  9.38
    ## 11    Gentianales  996 11005  9.05
    ## 18   Ranunculales  460 11005  4.18
    ## 6  Caryophyllales  425 11005  3.86
    ## 7     Celastrales  209 11005  1.90
    ## 14   Malpighiales  200 11005  1.82
    ## 9        Ericales  103 11005  0.94
    ## 16 Ophioglossales   63 11005  0.57
    ## 1         Apiales   31 11005  0.28
    ## 20   Saxifragales   17 11005  0.15
    ## 4     Boraginales    9 11005  0.08
    ## 13       Liliales    8 11005  0.07
    ## 2     Asparagales    5 11005  0.05
    ## 5     Brassicales    3 11005  0.03
    ## 19        Rosales    3 11005  0.03
    ## 8     Cupressales    2 11005  0.02
    ## 15       Myrtales    1 11005  0.01

``` r
#--------------------------------------------------------------------
```

Families

``` r
#--------------------------------------------------------------------
# rename 
names(fam) <- c("Family","n","Order","Class")
# compute total
fam$tot <- sum(fam$n)
# conpute percentage
fam$per <- round((fam$n / fam$tot)*100, 2)

# Sort by percentage 
fam1 <- fam[order(-fam$per),]
fam1
```

    ##              Family    n          Order         Class   tot   per
    ## 11       Cyperaceae 2324         Poales    Liliopsida 11005 21.12
    ## 22          Poaceae 2149         Poales    Liliopsida 11005 19.53
    ## 13         Fabaceae 1190        Fabales Magnoliopsida 11005 10.81
    ## 3        Asteraceae  991      Asterales Magnoliopsida 11005  9.00
    ## 14     Gentianaceae  970    Gentianales Magnoliopsida 11005  8.81
    ## 28 Scrophulariaceae  794       Lamiales Magnoliopsida 11005  7.21
    ## 25    Ranunculaceae  460   Ranunculales Magnoliopsida 11005  4.18
    ## 7   Caryophyllaceae  413 Caryophyllales Magnoliopsida 11005  3.75
    ## 15        Juncaceae  397         Poales    Liliopsida 11005  3.61
    ## 21   Plantaginaceae  321       Lamiales Magnoliopsida 11005  2.92
    ## 16 Lentibulariaceae  263       Lamiales Magnoliopsida 11005  2.39
    ## 8      Celastraceae  209    Celastrales Magnoliopsida 11005  1.90
    ## 29        Violaceae  189   Malpighiales Magnoliopsida 11005  1.72
    ## 12        Ericaceae  103       Ericales Magnoliopsida 11005  0.94
    ## 20  Ophioglossaceae   63 Ophioglossales  Psilotopsida 11005  0.57
    ## 6     Campanulaceae   41      Asterales Magnoliopsida 11005  0.37
    ## 1          Apiaceae   31        Apiales Magnoliopsida 11005  0.28
    ## 27        Rubiaceae   26    Gentianales Magnoliopsida 11005  0.24
    ## 9      Crassulaceae   17   Saxifragales Magnoliopsida 11005  0.15
    ## 18         Linaceae   11   Malpighiales Magnoliopsida 11005  0.10
    ## 24    Portulacaceae   10 Caryophyllales Magnoliopsida 11005  0.09
    ## 4      Boraginaceae    9    Boraginales Magnoliopsida 11005  0.08
    ## 17        Liliaceae    8       Liliales    Liliopsida 11005  0.07
    ## 2      Asparagaceae    5    Asparagales    Liliopsida 11005  0.05
    ## 5      Brassicaceae    3    Brassicales Magnoliopsida 11005  0.03
    ## 26         Rosaceae    3        Rosales Magnoliopsida 11005  0.03
    ## 10     Cupressaceae    2    Cupressales     Pinopsida 11005  0.02
    ## 23     Polygonaceae    2 Caryophyllales Magnoliopsida 11005  0.02
    ## 19       Onagraceae    1       Myrtales Magnoliopsida 11005  0.01

``` r
# class Magnoliopsia
fam1[fam1$Class == 'Magnoliopsida',]
```

    ##              Family    n          Order         Class   tot   per
    ## 13         Fabaceae 1190        Fabales Magnoliopsida 11005 10.81
    ## 3        Asteraceae  991      Asterales Magnoliopsida 11005  9.00
    ## 14     Gentianaceae  970    Gentianales Magnoliopsida 11005  8.81
    ## 28 Scrophulariaceae  794       Lamiales Magnoliopsida 11005  7.21
    ## 25    Ranunculaceae  460   Ranunculales Magnoliopsida 11005  4.18
    ## 7   Caryophyllaceae  413 Caryophyllales Magnoliopsida 11005  3.75
    ## 21   Plantaginaceae  321       Lamiales Magnoliopsida 11005  2.92
    ## 16 Lentibulariaceae  263       Lamiales Magnoliopsida 11005  2.39
    ## 8      Celastraceae  209    Celastrales Magnoliopsida 11005  1.90
    ## 29        Violaceae  189   Malpighiales Magnoliopsida 11005  1.72
    ## 12        Ericaceae  103       Ericales Magnoliopsida 11005  0.94
    ## 6     Campanulaceae   41      Asterales Magnoliopsida 11005  0.37
    ## 1          Apiaceae   31        Apiales Magnoliopsida 11005  0.28
    ## 27        Rubiaceae   26    Gentianales Magnoliopsida 11005  0.24
    ## 9      Crassulaceae   17   Saxifragales Magnoliopsida 11005  0.15
    ## 18         Linaceae   11   Malpighiales Magnoliopsida 11005  0.10
    ## 24    Portulacaceae   10 Caryophyllales Magnoliopsida 11005  0.09
    ## 4      Boraginaceae    9    Boraginales Magnoliopsida 11005  0.08
    ## 5      Brassicaceae    3    Brassicales Magnoliopsida 11005  0.03
    ## 26         Rosaceae    3        Rosales Magnoliopsida 11005  0.03
    ## 23     Polygonaceae    2 Caryophyllales Magnoliopsida 11005  0.02
    ## 19       Onagraceae    1       Myrtales Magnoliopsida 11005  0.01

``` r
# class Liliopsida
fam1[fam1$Class == 'Liliopsida',]
```

    ##          Family    n       Order      Class   tot   per
    ## 11   Cyperaceae 2324      Poales Liliopsida 11005 21.12
    ## 22      Poaceae 2149      Poales Liliopsida 11005 19.53
    ## 15    Juncaceae  397      Poales Liliopsida 11005  3.61
    ## 17    Liliaceae    8    Liliales Liliopsida 11005  0.07
    ## 2  Asparagaceae    5 Asparagales Liliopsida 11005  0.05

``` r
#--------------------------------------------------------------------
```

Genus
=====

``` r
#--------------------------------------------------------------------
# rename 
names(gen) <- c("Genus","n","Class","Order","Family")

# compute total
gen$tot <- sum(gen$n)
# conpute percentage
gen$per <- round((gen$n / gen$tot)*100, 2)

# Sort by percentage 
gen1 <- gen[order(-gen$per),]
gen1
```

    ##             Genus    n         Class          Order           Family   tot
    ## 9           Carex 1824    Liliopsida         Poales       Cyperaceae 11005
    ## 33         Nardus 1030    Liliopsida         Poales          Poaceae 11005
    ## 45 Scorzoneroides  990 Magnoliopsida      Asterales       Asteraceae 11005
    ## 22       Gentiana  968 Magnoliopsida    Gentianales     Gentianaceae 11005
    ## 18      Euphrasia  712 Magnoliopsida       Lamiales Scrophulariaceae 11005
    ## 28          Lotus  604 Magnoliopsida        Fabales         Fabaceae 11005
    ## 51      Trifolium  586 Magnoliopsida        Fabales         Fabaceae 11005
    ## 19        Festuca  525    Liliopsida         Poales          Poaceae 11005
    ## 14     Eleocharis  500    Liliopsida         Poales       Cyperaceae 11005
    ## 3        Agrostis  488    Liliopsida         Poales          Poaceae 11005
    ## 42     Ranunculus  460 Magnoliopsida   Ranunculales    Ranunculaceae 11005
    ## 38       Plantago  321 Magnoliopsida       Lamiales   Plantaginaceae 11005
    ## 37     Pinguicula  263 Magnoliopsida       Lamiales Lentibulariaceae 11005
    ## 25         Juncus  220    Liliopsida         Poales        Juncaceae 11005
    ## 34      Parnassia  209 Magnoliopsida    Celastrales     Celastraceae 11005
    ## 54          Viola  189 Magnoliopsida   Malpighiales        Violaceae 11005
    ## 29         Luzula  177    Liliopsida         Poales        Juncaceae 11005
    ## 44         Sagina  131 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 10      Cerastium  124 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 52      Vaccinium  103 Magnoliopsida       Ericales        Ericaceae 11005
    ## 53       Veronica   72 Magnoliopsida       Lamiales Scrophulariaceae 11005
    ## 36         Phleum   66    Liliopsida         Poales          Poaceae 11005
    ## 6      Botrychium   63  Psilotopsida Ophioglossales  Ophioglossaceae 11005
    ## 35     Paronychia   49 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 5        Arenaria   41 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 8       Campanula   41 Magnoliopsida      Asterales    Campanulaceae 11005
    ## 17       Eryngium   26 Magnoliopsida        Apiales         Apiaceae 11005
    ## 21         Galium   26 Magnoliopsida    Gentianales        Rubiaceae 11005
    ## 47         Silene   26 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 1                   22    Liliopsida         Poales          Poaceae 11005
    ## 24      Herniaria   22 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 46          Sedum   17 Magnoliopsida   Saxifragales     Crassulaceae 11005
    ## 48    Spergularia   17 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 39            Poa   14    Liliopsida         Poales          Poaceae 11005
    ## 41        Radiola   11 Magnoliopsida   Malpighiales         Linaceae 11005
    ## 27        Linaria   10 Magnoliopsida       Lamiales Scrophulariaceae 11005
    ## 31         Montia   10 Magnoliopsida Caryophyllales    Portulacaceae 11005
    ## 20          Gagea    8    Liliopsida       Liliales        Liliaceae 11005
    ## 32       Myosotis    8 Magnoliopsida    Boraginales     Boraginaceae 11005
    ## 4      Anthericum    5    Liliopsida    Asparagales     Asparagaceae 11005
    ## 30           Meum    5 Magnoliopsida        Apiales         Apiaceae 11005
    ## 40     Potentilla    3 Magnoliopsida        Rosales         Rosaceae 11005
    ## 49      Stellaria    3 Magnoliopsida Caryophyllales  Caryophyllaceae 11005
    ## 7          Bromus    2    Liliopsida         Poales          Poaceae 11005
    ## 12       Dactylis    2    Liliopsida         Poales          Poaceae 11005
    ## 23    Gentianella    2 Magnoliopsida    Gentianales     Gentianaceae 11005
    ## 26      Juniperus    2     Pinopsida    Cupressales     Cupressaceae 11005
    ## 43          Rumex    2 Magnoliopsida Caryophyllales     Polygonaceae 11005
    ## 2                    1 Magnoliopsida    Boraginales     Boraginaceae 11005
    ## 11        Cirsium    1 Magnoliopsida      Asterales       Asteraceae 11005
    ## 13          Draba    1 Magnoliopsida    Brassicales     Brassicaceae 11005
    ## 15      Epilobium    1 Magnoliopsida       Myrtales       Onagraceae 11005
    ## 16       Erophila    1 Magnoliopsida    Brassicales     Brassicaceae 11005
    ## 50        Thlaspi    1 Magnoliopsida    Brassicales     Brassicaceae 11005
    ##      per
    ## 9  16.57
    ## 33  9.36
    ## 45  9.00
    ## 22  8.80
    ## 18  6.47
    ## 28  5.49
    ## 51  5.32
    ## 19  4.77
    ## 14  4.54
    ## 3   4.43
    ## 42  4.18
    ## 38  2.92
    ## 37  2.39
    ## 25  2.00
    ## 34  1.90
    ## 54  1.72
    ## 29  1.61
    ## 44  1.19
    ## 10  1.13
    ## 52  0.94
    ## 53  0.65
    ## 36  0.60
    ## 6   0.57
    ## 35  0.45
    ## 5   0.37
    ## 8   0.37
    ## 17  0.24
    ## 21  0.24
    ## 47  0.24
    ## 1   0.20
    ## 24  0.20
    ## 46  0.15
    ## 48  0.15
    ## 39  0.13
    ## 41  0.10
    ## 27  0.09
    ## 31  0.09
    ## 20  0.07
    ## 32  0.07
    ## 4   0.05
    ## 30  0.05
    ## 40  0.03
    ## 49  0.03
    ## 7   0.02
    ## 12  0.02
    ## 23  0.02
    ## 26  0.02
    ## 43  0.02
    ## 2   0.01
    ## 11  0.01
    ## 13  0.01
    ## 15  0.01
    ## 16  0.01
    ## 50  0.01

``` r
#--------------------------------------------------------------------
```

Taxa
====

``` r
#--------------------------------------------------------------------
# rename 
names(tax) <- c("taxa","n","Family")

# compute total
tax$tot <- sum(tax$n)
# conpute percentage
tax$per <- round((tax$n / tax$tot)*100, 2)

# Sort by percentage 
tax1 <- tax[order(-tax$per),]
tax1
```

    ##                                                                                                                                       taxa
    ## 57                                                                                                                       Nardus stricta L.
    ## 18                                                                                                               Carex nigra (L.) Reichard
    ## 30                                                                                                              Euphrasia willkommii Freyn
    ## 50                                                                               Lotus corniculatus L. subsp. glacialis (Boiss.) Vald\351s
    ## 75                                                                                                                          Scorzoneroides
    ## 25                                                                                            Eleocharis quinqueflora (Hartmann) O.Schwarz
    ## 32                                                                                                          Festuca iberica (Hack.) Patzke
    ## 17                                                                                                         Carex nevadensis Boiss. & Reut.
    ## 38                                                                                                                   Gentiana boryi Boiss.
    ## 62                                                                                                                  Plantago nivalis Jord.
    ## 87                                                                                                                     Trifolium repens L.
    ## 70                                                      Ranunculus angustifolius DC. subsp. uniflorus (Boiss.) Molero Mesa & P\351rez Raya
    ## 41                                                                                                                  Gentiana sierrae Briq.
    ## 86                                                                                                                   Trifolium pratense L.
    ## 61                                                                                                          Pinguicula nevadensis H.Lindb.
    ## 3                                                                                                               Agrostis nevadensis Boiss.
    ## 13                                                                                                                   Carex echinata Murray
    ## 40                                          Gentiana pneumonanthe L. subsp. depressa (Boiss.) Rivas Mart., A.Asensi, Molero Mesa & F.Valle
    ## 58                                                                                                                  Parnassia palustris L.
    ## 1                                                               Agrostis canina L. subsp. granatensis Romero Garc\355a, Blanca & C.Morales
    ## 76                                                                                                 Scorzoneroides microcephala (DC.) Holub
    ## 77                                                                                               Scorzoneroides nevadensis (Lange) Greuter
    ## 12                                                                                                              Carex caryophyllea Latour.
    ## 94                                                                                                                      Viola palustris L.
    ## 44                                                                                                                   Juncus articulatus L.
    ## 74                                                                                                          Sagina saginoides (L.) Britton
    ## 51                                                                                                                  Luzula campestris Sol.
    ## 71                                                                                                    Ranunculus demissus Orphan. ex Nyman
    ## 88                                                                                                                 Vaccinium uliginosum L.
    ## 14                                                                                                                                Carex L.
    ## 19                                                                Cerastium alpinum L. subsp. aquaticum (Boiss.) Mart.Parras & Molero Mesa
    ## 60 Phleum brachystachyum (Salis) Gamisans, Romero Garc\355a & C.Morales subsp. abbreviatum (Boiss.) Gamisans, Romero Garc\355a & C.Morales
    ## 8                                                                                                              Botrychium lunaria (L.) Sw.
    ## 91                                                                                                            Veronica nevadensis H.Lindb.
    ## 45                                                                                                                      Juncus bufonius L.
    ## 11                                                                                                                     Carex capillaris L.
    ## 20                                                                                                      Cerastium cerastoides (L.) Britton
    ## 59                                                                                                            Paronychia polygonifolia DC.
    ## 10                                                                                                    Campanula herminii Hoffmanns. & Link
    ## 37                                                                                                         Gentiana alpina Adams ex Hoffm.
    ## 69                                                                                                      Ranunculus acetosellifolius Boiss.
    ## 52                                                                                                                              Luzula DC.
    ## 33                                                                                                                              Festuca L.
    ## 6                                                                                                                  Arenaria tetraquetra L.
    ## 81                                                                                                           Silene rupestris Sibth. & Sm.
    ## 35                                                                                                                               Galium L.
    ## 43                                                                                                               Herniaria boissieri J.Gay
    ## 66                                                                                                                        Poaceae Barnhart
    ## 28                                                                                                                Eryngium glaciale Boiss.
    ## 2                                                                                                                              Agrostis L.
    ## 53                                                                                                                  Luzula spicata Puccin.
    ## 82                                                                                                Spergularia rubra (L.) J.Presl & C.Presl
    ## 5                                                                                                             Arenaria serpyllifolia Guss.
    ## 80                                                                                                                                 Sedum L
    ## 16                                                                                                           Carex leporina Pall. ex Kunth
    ## 39                                                                                                                             Gentiana L.
    ## 72                                                                                                                           Ranunculus L.
    ## 64                                                                                                                                  Poa L.
    ## 68                                                                                                                   Radiola linoides Roth
    ## 49                                                                    Linaria aeruginea (Gouan) Cav. subsp. nevadensis (Boiss.) D.A.Sutton
    ## 55                                                                                                                       Montia fontana L.
    ## 34                                                                                                                           Gagea Salisb.
    ## 56                                                                                                     Myosotis minutiflora Boiss. & Reut.
    ## 21                                                                                                                            Cerastium L.
    ## 89                                                                                                                Veronica arvensis Thunb.
    ## 90                                                                                                                             Veronica L.
    ## 4                                                                                                               Anthericum baeticum Steud.
    ## 29                                                                                                                             Eryngium L.
    ## 47                                                                                                                               Juncus L.
    ## 54                                                                                                              Meum athamanticum Garsault
    ## 85                                                                                                                            Trifolium L.
    ## 95                                                                                                                     Viola parvula Tineo
    ## 31                                                                                                                   Festuca frigida Hack.
    ## 15                                                                                                                Carex lepidocarpa Tausch
    ## 36                                                                                                         Galium nevadense Boiss. & Reut.
    ## 67                                                                                                            Potentilla nevadensis Boiss.
    ## 83                                                                                                                  Stellaria alsine Grimm
    ## 93                                                                                                                                Viola L.
    ## 9                                                                                                                                Bromus L.
    ## 23                                                                                     Dactylis glomerata L. var. juncinella (Bory) Boiss.
    ## 42                                                                                                  Gentianella tenella (Rottb.) B\366rner
    ## 48                                                                                                               Juniperus communis Thunb.
    ## 73                                                                                                                                Rumex L.
    ## 92                                                                                                                 Viola crassiuscula Bory
    ## 7                                                                                                                       Boraginaceae Juss.
    ## 22                                                                   Cirsium acaule (L.) F.H.Wigg. subsp. gregarium (Boiss. ex DC.) Werner
    ## 24                                                                                                                   Draba lutescens Coss.
    ## 26                                                                                                                            Epilobium L.
    ## 27                                                                                                            Erophila verna (L.) Chevall.
    ## 46                                                                                                                  Juncus effusus Pollich
    ## 63                                                                                                                          Poa bulbosa L.
    ## 65                                                                                                                      Poa supina Schrad.
    ## 78                                                                                                                  Sedum amplexicaule DC.
    ## 79                                                                                                                   Sedum brevifolium DC.
    ## 84                                                                                                        Thlaspi nevadense Boiss. & Reut.
    ##       n           Family   tot  per
    ## 57 1030          Poaceae 11005 9.36
    ## 18  734       Cyperaceae 11005 6.67
    ## 30  712 Scrophulariaceae 11005 6.47
    ## 50  604         Fabaceae 11005 5.49
    ## 75  585       Asteraceae 11005 5.32
    ## 25  500       Cyperaceae 11005 4.54
    ## 32  491          Poaceae 11005 4.46
    ## 17  482       Cyperaceae 11005 4.38
    ## 38  407     Gentianaceae 11005 3.70
    ## 62  321   Plantaginaceae 11005 2.92
    ## 87  303         Fabaceae 11005 2.75
    ## 70  287    Ranunculaceae 11005 2.61
    ## 41  280     Gentianaceae 11005 2.54
    ## 86  278         Fabaceae 11005 2.53
    ## 61  263 Lentibulariaceae 11005 2.39
    ## 3   261          Poaceae 11005 2.37
    ## 13  248       Cyperaceae 11005 2.25
    ## 40  227     Gentianaceae 11005 2.06
    ## 58  209     Celastraceae 11005 1.90
    ## 1   208          Poaceae 11005 1.89
    ## 76  204       Asteraceae 11005 1.85
    ## 77  201       Asteraceae 11005 1.83
    ## 12  192       Cyperaceae 11005 1.74
    ## 94  179        Violaceae 11005 1.63
    ## 44  156        Juncaceae 11005 1.42
    ## 74  131  Caryophyllaceae 11005 1.19
    ## 51  126        Juncaceae 11005 1.14
    ## 71  121    Ranunculaceae 11005 1.10
    ## 88  103        Ericaceae 11005 0.94
    ## 14  102       Cyperaceae 11005 0.93
    ## 19   67  Caryophyllaceae 11005 0.61
    ## 60   66          Poaceae 11005 0.60
    ## 8    63  Ophioglossaceae 11005 0.57
    ## 91   58 Scrophulariaceae 11005 0.53
    ## 45   57        Juncaceae 11005 0.52
    ## 11   49       Cyperaceae 11005 0.45
    ## 20   50  Caryophyllaceae 11005 0.45
    ## 59   49  Caryophyllaceae 11005 0.45
    ## 10   41    Campanulaceae 11005 0.37
    ## 37   40     Gentianaceae 11005 0.36
    ## 69   38    Ranunculaceae 11005 0.35
    ## 52   32        Juncaceae 11005 0.29
    ## 33   30          Poaceae 11005 0.27
    ## 6    26  Caryophyllaceae 11005 0.24
    ## 81   26  Caryophyllaceae 11005 0.24
    ## 35   23        Rubiaceae 11005 0.21
    ## 43   22  Caryophyllaceae 11005 0.20
    ## 66   22          Poaceae 11005 0.20
    ## 28   21         Apiaceae 11005 0.19
    ## 2    19          Poaceae 11005 0.17
    ## 53   19        Juncaceae 11005 0.17
    ## 82   17  Caryophyllaceae 11005 0.15
    ## 5    15  Caryophyllaceae 11005 0.14
    ## 80   15     Crassulaceae 11005 0.14
    ## 16   14       Cyperaceae 11005 0.13
    ## 39   14     Gentianaceae 11005 0.13
    ## 72   14    Ranunculaceae 11005 0.13
    ## 64   12          Poaceae 11005 0.11
    ## 68   11         Linaceae 11005 0.10
    ## 49   10 Scrophulariaceae 11005 0.09
    ## 55   10    Portulacaceae 11005 0.09
    ## 34    8        Liliaceae 11005 0.07
    ## 56    8     Boraginaceae 11005 0.07
    ## 21    7  Caryophyllaceae 11005 0.06
    ## 89    7 Scrophulariaceae 11005 0.06
    ## 90    7 Scrophulariaceae 11005 0.06
    ## 4     5     Asparagaceae 11005 0.05
    ## 29    5         Apiaceae 11005 0.05
    ## 47    6        Juncaceae 11005 0.05
    ## 54    5         Apiaceae 11005 0.05
    ## 85    5         Fabaceae 11005 0.05
    ## 95    5        Violaceae 11005 0.05
    ## 31    4          Poaceae 11005 0.04
    ## 15    3       Cyperaceae 11005 0.03
    ## 36    3        Rubiaceae 11005 0.03
    ## 67    3         Rosaceae 11005 0.03
    ## 83    3  Caryophyllaceae 11005 0.03
    ## 93    3        Violaceae 11005 0.03
    ## 9     2          Poaceae 11005 0.02
    ## 23    2          Poaceae 11005 0.02
    ## 42    2     Gentianaceae 11005 0.02
    ## 48    2     Cupressaceae 11005 0.02
    ## 73    2     Polygonaceae 11005 0.02
    ## 92    2        Violaceae 11005 0.02
    ## 7     1     Boraginaceae 11005 0.01
    ## 22    1       Asteraceae 11005 0.01
    ## 24    1     Brassicaceae 11005 0.01
    ## 26    1       Onagraceae 11005 0.01
    ## 27    1     Brassicaceae 11005 0.01
    ## 46    1        Juncaceae 11005 0.01
    ## 63    1          Poaceae 11005 0.01
    ## 65    1          Poaceae 11005 0.01
    ## 78    1     Crassulaceae 11005 0.01
    ## 79    1     Crassulaceae 11005 0.01
    ## 84    1     Brassicaceae 11005 0.01

``` r
#--------------------------------------------------------------------
```
