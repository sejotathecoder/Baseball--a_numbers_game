library(tidyverse)
library(plotly)
library(fmsb)

negro_league_1920_48_pitching <- read.csv("data/NegroLeaguePitchers1920to1948.csv")
pitching_tri <- negro_league_1920_48_pitching[,c(2, 34, 35, 36)]

max_min <- data.frame(Player = c("Max", "Min"), HR9 = c(1.4, 0), BB9 = c(10.1, 1.1), SO9 = c(10.1, 1.3))
rownames(max_min) <- c("Max", "Min")

pitching_tri <- rbind(max_min, pitching_tri)
pitching_tri_2 <- pitching_tri[,-1]

radarchart(pitching_tri_2[c("Max", "Min", 11), ], pcol = "#7fc97f", pfcol = "#7fc97f", title = "Satchel Paige")
