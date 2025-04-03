
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

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript")

# Opening list of genes that contain both LysM and M23
LysM_M23 <- read.table(file = 'LysM_M23.tsv', sep = '\t')

colnames(LysM_M23)[1] <- 'accession'
colnames(LysM_M23)[2] <- 'source_database'
colnames(LysM_M23)[3] <- 'gene_name'
colnames(LysM_M23)[4] <- 'taxid'
colnames(LysM_M23)[5] <- 'organism_name'
colnames(LysM_M23)[6] <- 'length'

# deleting empty 7th column
LysM_M23 <- LysM_M23[,1:6]

save(LysM_M23, file = "LysM_M23.Rdata")