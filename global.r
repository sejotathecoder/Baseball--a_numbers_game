library(tidyverse)
library(plotly)
library(fmsb)
library(shiny)
library(shinyWidgets)


# Bringing hitting statistics in
hitting <- readRDS("data/hitting.rds")
hitting[549, 1] = "Bobby Robinson*"
hitting[409, 1] = "Frank Duncan*"
hitting[823, 1] = "Jack Marshall*"
hitting[774, 1] = "Willie Wells*"
hitting_2 <- hitting[, -1]
rownames(hitting_2) <- hitting[, 1]
bat_list <- filter(hitting, Player != "Max" & Player != "Min" & Player != "Average")

# including pitching stats
pitching <- readRDS("data/pitching.rds")
pitching[349, 1] = "Roy Williams*"
pitching[330, 1] = "Tommy Johnson*"
pitching_2 <- pitching[, -1]
rownames(pitching_2) <- pitching[, 1]
just_pitching <- filter(pitching, Player != "Max" & Player != "Min" & Player != "Average")

# Including hr_leaderboard statistics
nlbat20to48 <- read_csv("data/NegroLeagueBatters1920to1948.csv")
hr <- nlbat20to48[,c(1,2,16)]
hr <- filter(hr, HR > 70)

# Including on-base percentage / slugging interactive visualization data set & filter
all_1920_48_qb <- read.csv("data/NegroLeagueBatters1920to1948.csv")
all_1920_48_qb <- arrange(all_1920_48_qb, PA)
