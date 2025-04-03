
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(tidyr)

# This R script counts proteins by superkingdom, phylum, class, order, family, genus, and species
# Then counts the number of species with LysM vs without

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts/")
load("Proteins_clean.Rdata")

# Superkingdom
superkingdom_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$superkingdom))

colnames(superkingdom_gene_counts)[1] <- 'domain_structure'
colnames(superkingdom_gene_counts)[2] <- 'superkingdom'
colnames(superkingdom_gene_counts)[3] <- 'count'


# Phylum
phylum_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$phylum))

colnames(phylum_gene_counts)[1] <- 'domain_structure'
colnames(phylum_gene_counts)[2] <- 'phylum'
colnames(phylum_gene_counts)[3] <- 'count'


# Class
class_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$class))

colnames(class_gene_counts)[1] <- 'domain_structure'
colnames(class_gene_counts)[2] <- 'class'
colnames(class_gene_counts)[3] <- 'count'


# Order
order_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$order))

colnames(order_gene_counts)[1] <- 'domain_structure'
colnames(order_gene_counts)[2] <- 'order'
colnames(order_gene_counts)[3] <- 'count'


# Family
family_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$family))

colnames(family_gene_counts)[1] <- 'domain_structure'
colnames(family_gene_counts)[2] <- 'family'
colnames(family_gene_counts)[3] <- 'count'


# Genus
genus_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$genus))

colnames(genus_gene_counts)[1] <- 'domain_structure'
colnames(genus_gene_counts)[2] <- 'genus'
colnames(genus_gene_counts)[3] <- 'count'


# Species
species_gene_counts <- as.data.frame(
  table(proteins$domain_structure, proteins$species))

colnames(species_gene_counts)[1] <- 'domain_structure'
colnames(species_gene_counts)[2] <- 'species'
colnames(species_gene_counts)[3] <- 'count'


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
species <- species_merge[,c(10:15, 1,8,2,3)]

# Pivoting to long format for graphing
species <- species %>%
  pivot_longer(cols = c("LysM_M23", "M23"),
               names_to = "domain_structure",
               values_to = "count")

species$detected <- !is.na(species$count)

rm(LysM_M23, M23, species_all, species_LysM, species_M23, species_merge)



# I need to make counts by species

# Only keeping rows for species that have LysM/M23 detected so that counts are correct
species <- filter(species, detected == TRUE)

# Superkingdom
superkingdom_species_counts <- as.data.frame(
  table(species$domain_structure, species$superkingdom))

colnames(superkingdom_species_counts)[1] <- 'domain_structure'
colnames(superkingdom_species_counts)[2] <- 'superkingdom'
colnames(superkingdom_species_counts)[3] <- 'count'


# Phylum
phylum_species_counts <- as.data.frame(
  table(species$domain_structure, species$phylum))

colnames(phylum_species_counts)[1] <- 'domain_structure'
colnames(phylum_species_counts)[2] <- 'phylum'
colnames(phylum_species_counts)[3] <- 'count'


# Class
class_species_counts <- as.data.frame(
  table(species$domain_structure, species$class))

colnames(class_species_counts)[1] <- 'domain_structure'
colnames(class_species_counts)[2] <- 'class'
colnames(class_species_counts)[3] <- 'count'


# Order
order_species_counts <- as.data.frame(
  table(species$domain_structure, species$order))

colnames(order_species_counts)[1] <- 'domain_structure'
colnames(order_species_counts)[2] <- 'order'
colnames(order_species_counts)[3] <- 'count'


# Family
family_species_counts <- as.data.frame(
  table(species$domain_structure, species$family))

colnames(family_species_counts)[1] <- 'domain_structure'
colnames(family_species_counts)[2] <- 'family'
colnames(family_species_counts)[3] <- 'count'


# Genus
genus_species_counts <- as.data.frame(
  table(species$domain_structure, species$genus))

colnames(genus_species_counts)[1] <- 'domain_structure'
colnames(genus_species_counts)[2] <- 'genus'
colnames(genus_species_counts)[3] <- 'count'


# Species
species_species_counts <- as.data.frame(
  table(species$domain_structure, species$species))

colnames(species_species_counts)[1] <- 'domain_structure'
colnames(species_species_counts)[2] <- 'species'
colnames(species_species_counts)[3] <- 'count'


# Bacteria only
b_species <- filter(species, superkingdom == "Bacteria")


# Phylum
b_phylum_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$phylum))

colnames(b_phylum_species_counts)[1] <- 'domain_structure'
colnames(b_phylum_species_counts)[2] <- 'phylum'
colnames(b_phylum_species_counts)[3] <- 'count'


# Class
b_class_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$class))

colnames(b_class_species_counts)[1] <- 'domain_structure'
colnames(b_class_species_counts)[2] <- 'class'
colnames(b_class_species_counts)[3] <- 'count'


# Order
b_order_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$order))

colnames(b_order_species_counts)[1] <- 'domain_structure'
colnames(b_order_species_counts)[2] <- 'order'
colnames(b_order_species_counts)[3] <- 'count'


# Family
b_family_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$family))

colnames(b_family_species_counts)[1] <- 'domain_structure'
colnames(b_family_species_counts)[2] <- 'family'
colnames(b_family_species_counts)[3] <- 'count'


# Genus
b_genus_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$genus))

colnames(b_genus_species_counts)[1] <- 'domain_structure'
colnames(b_genus_species_counts)[2] <- 'genus'
colnames(b_genus_species_counts)[3] <- 'count'


# Species
b_species_species_counts <- as.data.frame(
  table(b_species$domain_structure, b_species$species))

colnames(b_species_species_counts)[1] <- 'domain_structure'
colnames(b_species_species_counts)[2] <- 'species'
colnames(b_species_species_counts)[3] <- 'count'


# Saving
setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs/")

save(superkingdom_gene_counts, file = "Superkingdom_gene_counts.RData")
save(phylum_gene_counts, file = "Phylum_gene_counts.RData")
save(class_gene_counts, file = "Class_gene_counts.RData")
save(order_gene_counts, file = "Order_gene_counts.RData")
save(family_gene_counts, file = "Family_gene_counts.RData")
save(genus_gene_counts, file = "Genus_gene_counts.RData")
save(species_gene_counts, file = "Species_gene_counts.RData")

save(species, file = "Species.RData")
save(superkingdom_species_counts, file = "Superkingdom_species_counts.RData")
save(phylum_species_counts, file = "Phylum_species_counts.RData")
save(class_species_counts, file = "Class_species_counts.RData")
save(order_species_counts, file = "Order_species_counts.RData")
save(family_species_counts, file = "Family_species_counts.RData")
save(genus_species_counts, file = "Genus_species_counts.RData")
save(species_species_counts, file = "Species_species_counts.RData")

save(b_species, file = "b_Species.RData")
save(b_phylum_species_counts, file = "b_Phylum_species_counts.RData")
save(b_class_species_counts, file = "b_Class_species_counts.RData")
save(b_order_species_counts, file = "b_Order_species_counts.RData")
save(b_family_species_counts, file = "b_Family_species_counts.RData")
save(b_genus_species_counts, file = "b_Genus_species_counts.RData")
save(b_species_species_counts, file = "b_Species_species_counts.RData")

