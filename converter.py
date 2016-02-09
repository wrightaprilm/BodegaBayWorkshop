#!/usr/bin/env python
import dendropy
from dendropy import Tree, TaxonSet
import os
import sys
import glob 

#Usage: python converter.py 'path to files' 'format of input files' 'format you'd like exported'
file_list = glob.glob(sys.argv[1])

for file in file_list:
	print(file)
	data = dendropy.DnaCharacterMatrix.get(path=file, schema = sys.argv[2])	
	new_file = file + 'phy'
	data.write_to_path(new_file, sys.argv[3], force_unique_taxon_labels=False,spaces_to_underscores=True)
