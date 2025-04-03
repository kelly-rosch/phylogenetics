
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(ggplot2)
library(ggbreak)

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs")

# Opening counts
load("Superkingdom_gene_counts.RData")
load("Phylum_gene_counts.RData")
load("Class_gene_counts.RData")
load("Order_gene_counts.RData")
load("Family_gene_counts.RData")
load("Genus_gene_counts.RData")
load("Species_gene_counts.RData")

load("Species.RData")
load("Superkingdom_species_counts.RData")
load("Phylum_species_counts.RData")
load("Class_species_counts.RData")
load("Order_species_counts.RData")
load("Family_species_counts.RData")
load("Genus_species_counts.RData")
load("Species_species_counts.RData")

# Also opening main proteins dataframe
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
load("Proteins_clean.Rdata")



# Genus histogram
ggplot(genus_counts, aes(x = count, fill = domain_structure)) +
  geom_histogram(position = "dodge", binwidth = 10) +
  scale_y_break(c(50,75)) +
  scale_y_break(c(100,150)) +
  scale_y_break(c(175,650)) +
  scale_y_break(c(670,1630)) +
  scale_y_break(c(1650,2600)) +
  scale_x_continuous(position = "bottom", breaks = seq(0,3000, 100)) +
  ylab("# genuses") +
  xlab("gene copies per genus")


#Genus histogram with log scale
ggplot(genus_counts, aes(x = count, fill = domain_structure)) +
  geom_histogram(position = "dodge", binwidth = 10) +
  scale_y_log10() +
  annotation_logticks()
