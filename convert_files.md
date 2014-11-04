# Conversion de documentos

* Markdown to word 
`pandoc -s -S ms_dpBorre.md -o ms_dpBorre_v3.docx`

* How to render Rmd to different format 
```r 
library('rmarkdown')
library('knitr')

setwd('/Users/ajpelu/Dropbox/MS/MS_DP_Borreguiles/git/BorreguilesDP/3_scripts/r/')

rmarkdown::render('gbif_borreguiles_004_observ_taxon_year.Rmd', 'all')
```

