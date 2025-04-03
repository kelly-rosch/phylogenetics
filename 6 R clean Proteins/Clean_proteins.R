
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)

# This R script cleans the Proteins dataframe in the following ways:
# 1. Excludes proteins of the same length in the same taxid
# 2. Excludes proteins that don't have a genus listed
# 3. Excludes proteins from a species containing "sp."
# 4. Excludes proteins from a genus containing "Candidatus"


setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/6 R clean Proteins/")

# Opening proteins
load("Proteins.Rdata")

# 1. Excludeing proteins of the same length in the same taxid
# (But keeping 1 of the duplicated proteins instead of deleting all of them)
proteins <- proteins %>%
  group_by(length, taxid) %>%
  slice(1)

dup_check <- filter(proteins, taxid == 1879010 & length == 35)
# this was a duplicated protein so I should get 1 result

# 2. Excluding proteins that don't have a genus/family/order/class/phylum listed
proteins <- proteins[!(proteins$genus == ""),]
proteins <- proteins[!(proteins$family == ""),]
proteins <- proteins[!(proteins$order == ""),]
proteins <- proteins[!(proteins$class == ""),]
proteins <- proteins[!(proteins$phylum == ""),]

# 3. Excluding proteins from a species containing "sp."
proteins <- proteins[!grepl("sp.", proteins$species),]

# 4. Excluding proteins from a genus containing "Candidatus"
proteins <- proteins[!grepl("Candidatus", proteins$genus),]

# Saving
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
save(proteins, file = "Proteins_clean.RData")
