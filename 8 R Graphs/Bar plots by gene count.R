
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

# Also opening main proteins dataframe
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
load("Proteins_clean.Rdata")


# Num. gene copies with LysM by superkingdom, phylum, etc

# Superkingdom bar graph
ggplot(superkingdom_gene_counts, aes(x = superkingdom, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 3)


# Phylum bar graph
ggplot(phylum_counts, aes(x = phylum, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


# Phylum bar graph with break
ggplot(phylum_counts, aes(x = phylum, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  scale_y_break(c(1700,5600))


# Class bar graph
ggplot(class_counts, aes(x = class, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  theme(legend.position = "bottom")


# Order bar graph
ggplot(order_counts, aes(x = order, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, 
                                   vjust = 0.5, 
                                   hjust = 1, 
                                   size = 5)) +
  theme(legend.position = "bottom")


# Family bar graph
ggplot(family_counts, aes(x = family, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, 
                                   vjust = 0.5, 
                                   hjust = 1, 
                                   size = 5)) +
  theme(legend.position = "bottom")


# Genus bar graph
ggplot(genus_counts, aes(x = genus, y = count, fill = domain_structure)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_bw() +
  ggtitle("") +
  ylab("gene copy number") +
  geom_text(aes(label = count, group = domain_structure), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5,
            size = 2) +
  theme(axis.text.x = element_text(angle = 90, 
                                   vjust = 0.5, 
                                   hjust = 1, 
                                   size = 5)) +
  theme(legend.position = "bottom")
