
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library("eeptools")
library("tidyr")
library("dplyr")
library("MetBrewer")
library("stringr")

# This R script opens the .tsv files saved from Interpro
# Unusual characters like )) have been deleted from the .tsv files in Excel using find and replace

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/1 Interpro output TSVs")

# Opening list of genes that contain both LysM and M23
M23 <- read.table(file = 'M23.tsv', sep = '\t')

colnames(M23)[1] <- 'accession'
colnames(M23)[2] <- 'source_database'
colnames(M23)[3] <- 'gene_name'
colnames(M23)[4] <- 'taxid'
colnames(M23)[5] <- 'organism_name'
colnames(M23)[6] <- 'length'

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript")

save(M23, file = "M23.Rdata")
