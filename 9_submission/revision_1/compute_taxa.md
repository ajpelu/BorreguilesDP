Count Phylum
============

``` r
phy <- data.frame(phy=c('Magnoliophyta', 'Pteridophyta'),
                   count=c(10939,63))
phy$per <- round((phy$count/sum(phy$count))*100, 3)
phy 
```

    ##             phy count    per
    ## 1 Magnoliophyta 10939 99.427
    ## 2  Pteridophyta    63  0.573

Count class
===========

``` r
clas <- data.frame(cl=c('Liliposida', 'Magnoliopsida', 'Psilotopsida'),
                   count=c(4882,6057,63))
clas$per <- round((clas$count/sum(clas$count))*100, 3)
clas
```

    ##              cl count    per
    ## 1    Liliposida  4882 44.374
    ## 2 Magnoliopsida  6057 55.054
    ## 3  Psilotopsida    63  0.573

Count order
===========

``` r
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP/9_submission/revision_1/data' 
ord <- read.table(file=paste(di, '/order.txt', sep=''), header=T, sep='\t')

ord$per <- round((ord$CuentaDeorder/sum(ord$CuentaDeorder))*100,3)
```

Count family
============

``` r
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP/9_submission/revision_1/data' 
fam <- read.table(file=paste(di, '/family.txt', sep=''), header=T, sep='\t')

fam$per <- round((fam$CuentaDefamily/sum(fam$CuentaDefamily))*100,3)
```
