library(stringr)
library(tidyverse)
library(shiny)
library(dplyr)
library(baseballr)
library(stringr)
library(plotly)
library(ggplot2)
library(fmsb)

bat20to42 <- read.csv("data/NegroLeagueBatters1920to1948.csv", quote = "", stringsAsFactors = FALSE)

bat20to42 <- bat20to42 %>% mutate(singles = X1B / PA)
bat20to42 <- bat20to42 %>% mutate(doubles = X2B / PA)
bat20to42 <- bat20to42 %>% mutate(triples = X3B / PA)
bat20to42 <- bat20to42 %>% mutate(home_runs = HR / PA)

new_bat20to42 <- bat20to42[,c(2,37,38,39,36)]

avg <- data.frame(Player = c("Average"), doubles = c(mean(new_bat20to42$doubles)), triples = c(mean(new_bat20to42$triples)), 
                  home_runs = c(mean(new_bat20to42$home_runs)), singles = c(mean(new_bat20to42$singles)))
rownames(avg) = c("Average")
new_bat20to42 <- rbind(avg, new_bat20to42)

max_min <- data.frame(
  Player = c("Max", "Min"), doubles = c(0.25, 0), triples = c(0.25, 0), home_runs = c(0.25, 0),  singles = c(0.25, 0)
)

rownames(max_min) <- c("Max", "Min")
new_bat20to42 <- rbind(max_min, new_bat20to42)
alt_bat20to42 <- new_bat20to42[,-1]
#josh_gibson <- alt_bat20to42[c("Max", "Min", 1), ]
radarchart(alt_bat20to42[c("Max", "Min", "Average", 1), ],
           pfcol = c("#99999980", NA),
           pcol = c(NA, 4), plty = 1,
           plwd = 2,
           title = "Josh Gibson")
