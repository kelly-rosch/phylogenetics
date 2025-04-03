
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)

# This R script opens the .csv files saved from Python and combines them 
# with the original RData saved from Interpro

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/")

# Opening RData
load("LysM_M23.Rdata")

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/4 R merge lineage with RData")

# Opening .csv from Python
taxid <- read.csv("taxid_LysM_M23.csv", header = TRUE)

# Creating unique ID column in the left dataset to catch duplication events during merge
LysM_M23$unique_id <- 1:nrow(LysM_M23)

# Merging
data <- left_join(LysM_M23, taxid)

# Identifying duplicates
data$dups <- duplicated(data$unique_id)

# If I delete rows with duplicated unique_id maybe it will come down to 16749
data <- filter(data, dups == FALSE)
# YES

# Organizing columns and getting rid of redundant organism_name column
data <- data[,c(1:4,6,9:15)]

# Adding a column to say the domain structure so I can combine in next script
data$domain_structure <- "LysM_M23"
data$domain_structure <- as.factor(data$domain_structure)

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/5 R make Proteins/")
save(data, file = "Full_lineage_LysM_M23.Rdata")



