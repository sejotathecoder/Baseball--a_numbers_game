library(tidyverse)
library(plotly)
library(RColorBrewer)

all_1929_qb <- read.csv("data/1929AllQualBatters.csv")

all_1929_qb <- filter(all_1929_qb, all_1929_qb$PA > 10)
all_1929_qb <- filter(all_1929_qb, all_1929_qb$Name != "LgAvg per 600 PA")

all_ops_plot_29 <- ggplot(data = all_1929_qb, aes(OBP, SLG, col = Lg, label = Name)) + 
                   geom_point() + labs(x = "On-base percentage", y = "Slugging percentage", 
                                       title = "1929 major league batters, > 10 PA") 
all_ops_plotly_29 <- ggplotly(all_ops_plot_29)