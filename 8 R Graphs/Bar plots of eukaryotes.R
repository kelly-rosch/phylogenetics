
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



euks <- filter(species, superkingdom == "Eukaryota" & detected == "TRUE")

ggplot(euks, aes(x = class)) +
  geom_bar(position = "dodge") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 10))

arachnida <- filter(euks, class == "Arachnida")

ggplot(arachnida, aes(x = species)) +
  geom_bar(position = "dodge") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 10))

mammalia <- filter(euks, class == "Mammalia")

ggplot(mammalia, aes(x = species, y = count)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 10))