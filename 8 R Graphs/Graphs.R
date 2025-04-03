
# Make graphs

# Open clean_proteins
# Open counts

# Graph at each level (superkingdom etc)

# Graphing
ggplot(data, aes(x = class)) +
  geom_bar() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Copies of M23 endopeptidases without LysM domains") +
  ylim(0,25000)