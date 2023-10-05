library(dplyr)
zzblastID.cur <- read.csv("data/zzblastID_swarm1_finaltax.csv")
ccblastID.cur <- read.csv("data/ccblastID_swarm1_finaltax.csv")

taxa_to_map0 = ccblastID.cur %>%
  bind_rows(zzblastID.cur) %>%
  mutate(bestmatch = case_when(ecotagmatch>bestblastmatch ~ ecotagmatch,
                               is.na(bestblastmatch) ~ ecotagmatch,
                               TRUE ~ bestblastmatch),
         finaltax = case_when(is.na(overrideID) ~ ecotagID,
                              overrideID == "" ~ ecotagID,
                              TRUE ~ overrideID)) %>%
  filter(bestmatch >= 0.98,
         !grepl(finaltax, pattern = "inae"),
         !grepl(finaltax, pattern = "atae"),
         !grepl(finaltax, pattern = "idae"),
         !grepl(finaltax, pattern = "oidea"),
         finaltax != "Arthropoda")

# making this dataframe to filter out the ones I already did manually
taxa_to_map_done <- taxa_to_map0 %>%
  filter(gbif == "OK") %>%
  select(finaltax, gbif) %>%
  distinct() %>%
  arrange(finaltax)

# filtering out the ones I already did manually
taxa_to_map1 <- taxa_to_map0 %>%
  select(finaltax) %>%
  distinct() %>%
  left_join(taxa_to_map_done) %>%
  arrange(finaltax) %>%
  filter(is.na(gbif)) %>%
  select(-gbif)

gbifid1 = taxize::get_gbifid(taxa_to_map1$finaltax[1:25])
gbifid2 = taxize::get_gbifid(taxa_to_map1$finaltax[26:50])
gbifid3 = taxize::get_gbifid(taxa_to_map1$finaltax[51:75])
gbifid4 = taxize::get_gbifid(taxa_to_map1$finaltax[76:100])
gbifid5 = taxize::get_gbifid(taxa_to_map1$finaltax[101:125])
gbifid6 = taxize::get_gbifid(taxa_to_map1$finaltax[126:150])
gbifid7 = taxize::get_gbifid(taxa_to_map1$finaltax[151:175])
gbifid8 = taxize::get_gbifid(taxa_to_map1$finaltax[176:200])
gbifid9 = taxize::get_gbifid(taxa_to_map1$finaltax[201:225])
gbifid10 = taxize::get_gbifid(taxa_to_map1$finaltax[226:250])
gbifid11 = taxize::get_gbifid(taxa_to_map1$finaltax[251:275])
gbifid12 = taxize::get_gbifid(taxa_to_map1$finaltax[276:300])
gbifid13 = taxize::get_gbifid(taxa_to_map1$finaltax[301:325])
gbifid14 = taxize::get_gbifid(taxa_to_map1$finaltax[326:350])
gbifid15 = taxize::get_gbifid(taxa_to_map1$finaltax[351:387])

d = function(x){as.data.frame(x)}
taxa_to_map2 <- rbind(d(gbifid1), d(gbifid2), d(gbifid3), d(gbifid4), d(gbifid5),
      d(gbifid6), d(gbifid7), d(gbifid8), d(gbifid9), d(gbifid10),
      d(gbifid11), d(gbifid12), d(gbifid13), d(gbifid14), d(gbifid15))

taxa_to_map <- taxa_to_map1 %>%
  bind_cols(taxa_to_map2)

# write.csv(taxa_to_map, "data/taxa_to_map.csv", row.names = F)
         