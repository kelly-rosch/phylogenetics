
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)

# This R script combines all domain structures into Proteins

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/5 R make Proteins/")

# Opening RData
load("Full_lineage_LysM_M23.Rdata")
LysM_M23 <- data
rm(data)

load("Full_lineage_M23.Rdata")
M23 <- data
rm(data)

# Making proteins
proteins <- rbind(LysM_M23, M23)
table(proteins$domain_structure)

# Saving
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/6 R clean Proteins/")
save(proteins, file = "Proteins.RData")

