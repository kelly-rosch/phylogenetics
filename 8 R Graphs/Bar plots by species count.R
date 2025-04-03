
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


# Num. species with LysM detected by superkingdom, phylum, etc.

# Superkingdom bar graph
ggplot(superkingdom_species_counts, aes(x = superkingdom, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by superkingdom") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


# Phylum bar graph
ggplot(phylum_species_counts, aes(x = phylum, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by phylum") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


# Class bar graph
ggplot(class_species_counts, aes(x = class, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by class") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


# Order bar graph
ggplot(order_species_counts, aes(x = order, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by order") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


# Family bar graph
ggplot(family_species_counts, aes(x = family, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by family") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


# Genus bar graph
ggplot(genus_species_counts, aes(x = genus, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("Species counts by genus") +
  ylab("# species containing domain structure") +
  xlab(NULL) +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom") +
  scale_fill_discrete(labels = c("LysM M23", "M23")) +
  labs(fill = "Domain structure")


