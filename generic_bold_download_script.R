library(dplyr)
library(bold)
# if (!require("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
# 
# BiocManager::install("Biostrings")
library(Biostrings)
library(CHNOSZ)

###################################################################
# CUSTOMIZABLE SECTION  FOR OTHER TAXA AND PRIMERS:
###################################################################
# Define primers. This is the primer set from Fields et al. 2015.
# Fields, A. T., Abercrombie, D. L., Eng, R., Feldheim, K., & Chapman, D. D. 
# (2015). A novel mini-DNA barcoding assay to identify processed fins from 
# internationally protected shark species. PloS one, 10(2), e0114844.
primerF <- "AGATATTGGAACWTTATATTTTATTTTTGG"
primerR <- "WACTAATCAATTWCCAAATCCTCC"
expected_length <- 130:185
primerset_name <- "Zeale"

# Define taxon to query
taxon_to_query <- "Orthoptera"

# Define the directory where the taxonomy database will be created.
taxdir <- "../TAXO/"

###################################################################
###################################################################

# download taxonomy
# Get the taxonomy dump from NCBI if it does not exist locally yet

if (!file.exists(paste(taxdir,"nodes.dmp",sep=""))) {
  message("Downloading Taxonomy Dump file from NCBI")
  download.file("ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump.tar.gz",
                paste(taxdir,"taxdump.tar.gz",sep=""))
  untar(paste(taxdir,"taxdump.tar.gz",sep=""), exdir = taxdir)
  file.remove(paste(taxdir,"taxdump.tar.gz",sep=""))
}

# Load the taxo dump in the RAM
message("Now loading taxonomy database from ",taxdir)
taxonames <- getnames(taxdir)
taxonodes <- getnodes(taxdir)

message("Downloading sequences from Bold...")
b2 <- bold_seq(taxon=taxon_to_query) 
message("Now finding the taxids for ",nrow(b2)," sequences.")
message("Please be patient! This will take a while...")
if (length(b2)==0) {
  message("No sequences found in BOLD for this taxon: ",taxon_to_query)
  quit()
}

b <- b2 %>%
  select(id = processid, species_name = identification, sequence)
rm(b2)

b$taxid <- ""

showlines <- 10
for (i in 1:nrow(b)){
  x <- taxonames$id[taxonames$name==b$species_name[i] & taxonames$type=="scientific name"]
  b$taxid[i] <- ifelse(identical(x,numeric(0)),"NA",x)
  # Check if species name includes a "cf." in the middle and taxid exists when deleting it
  if (grepl(" cf. ",b$species_name[i])) {
    x <- taxonames$id[taxonames$name==gsub(" cf.","",b$species_name[i]) & 
                        taxonames$type=="scientific name"] 
    b$taxid[i] <- ifelse(identical(x,numeric(0)),"NA",x)
  }
  if (i %% showlines == 0) message(i,"/",nrow(b)," lines done. ","\r",appendLF = FALSE)
}


# Write the database with taxids
write.table(b, paste0("bold_db_",taxon_to_query,".csv"),row.names=F,sep=",")
message("File bold_db_", taxon_to_query, ".csv written with ",nrow(b)," sequences.")