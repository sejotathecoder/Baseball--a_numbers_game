library(tidyverse)
library(shiny)
library(baseballr)
library(plotly)
library(fmsb)
library(readr)

nlbat20to48 <- read_csv("Documents/Baseball--a_numbers_game/data/NegroLeagueBatters1920to1948.csv")

hr <- nlbat20to48[,c(1,2,16)]
hr <- filter(hr, HR > 70)
#hr2 <- hr
#hr2$Player <- factor(hr2$Player, levels = hr2$Player[order(hr2$Player)])

#png(file = "barchart_nl_homeruns.png")

hr_leaderboard <- ggplot(hr, aes(x = reorder(Player, HR), y = HR)) + geom_bar(stat = "identity", width = 0.5, color = "cadetblue", 
    fill = "chocolate1") + theme_gray() + coord_flip() + labs(y = "Home Runs", x = "Players")
hr_leaderboard
