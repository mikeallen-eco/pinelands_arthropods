# Using surface eDNA and metabarcoding to sample for arthropods
The purpose of this repository is to provide code and data to reproduce the analyses, tables, and figures in the manuscript: "Using surface environmental DNA to assess arthropod biodiversity within a forested ecosystem" (Allen et al., 2023). 

The published version will be:
Allen, M. C., Lockwood, J. L., Kwait, R., Vastano, A., Peterson, D. L. Tkacenko, L. A., … Jaffe, B. D. (2023). Using surface environmental DNA to assess arthropod biodiversity within a forested ecosystem. Environmental DNA.

The archived version of this code is at OSF: https://doi.org/0.17605/OSF.IO/92VDR

# List of files

/
Script & project files in the main folder
1. pinebugs_analysis_final.Rmd - re-create the analyses, tables, and figures in the manuscript
2. pinebugs_post_process_final.Rmd - create the final MOTU data files used in the previous script
3. process_blast.Rmd - code to create fasta file for BLAST analysis, and to recombine results
4. pinelands_arthropods.Rproj - double click on this file to open the R Project in RStudio

/data
Files in the data folder referenced in pinebugs_analysis_final.Rmd

1. pinebugs.samples.onlyarth.negsub.Z_allMOTUs.csv - final filtered MOTU table with taxonomy (COI). File was created using the pinebugs_post_process_final.Rmd script.
2. pinebugs.samples.onlyarth.negsub.C_allMOTUs.csv - final filtered MOTU table with taxonomy (16S). File was created using the pinebugs_post_process_final.Rmd script.
3. lifemode.csv - a table classifying each family by life mode (terrestrial/aquatic)
4. diet.csv - a table classifying each family by diet/feeding guild
5. size.csv - a table classifying each family by body size
6. pinebugs.samples.step2.negsub.swarm1.Z_allMOTUs.csv - MOTU table after removal of humans/mice and subtraction of negatives, but before removal of other non-Arthropods.  File was created using the pinebugs_post_process_final.Rmd script. (COI)
7. pinebugs.samples.step2.negsub.swarm1.C_allMOTUs.csv - MOTU table after removal of humans/mice and subtraction of negatives, but before removal of other non-Arthropods.  File was created using the pinebugs_post_process_final.Rmd script. (16S)
8. family_commons.csv - a lookup table of common names for each family (where available via the taxize package). 
9. [ncbi.bold.art.hum.mus.may23.pcr.pga.tax.uni.cln.C.tsv - curated reference database for 16S. File is only included in the Open Science Framework archive, not GitHub, as it is large. https://doi.org/0.17605/OSF.IO/92VDR]
10. [ncbi.bold.art.hum.mus.may23.pcr.pga.tax.uni.cln.Z.tsv - curated reference database for COI. File is only included in the Open Science Framework archive, not GitHub, as it is large. https://doi.org/0.17605/OSF.IO/92VDR]

Files in the data folder referenced in pinebugs_post_process_final.Rmd

1. merged.uni.c10.l130.L185.sht.srt.nochi.1line.swarm1.fix.tag.ann.srt.Z.tsv - final ecotag output for COI sequences
2. merged.uni.c10.l130.L185.sht.srt.nochi.1line.swarm1.Z_output.counts.csv - final raw MOTU table (before post processing) for COI sequences
3. merged.uni.c10.l75.L125.sht.srt.nochi.1line.swarm1.fix.tag.ann.srt.C.tsv - final ecotag output for 16S sequences
4. merged.uni.c10.l75.L125.sht.srt.nochi.1line.swarm1.C_output.counts.csv - final raw MOTU table (before post processing) for 16S sequences
5. zzblastID_swarm1_finaltax_allMOTUs.csv - final manually curated taxonomy for each COI MOTU (note: in this file, no adjustments have yet been made based on percent match; that is done in the post-processing script.)
6. ccblastID_swarm1_finaltax_allMOTUs.csv - final manually curated taxonomy for each 16S MOTU (note: in this file, no adjustments have yet been made based on percent match; that is done in the post-processing script.)
7. full_tax_lookup.csv - A lookup table to add higher taxonomy (families, orders, etc.) to MOTU table. File was created using the /scripts/add_higher_taxa.R script.

/output
These .rds files store model output that is referenced in the pinebugs_analysis_final.Rmd.