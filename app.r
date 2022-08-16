library(tidyverse)
library(plotly)
library(fmsb)
library(shiny)

home_page <- tabPanel("Home",
  
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",

)

pitching_radar_page <- tabPanel("Pitching Radar Charts",

)

leaderboard_page <- tabPanel("Leaderboards",

)

ui <- navbarPage("Visualizing the Negro Leagues",
    home_page,
    hitting_radar_page,
    pitching_radar_page,
    leaderboard_page
)
  
server <- function(input, output){
  
} 
  
shinyApp(ui = ui, server = server)