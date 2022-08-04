library(tidyverse)

all_1920_48_qb <- read.csv("data/NegroLeagueBatters1920to1948.csv")
all_1920_48_qp <- read.csv("data/NegroLeaguePitchers1920to1948.csv")

bat_summary <- summary(all_1920_48_qb)
pitcher_summary <- summary(all_1920_48_qp)
