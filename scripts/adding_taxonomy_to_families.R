# Assigning orders to families
# used the NCBI taxonomy to look up each family
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5887078/
#   
#   then added orders etc. using taxize
# 
# Then added "niche" trait data by family from the database in this pre-print:
#   https://doi.org/10.1101/2022.01.25.477751
# 
# And size info from:
#   https://opentraits.org/datasets/arthropod-species-traits
# https://www.doi.org/10.1038/sdata.2015.13
# https://datadryad.org/stash/dataset/doi:10.5061/dryad.53ds2

library(taxa)
fam <- read.csv("data/arthropod.families.20220708.csv")
trait <- read.csv("data/insect_trait_tool.csv", skip = 1)
size <- read.csv("data/arthropod_size_db.csv") %>%
  group_by(Order, Family) %>%
  # there are no NA Body Sizes FYI
  summarize(size_min = min(Body_Size),
            size_max = max(Body_Size),
            size_avg = mean(Body_Size),
            size_n = length(Body_Size)) %>%
  rename(family = Family)

size_guild <- read.csv("data/arthropod_size_db.csv") %>%
  group_by(Order, Family, Feeding_guild) %>%
  tally() %>%
  select(family = Family, Feeding_guild)

size_guild1 <- table(size_guild$family, 
                     size_guild$Feeding_guild)
size_guild2 = matrix(size_guild1,
                     nrow = 96, ncol = 13) %>%
  as.data.frame()

size_guild3 <- size_guild2 %>%
  mutate(family = rownames(size_guild1))

colnames(size_guild3) <- c(colnames(size_guild1), "family")


(ncbi <- tax_db(
  name = "ncbi",
  url = "http://www.ncbi.nlm.nih.gov/taxonomy",
  description = "NCBI Taxonomy Database",
  id_regex = "*"
))

fam2 <- unique(fam$final_family)[is.na(unique(fam$final_family))==F]

# Convert a taxonomy object to a taxon vector
x <- taxonomy(taxon(name = fam2,
                    rank = rep(c('family'), 182),
                    db = 'ncbi'))

test=supertaxa(x)

library(taxize)
library(dplyr)

# add orders to the family names based on NCBI database
# takes a long time
orders <- tax_name(sci = fam2, 
                   get = c("order", "class"), db = "ncbi")


orders2 <- orders %>%
  rename(family = query) %>%
  left_join(trait, by = "family") %>%
  select(-33) %>%
  # excludes 2 salamanders, 1 bat, 3 gastropods, 1 worm, and 2 unknown
  filter(class %in% c("Insecta", "Arachnida", 
                      "Chilopoda", "Collembola")) %>%
  arrange(class, order, family) %>%
  left_join(size, by = "family") %>%
  left_join(size_guild3, by = "family")

write.csv(orders2, "data/arthropod.families.traits.csv",
          row.names = F)
