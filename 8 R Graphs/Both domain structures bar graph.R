
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(ggplot2)

# This R script opens the .csv files saved from Python and combines them 
# with the original RData saved from Interpro

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/4 R merge with lineage and graph")

# Opening RData
load("M23_to_combine.Rdata")
M23 <- data
rm(data)

load("LysM_M23_to_combine.Rdata")
LysM_M23 <- data
rm(data)

data <- rbind(LysM_M23, M23)
table(data$d_structure)

# Graphing combined data
ggplot(data, aes(x = class, fill = d_structure)) +
  geom_bar(position = "dodge") +
  theme_bw() +
  theme(legend.position = "top") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases with LysM domains",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 7))  

# Merging counts
load("M23_counts.Rdata")
M23_counts <- counts  
rm(counts)

load("LysM_M23_counts.Rdata")
LysM_M23_counts <- counts  
rm(counts)

counts <- full_join(LysM_M23_counts, M23_counts)

# Making LysM prevalence score
counts$LysM_score <- counts$LysM_M23/counts$M23

# Graphing classes by LysM score
ggplot(counts, aes(x = LysM_score, y = 0)) +
  geom_point() +
  theme_bw() +
  ylim(0,1) +
  xlim(0,2)

# Labeling LysM scores
counts <- counts %>%
  arrange(-LysM_score)

# Figure 1B -- how many species have LysM vs plain M23?

species_list <- data[!(data$genus == ""),]
species_list <- species_list[!grepl("sp.", species_list$species),] #getting rid of sp.
table(species_list$d_structure)


# Figure 1C -- finding well-documented species that don't have any LysM M23s

species_counts_M23 <- as.data.frame(table(M23$species))
colnames(species_counts_M23)[1] <- 'Species'
colnames(species_counts_M23)[2] <- 'M23'

species_counts_LysM_M23 <- as.data.frame(table(LysM_M23$species))
colnames(species_counts_LysM_M23)[1] <- 'Species'
colnames(species_counts_LysM_M23)[2] <- 'LysM_M23'

species_counts <- full_join(species_counts_M23, species_counts_LysM_M23)
no_LysM <- species_counts[is.na(species_counts$LysM_M23),]

# first look for bacteria that I recognize
# then for fun look for other animals
superkingdoms <- as.data.frame(table(M23$superkingdom))
euks <- filter(M23, superkingdom == "Eukaryota")
euks_class <- as.data.frame(table(euks$class))                      

ggplot(euks, aes(x = class)) +
  geom_bar() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 7))

spiders <- filter(euks, class == "Arachnida")

ggplot(spiders, aes(x = species)) +
  geom_bar() +
  theme_bw() +
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases",
          subtitle = "Excluding proteins of the same length in the same taxid") +
  theme(axis.text.x = element_text(size = 10))
