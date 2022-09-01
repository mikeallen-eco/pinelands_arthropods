# This contains various scripts to assign higher taxonomic ranks
#    and also to format the trait databases

# Assigning orders to families or other taxa listed in "final_lowest"
# used the NCBI taxonomy to look up each family
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5887078/
#   
#   then added orders etc. using taxize

library(taxize)
library(dplyr)
library(readxl)

# set which arthropod.families database to use
tax_data_path <- "data/arthropod.families_20220831.xlsx"

# read in arthropod.families database
famlookup <- read_xlsx(tax_data_path, 
                       sheet = "arthropod.families") %>%
  select(final_lowest, 
         final_ID = 'final species_name',
         family:kingdom) %>%
  distinct()

#### adding higher taxa

# add orders to the lowest taxa rank based on NCBI database
full_taxa_lookup <- taxize::tax_name(sci = unique(famlookup$final_lowest), 
                   get = c("family", "order", "class", 
                           "phylum", "kingdom"), 
                   db = "ncbi")


# make new columns for the "arthropod.families" database

# read in family name look up 
# will use to match each OTU with an NCBI family name
# lowest rank assigned by looking up each entry in NCBI if it didn't 
# have a name yet from bioinformatics work
full_taxa_lookup2 <- read_xlsx(tax_data_path, 
                       sheet = "arthropod.families") %>%
  select(final_lowest, final_ID = 'final species_name') %>%
  left_join(rename(full_taxa_lookup, final_lowest = query)) %>%
  select(-db)

write.csv(full_taxa_lookup2, "data/arthropod.higher.taxa.lookup3.csv",
          row.names = F)


#######
### getting families that are unique to the 'substrate compare' study
#######

# 1st run the initial code chunk in 'pinelands_arthropods_2methods.Rmd'
# that loads the 'size' object
    #which lists the 177 arthropod families from the primary study

unique(size$family)
'%notin%' <- Negate('%in%')

# get list of all families (both studies)
all_fams = full_taxa_lookup2 %>%
  filter(phylum == "Arthropoda",
         family != "NA",
         is.na(family)==F) %>%
  select(family) %>%
  distinct()

# get trait info from ITT
trait <- read.csv("data/insect_trait_tool.csv", skip = 1)

# subset just the families from substrate compare'
# and add ITT trait info where available
just_sub <- all_fams %>%
  filter(family %notin% size$family) %>%
  left_join(distinct(select(full_taxa_lookup2, 
                            family, order, class))) %>%
  left_join(trait)


write.csv(just_sub, "data/just_sub_families.csv", row.names = F)
