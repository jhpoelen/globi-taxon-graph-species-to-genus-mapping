#!/bin/bash
# script to extract likely species -> genus mappings in 
# GloBI's taxon graph
#
# Poelen, Jorrit H. (2022). Global Biotic Interactions: Taxon Graph (0.3.36) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.6394935
#

cat\
 <(echo scientificName)\
 <(curl "https://zenodo.org/record/6394935/files/taxonMap.tsv.gz"\
| gunzip\
| grep -P "\t[A-Z][a-z]*[ ][a-z]+\t.*\t[A-Z][a-z]+$"\
| cut -f2 | sort | uniq)\
> species-to-genus.txt

