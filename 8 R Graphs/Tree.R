
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(ggplot2)
library(scales)
library(ggtree)

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs")

# Opening counts
load("Species.RData")
load("Superkingdom_species_counts.RData")
load("Phylum_species_counts.RData")
load("Class_species_counts.RData")
load("Order_species_counts.RData")
load("Family_species_counts.RData")
load("Genus_species_counts.RData")
load("Species_species_counts.RData")

load("b_Species.RData")
load("b_Phylum_species_counts.RData")
load("b_Class_species_counts.RData")
load("b_Order_species_counts.RData")
load("b_Family_species_counts.RData")
load("b_Genus_species_counts.RData")
load("b_Species_species_counts.RData")

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts")
load("Proteins_clean.RData")