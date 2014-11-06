#############################################################################
#### SCRIPT: gbif_borreguiles_005_cov_taxonomica.R                       ####
#### VERSION: 2                                                          ####
#### FECHA: 04/11/2014                                                   ####
#### AUTOR: ajperez@ugr.es                                               ####
#############################################################################

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


#--------------------------------------------------------------------
# Phylum
# rename 
names(phylum) <- c("Phylum","n")
# compute total
phylum$tot <- sum(phylum$n)
# conpute percentage
phylum$per <- round((phylum$n / phylum$tot)*100, 2)

phylum 
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Class
# rename 
names(class) <- c("Class","n")
# compute total
class$tot <- sum(class$n)
# conpute percentage
class$per <- round((class$n / class$tot)*100, 2)

class
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Orders 
# rename 
names(ord) <- c("Order","n")
# compute total
ord$tot <- sum(ord$n)
# conpute percentage
ord$per <- round((ord$n / ord$tot)*100, 2)

# Sort by percentage 
ord1 <- ord[order(-ord$per),]
ord1
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Families
# rename 
names(fam) <- c("Family","n","Order","Class")
# compute total
fam$tot <- sum(fam$n)
# conpute percentage
fam$per <- round((fam$n / fam$tot)*100, 2)

# Sort by percentage 
fam1 <- fam[order(-fam$per),]
fam1

# class Magnoliopsia
fam1[fam1$Class == 'Magnoliopsida',]

# class Liliopsida
fam1[fam1$Class == 'Liliopsida',]
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Genus 
# rename 
names(gen) <- c("Genus","n","Class","Order","Family")

# compute total
gen$tot <- sum(gen$n)
# conpute percentage
gen$per <- round((gen$n / gen$tot)*100, 2)

# Sort by percentage 
gen1 <- gen[order(-gen$per),]
gen1
#--------------------------------------------------------------------


#--------------------------------------------------------------------
# Taxa
# rename 
names(tax) <- c("taxa","n","Family")

# compute total
tax$tot <- sum(tax$n)
# conpute percentage
tax$per <- round((tax$n / tax$tot)*100, 2)

# Sort by percentage 
tax1 <- tax[order(-tax$per),]
tax1
#--------------------------------------------------------------------


