# phylogenetics

This repository contains scripts for analyzing the phylogeny of protein domains, in this case the LysM carbohydrate-binding comain and the M23 metalloendopeptidase domain.

Pipeline:
1. Download proteins matching a certain domain structure from Interpro
2. Convert .tsv list of proteins into .RData
3. Get full phylogenetic lineage using taxid
4. Exclude proteins of the same length in the same taxid
5. Exclude proteins that don't have a genus listed
6. Stacked bar plots to compare prevalence of LysM domains in M23 endopeptidases by phylogeny
