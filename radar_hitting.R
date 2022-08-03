library(stringr)
library(tidyverse)
library(shiny)
library(dplyr)
library(baseballr)
library(stringr)
library(plotly)
library(ggplot2)
library(fmsb)

bat20to42 <- read.csv("~/Documents/Baseball--a_numbers_game/data/NegroLeagueBatters1920to1948.csv", quote = "", stringsAsFactors = FALSE)

PA <- PA %>% Batters1920to1942$PA > 100

rows <- nrow(albat_1929)
column <- ncol(albat_1929)
