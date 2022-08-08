library(tidyverse)

all_1920_48_qb <- read.csv("data/NegroLeagueBatters1920to1948.csv")
all_1920_48_qp <- read.csv("data/NegroLeaguePitchers1920to1948.csv")

bat_summary <- list()

bat_summary$num_observations <- nrow(all_1920_48_qb)
bat_summary$mean_pa <- mean(all_1920_48_qb$PA)
bat_summary$median_pa <- median(all_1920_48_qb$PA)
bat_summary$mean_ops <- mean(all_1920_48_qb$OPS)
bat_summary$median_ops <- median(all_1920_48_qb$OPS)

pitcher_summary <- list()

pitcher_summary$num_observations <- nrow(all_1920_48_qp)
pitcher_summary$mean_era <- mean(all_1920_48_qp$ERA)
pitcher_summary$median_era <- median(all_1920_48_qp$ERA)
pitcher_summary$mean_fip <- mean(na.omit(all_1920_48_qp$FIP))
pitcher_summary$median_fip <- median(na.omit(all_1920_48_qp$FIP))

