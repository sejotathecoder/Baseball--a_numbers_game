library(tidyverse)
library(plotly)

mlb_1920_42 <- read.csv("data/Batters1920to1942.csv")
mlb_1920_42 <- filter(mlb_1920_42, PA > 100)
mlb_1920_42 <- filter(mlb_1920_42, SB > 20 || HR > 20)
mlb_1920_42 <- mlb_1920_42 %>% mutate(SBperG = (SB / G))
mlb_1920_42 <- mlb_1920_42 %>% mutate(HRperPA = (HR / PA))

power_speed_plot <- ggplot(data = mlb_1920_42, aes(SBperG, HRperPA, label = Player)) +
                    geom_point(aes(size = PA)) + labs(x = "Stolen bases per game", 
                                                      y = "Home runs per plate appearance", 
                                                      title = "Power and speed")
power_speed_plotly <- ggplotly(power_speed_plot)
power_speed_plotly
