
rm(list = ls()) # clear out previous data 
dev.off()       # close all previous plots
cat("\014")     # clear console of previous output

library(dplyr)
library(ggplot2)
library(scales)

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/8 R Graphs")

# Opening counts
load("Species.RData")
load("Superkingdom_species_counts.RData")
load("Phylum_species_counts.RData")
load("Class_species_counts.RData")
load("Order_species_counts.RData")
load("Family_species_counts.RData")
load("Genus_species_counts.RData")
load("Species_species_counts.RData")

load("b_Species.RData")
load("b_Phylum_species_counts.RData")
load("b_Class_species_counts.RData")
load("b_Order_species_counts.RData")
load("b_Family_species_counts.RData")
load("b_Genus_species_counts.RData")
load("b_Species_species_counts.RData")

setwd("/Users/me/Documents/Doerr Lab/LysM manuscript/7 R make Counts")
load("Proteins_clean.RData")



# Making stacked bar graph by percentage
# Starting with phylum, just for bacteria

# Getting percentages
b_phylum_species_counts <- b_phylum_species_counts %>%
  group_by(domain_structure) %>%
  transmute(phylum, percent = count/sum(count))


# Phylum stacked bar graph
ggplot(b_phylum_species_counts, aes(x = domain_structure, y = percent, fill = phylum)) +
  geom_bar(stat = 'identity') +
  theme_light() +
  ylab("") +
  xlab("") +
  scale_y_continuous(labels = percent) +
  ggtitle("Bacteria with/without LysM endopeptidases, grouped by phylum") +
  theme(legend.position = "right") +
  #geom_text(data = phylum_species_counts, aes(x = domain_structure, 
  #y = Label_position, 
  #label = paste0(phylum)), size = 3) +
  theme(axis.text.x = element_text(size = 14)) +
  theme(axis.text.y = element_text(size = 16)) +
  theme(axis.title = element_text(size = 18)) +
  theme(legend.title = element_text(size = 16)) +
  theme(legend.text = element_text(size = 10)) +
  guides(fill = guide_legend(ncol = 1, override.aes = list(size = 0.5)))


# Class table
b_class_species_counts %>% group_by(domain_structure) %>% arrange(domain_structure, desc(count)) %>% slice_head(n=9)

# Repeating same thing for class
b_class_species_counts <- b_class_species_counts %>%
  group_by(domain_structure) %>%
  transmute(class, percent = count/sum(count))


# Class stacked bar graph
ggplot(b_class_species_counts, aes(x = domain_structure, y = percent, fill = class)) +
  geom_bar(stat = 'identity') +
  theme_light() +
  ylab("") +
  xlab("") +
  scale_y_continuous(labels = percent) +
  ggtitle("") +
  theme(legend.position = "right") +
  theme(axis.text.x = element_text(size = 16)) +
  theme(axis.text.y = element_text(size = 22)) +
  theme(axis.title = element_text(size = 18)) +
  theme(legend.title = element_text(size = 16)) +
  theme(legend.text = element_text(size = 11)) +
  guides(fill = guide_legend(ncol = 2, override.aes = list(size = 0.5)))

# Figure 1D, species that don't have LysM
mollicutes <- filter(b_species, class == "Mollicutes")
mollicutes <- filter(proteins, class == "Mollicutes")

#Bar graph of how many bacteria have which
ggplot(b_species, aes(x = domain_structure, fill = domain_structure)) +
  geom_bar(stat = 'count') +
  theme_light() +
  ylab("Bacterial species") +
  xlab("") +
  ggtitle("Bacteria with/without LysM endopeptidases") +
  theme(legend.position = "none") +
  geom_text(stat = "count", color = "black", size = 4, aes(label = paste0("n = ", after_stat(count))), nudge_y=500) +
  theme(axis.text.x = element_text(size = 14)) +
  theme(axis.text.y = element_text(size = 16)) +
  theme(axis.title = element_text(size = 18)) +
  theme(legend.title = element_text(size = 16)) +
  theme(legend.text = element_text(size = 10))


# Superkingdom stacked bar graph
ggplot(superkingdom_species_counts, aes(x = domain_structure, y = percent, fill = superkingdom)) +
  geom_bar(stat = 'identity') +
  theme_light() +
  ylab("") +
  xlab("") +
  scale_y_continuous(labels = percent) +
  ggtitle("Species with/without LysM endopeptidases, grouped by superkingdom") +
  theme(legend.position = "bottom") +
  #geom_text(data = superkingdom_species_counts, aes(x = domain_structure, 
                               #y = Label_position, 
                               #label = paste0(percent,"%")), size = 3) +
  theme(axis.text.x = element_text(size = 14)) +
  theme(axis.text.y = element_text(size = 16)) +
  theme(axis.title = element_text(size = 18)) +
  theme(legend.title = element_text(size = 16)) +
  theme(legend.text = element_text(size = 14)) 


# Phylum (just for bacteria)

b_phylum_species_counts <- filter(phylum_species_counts, superkingdom == "bacteria")

# Adding percentage column
phylum_species_counts <- phylum_species_counts %>%
  group_by(domain_structure) %>%
  transmute(phylum, percent = count/sum(count))


phylum_species_counts$percent <- round(phylum_species_counts$percent,
                                             digit = 3)


# Getting label in the right place
#phylum_species_counts <- ddply(phylum_species_counts, .(domain_structure),
                               #transform, 
                               #Label_position = 1-(cumsum(percent) - (0.5*percent))




