# phylogenetics

This repository contains scripts for analyzing the phylogeny of protein domains, in this case the LysM carbohydrate-binding comain and the M23 metalloendopeptidase domain.

Pipeline:
1. Download proteins matching a certain domain structure from Interpro
2. Convert .tsv list of proteins into .RData
3. Get full phylogenetic lineage using taxid
4. Exclude proteins of the same length in the same taxid
5. Exclude proteins that don't have a genus listed
6. Bar plots to count number of proteins containing both LysM and M23 domains vs M23 only
7. Stacked bar plots to compare prevalence of LysM domains in M23 endopeptidases by phylogeny

![Screenshot 2025-04-02 at 10 18 07 PM](https://github.com/user-attachments/assets/6cdd4816-3fd2-4923-9f62-27046ff936f5)
