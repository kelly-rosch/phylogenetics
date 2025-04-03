
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)

# This R script counts proteins by superkingdom, phylum, class, order, family, genus, and species
# Then counts the number of species with LysM vs without

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
load("Proteins_clean.Rdata")

# Superkingdom
superkingdom_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$superkingdom))

colnames(superkingdom_counts)[1] <- 'domain_structure'
colnames(superkingdom_counts)[2] <- 'superkingdom'
colnames(superkingdom_counts)[3] <- 'count'


# Phylum
phylum_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$phylum))

colnames(phylum_counts)[1] <- 'domain_structure'
colnames(phylum_counts)[2] <- 'phylum'
colnames(phylum_counts)[3] <- 'count'


# Class
class_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$class))

colnames(class_counts)[1] <- 'domain_structure'
colnames(class_counts)[2] <- 'class'
colnames(class_counts)[3] <- 'count'


# Order
order_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$order))

colnames(order_counts)[1] <- 'domain_structure'
colnames(order_counts)[2] <- 'order'
colnames(order_counts)[3] <- 'count'


# Family
family_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$family))

colnames(family_counts)[1] <- 'domain_structure'
colnames(family_counts)[2] <- 'family'
colnames(family_counts)[3] <- 'count'


# Genus
genus_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$genus))

colnames(genus_counts)[1] <- 'domain_structure'
colnames(genus_counts)[2] <- 'genus'
colnames(genus_counts)[3] <- 'count'


# Species
species_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$species))

colnames(species_counts)[1] <- 'domain_structure'
colnames(species_counts)[2] <- 'species'
colnames(species_counts)[3] <- 'count'


# Now counting the # species with LysM vs without
LysM_M23 <- filter(proteins, domain_structure == "LysM_M23")
species_LysM <- as.data.frame(table(LysM_M23$species))
colnames(species_LysM)[1] <- 'species'
colnames(species_LysM)[2] <- 'LysM_M23'

M23 <- filter(proteins, domain_structure == "M23")
species_M23 <- as.data.frame(table(M23$species))
colnames(species_M23)[1] <- 'species'
colnames(species_M23)[2] <- 'M23'

species_all <- full_join(species_LysM, species_M23)

# Creating unique ID column in the left dataset to catch duplication events during merge
species_all$unique_id <- 1:nrow(species_all)

# Merging
species_merge <- left_join(species_all, proteins)

# Identifying duplicates
species_merge$dups <- duplicated(species_merge$unique_id)

# If I delete rows with duplicated unique_id maybe it will come down to 10150
species_merge <- filter(species_merge, dups == FALSE)
# YES

# Keeping only the counts and lineage info
species <- species_merge[,c(10:15, 1:3)]

# Pivoting to long format for graphing
species <- species %>%
  pivot_longer(cols = c("LysM_M23", "M23"),
               names_to = "domain_structure",
               values_to = "count")

species$detected <- !is.na(species$count)

rm(LysM_M23, M23, species_all, species_LysM, species_M23, species_merge)


# I need to make counts by species

# Saving
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs/")

save(superkingdom_counts, file = "Superkingdom_counts.RData")
save(phylum_counts, file = "Phylum_counts.RData")
save(class_counts, file = "Class_counts.RData")
save(order_counts, file = "Order_counts.RData")
save(family_counts, file = "Family_counts.RData")
save(genus_counts, file = "Genus_counts.RData")
save(species_counts, file = "Species_counts.RData")
save(species, file = "Species.RData")


