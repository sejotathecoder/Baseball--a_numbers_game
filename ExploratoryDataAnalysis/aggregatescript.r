library(tidyverse)

all_1920_48_qb <- read.csv("data/NegroLeagueBatters1920to1948.csv")
all_1920_48_qp <- read.csv("data/NegroLeaguePitchers1920to1948.csv")

all_1920_48_qb$over1000pa <- ifelse(all_1920_48_qb$PA > 1000, "over 1000 PA", "under 1000 PA")
all_1920_48_qp$over100g <- ifelse(all_1920_48_qp$G > 100, "over 100 G", "under 100 G")

bat_agg_df <- all_1920_48_qb %>% group_by(over1000pa) %>% summarise_at(vars(OPS),funs(mean(.,na.rm=TRUE)))
pitch_agg_df <- all_1920_48_qp %>% group_by(over100g) %>% summarise_at(vars(ERA),funs(mean(.,na.rm=TRUE)))
