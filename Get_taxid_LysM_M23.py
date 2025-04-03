
# in terminal, type "cd "/Users/me/Documents/Doerr Lab/LysM manuscript/Python scripts to get lineage""
# then type "source env/bin/activate"
# then type "python" to get into the python interactive shell

from ete3 import NCBITaxa
import pandas as pd
import pyreadr
import pickle

ncbi = NCBITaxa()

# Import list of proteins containing LysM + M23 domains
LysM_M23 = pyreadr.read_r("/Users/me/Documents/Doerr Lab/LysM manuscript/LysM_M23.Rdata")

LysM_M23 = LysM_M23["LysM_M23"]

# Check that the import worked by viewing the first row
LysM_M23.head(1)

# Make species list
taxids = list(LysM_M23.taxid)

def loadTaxonomyLineage(taxids):

    tax_ranks = ['superkingdom','phylum','class','order','family','genus','species']
        
    taxs = []

    for taxid in taxids:
        try:
            lineage = ncbi.get_lineage(int(taxid))
            name_dict = ncbi.get_taxid_translator(lineage)
            rank_dict = ncbi.get_rank(lineage)
            lineage_dict = dict((rank_dict[i],name_dict[i]) for i in lineage)
        
            lineage_dict = {k:lineage_dict[k] for k in tax_ranks if k in lineage_dict}
            
            lineage_dict['taxid'] = taxid
                
            taxs.append(lineage_dict)
                
        except ValueError as e:
            print('Warning: {0}'.format(str(e)))
                
    return pd.DataFrame(taxs)

taxid_mapper = loadTaxonomyLineage(taxids)

# Display 
#taxid_mapper #(comment this out when it's time to save to .csv)

# Print saveable output
csv_data = taxid_mapper.to_csv(header = ['superkingdom','phylum','class','order','family','genus','species','taxid'])
print(csv_data)

# To save:
# Open a terminal window, type "cd "/Users/me/Documents/Doerr Lab/LysM manuscript""
# Type "source env/bin/activate"
# Type "python3 Get_taxid.py > taxid_LysM_M23.csv"


# Then append this to the side of the original Rdata file so that the taxids match
# Or graph directly in Python
