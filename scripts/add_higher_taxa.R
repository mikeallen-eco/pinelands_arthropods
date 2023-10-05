### script to add higher taxa categories (family, order, class, etc.) to final ID's
### note: this script is a patchwork due to many iterations & revisions, etc.
# It is broken up into batches as it sometimes throws an error midway and requires starting over. Note: you may need API key to run this; follow taxize instructions to do so.

library(taxize) # taxize_0.9.100

# #### adding higher taxa 
# (first subsetting the taxa with >80% bestmatch for historical reasons)
# (i.e., I did it this way originally and then went back and did those < 80%)
ccfin80plus <- cc_fin %>%
  filter(ecotagmatch >= 0.8)
zzfin80plus <- zz_fin %>%
  filter(ecotagmatch >= 0.8)

taxlistfull <- sort(unique(c(ccfin80plus$finaltax, zzfin80plus$finaltax)))
taxlist1 <- taxlistfull[1:50]
# add taxonomy to the lowest taxa rank based on NCBI database
full_tax_lookup1 <- taxize::tax_name(sci = taxlist1,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup1, "data/full_tax_lookup1.csv", row.names = F)

taxlist2 <- taxlistfull[51:100]
# add taxonomy to the lowest taxa rank based on NCBI database
full_tax_lookup2 <- taxize::tax_name(sci = taxlist2,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup2, "data/full_tax_lookup2.csv", row.names = F)

taxlist3 <- taxlistfull[101:150]
# add taxonomy to the lowest taxa rank based on NCBI database
full_tax_lookup3 <- taxize::tax_name(sci = taxlist3,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup3, "data/full_tax_lookup3.csv", row.names = F)

taxlist4 <- taxlistfull[151:200]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup4 <- taxize::tax_name(sci = taxlist4,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup4, "data/full_tax_lookup4.csv", row.names = F)

taxlist5 <- taxlistfull[201:250]
# add orders to the lowest taxa rank based on NCBI database
full_tax5_lookup5 <- taxize::tax_name(sci = taxlist5,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax5_lookup5, "data/full_tax_lookup5.csv", row.names = F)

taxlist6 <- taxlistfull[251:300]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup6 <- taxize::tax_name(sci = taxlist6,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup6, "data/full_tax_lookup6.csv", row.names = F)

taxlist7 <- taxlistfull[301:350]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup7 <- taxize::tax_name(sci = taxlist7,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup7, "data/full_tax_lookup7.csv", row.names = F)

taxlist8 <- taxlistfull[351:400]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup8 <- taxize::tax_name(sci = taxlist8,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup8, "data/full_tax_lookup8.csv", row.names = F)

taxlist9 <- taxlistfull[401:450]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup9 <- taxize::tax_name(sci = taxlist9,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup9, "data/full_tax_lookup9.csv", row.names = F)

taxlist10 <- taxlistfull[451:500]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup10 <- taxize::tax_name(sci = taxlist10,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup10, "data/full_tax_lookup10.csv", row.names = F)

taxlist11 <- taxlistfull[501:550]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup11 <- taxize::tax_name(sci = taxlist11,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup11, "data/full_tax_lookup11.csv", row.names = F)

taxlist12 <- taxlistfull[551:600]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup12 <- taxize::tax_name(sci = taxlist12,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup12, "data/full_tax_lookup12.csv", row.names = F)

taxlist13 <- taxlistfull[601:650]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup13 <- taxize::tax_name(sci = taxlist13,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup13, "data/full_tax_lookup13.csv", row.names = F)

taxlist14 <- taxlistfull[651:700]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup14 <- taxize::tax_name(sci = taxlist14,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup14, "data/full_tax_lookup14.csv", row.names = F)

taxlist15 <- taxlistfull[701:779]
# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup15 <- taxize::tax_name(sci = taxlist15,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup15, "data/full_tax_lookup15.csv", row.names = F)

# make a taxlist just for those MOTUs with bestmatches of < 80%

cc_fin80 <- cc_fin %>%
  filter(ecotagmatch < 0.8,
         finaltax %notin% taxlistfull)
zz_fin80 <- zz_fin %>%
  filter(ecotagmatch < 0.8,
         finaltax %notin% taxlistfull)
taxlist80 <- sort(unique(c(cc_fin80$finaltax, zz_fin80$finaltax)))

taxlist16 <- taxlist80
add orders to the lowest taxa rank based on NCBI database
full_tax_lookup16 <- taxize::tax_name(sci = taxlist16,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup16, "data/full_tax_lookup16.csv", row.names = F)

# and one more round of additions
taxlistrev <- unique(c("Atherigona", "Cerodontha", "Hydrelia", "Lygephila dorsigera", 
                       "Meromyza", "Paralimna", "Peckia", "Phanaeus", "Rusticoclytus", 
                       "Schoettella", "Scolothrips takahashii", "Serratella", "Sitona", 
                       "Xylosciara", "Heterocaecilius", "Stilbus", "Thecturota"))

# add orders to the lowest taxa rank based on NCBI database
full_tax_lookup17 <- taxize::tax_name(sci = taxlistrev,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup17, "data/full_tax_lookup17.csv", row.names = F)


taxlist18 <- c("Paralimna concors", "Lepidoptera", "Cerodontha fulvipes",
"Serratella ignita", "Sitona obsoletus", "Sarcophagidae", "Barypeithes araneiformis",
"Xylosciara inornata", "Rusticoclytus rusticus", "Oryctes rhinoceros",
"Schoettella ununguiculata", "Thecturota marchii")
# # add orders to the lowest taxa rank based on NCBI database
full_tax_lookup18 <- taxize::tax_name(sci = taxlist18,
                   get = c("species", "genus", "family", "order", "class",
                           "phylum", "kingdom"),
                   db = "ncbi")
write.csv(full_tax_lookup18, "data/full_tax_lookup18.csv", row.names = F)

# combine them all together
full_taxa_lookup <- read.csv("data/full_tax_lookup1.csv") %>%
  bind_rows(read.csv("data/full_tax_lookup2.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup3.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup4.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup5.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup6.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup7.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup8.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup9.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup10.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup11.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup12.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup13.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup14.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup15.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup16.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup17.csv")) %>%
  bind_rows(read.csv("data/full_tax_lookup18.csv")) %>%
  # filter(!is.na(kingdom)) %>%
  rename(finaltax = query)

# write the combined taxa lookup table to a csv file
# write.csv(full_taxa_lookup, "data/full_tax_lookup.csv", row.names = F)