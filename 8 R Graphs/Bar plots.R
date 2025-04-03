
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(ggplot2)
library(ggbreak)

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs")

# Opening counts
load("Superkingdom_counts.Rdata")
load("Phylum_counts.RData")
load("Class_counts.RData")
load("Order_counts.RData")
load("Family_counts.RData")
load("Genus_counts.RData")
load("Species_counts.RData")

# Also opening main proteins dataframe
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
load("Proteins_clean.Rdata")


# Graph at each level (superkingdom etc)

# Superkingdom bar graph
ggplot(superkingdom_counts, aes(x = superkingdom, y = count, fill = domain_structure)) +
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
            size = 3) +
  

# Other ideas:
#   -Plot histogram of how many species have what