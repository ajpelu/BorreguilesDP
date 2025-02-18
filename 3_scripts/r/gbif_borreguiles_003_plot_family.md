``` r
# -----------------------------------------------------------
#############################################################################
#### SCRIPT: gbif_borreguiles_003_plot_family.R                          ####
#### VERSION: 3                                                          ####
#### FECHA: 05/11/2014                                                   ####
#### AUTOR: ajperez@ugr.es                                               ####
#############################################################################
# -----------------------------------------------------------
```

``` r
# -----------------------------------------------------------
# load library
library('ggplot2')
library('plyr')
library('devtools')
source_url('https://raw.githubusercontent.com/ajpelu/ajpeluR/master/R/exportggplot.R')
# -----------------------------------------------------------
```

Set directory and read data.

``` r
# -----------------------------------------------------------
## Directorio 
di <- '/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP'

# read file
fam <- read.table(file=paste(di, '/2_diccionarios/cov_taxonomica/covtax_family.txt', sep=''), header=TRUE, sep=';')
# -----------------------------------------------------------
```

Now, we prepare the data:

-   compute the percentage of records in the database by family

``` r
#--------------------------------------------------------------------
# rename 
names(fam) <- c("Family","n","Order","Class")
# compute total
fam$tot <- sum(fam$n)
# conpute percentage
fam$per <- round((fam$n / fam$tot)*100, 2)
#--------------------------------------------------------------------
```

Then, we plot and export in different formats.

``` r
# -----------------------------------------------------------
f <- ggplot(fam, aes(x=reorder(Family, per), y=per)) +
  geom_bar(stat = "identity", fill='#43a2ca') + 
  geom_text(aes(x=reorder(Family, per), y=per, label=n),vjust=0.5,hjust=-0.5) + 
  coord_flip() +
  theme_bw() + ylim(0,25)+
  theme(panel.border = element_blank(),
        axis.ticks = element_blank(), axis.text.y = element_text(angle=0, vjust=0.5, size=13)) + 
  ylab('% records') + xlab('Family') 
f
```

![plot of chunk plot](./gbif_borreguiles_003_plot_family_files/figure-markdown_github/plot.png)

``` r
ExportPlot(f, filename=paste(di, '/8_figures/taxonomicCoverage/familiaCov',sep=''), 
           width=8, height=6)
```

    ## Warning: failed to load cairo DLL

    ## null device 
    ##           1
