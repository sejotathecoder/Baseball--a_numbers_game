library(tidyverse)
library(plotly)
library(fmsb)

negro_league_1920_48_pitching <- read.csv("data/NegroLeaguePitchers1920to1948.csv")
pitching_tri <- negro_league_1920_48_pitching[,c(2, 34, 35, 36)]

avg <- data.frame(Player = c("Average"), HR9 = c(mean(na.omit(pitching_tri$HR9))), BB9 = c(mean(pitching_tri$BB9)), SO9 = c(mean(pitching_tri$SO9)))
rownames(avg) <- c("Average")

pitching_tri <- rbind(avg, pitching_tri)

max_min <- data.frame(Player = c("Max", "Min"), HR9 = c(1.4, 0), BB9 = c(10.1, 1.1), SO9 = c(10.1, 1.3))
rownames(max_min) <- c("Max", "Min")

pitching_tri <- rbind(max_min, pitching_tri)
pitching_tri_2 <- pitching_tri[,-1]

radarchart(pitching_tri_2[c("Max", "Min", "Average", 11), ],
           pfcol = c("#99999980",NA),
           pcol= c(NA,2), plty = 1, plwd = 2,
           title = "Satchel Paige")
