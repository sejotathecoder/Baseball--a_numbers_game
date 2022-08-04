library(tidyverse)
library(plotly)
library(RColorBrewer)

all_1920_48_qb <- read.csv("data/NegroLeagueBatters1920to1948.csv")
all_1920_48_qb <- arrange(all_1920_48_qb, PA)

all_ops_plot_2048 <- ggplot(data = all_1920_48_qb, aes(OBP, SLG, col = PA, label = Player)) + 
                   geom_point(aes(size = PA)) + labs(x = "On-base percentage", y = "Slugging percentage", 
                                       title = "1920 to 1942 Negro league batters, > 100 PA") 
all_ops_plotly_2048 <- ggplotly(all_ops_plot_2048)
all_ops_plotly_2048
