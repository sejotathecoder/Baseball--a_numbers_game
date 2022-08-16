library(tidyverse)
library(plotly)
library(fmsb)
library(shiny)

# Bringing hitting statistics in
processed_bats <- read.csv("data/processed_bats.csv")
just_batters <- processed_bats[4:867,]
bat_list <- setNames(as.numeric(just_batters$X), just_batters$Player)


home_page <- tabPanel("Home",
  
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",
  sidebarLayout(
    sidebarPanel(
      selectInput("hitter_select", label = h3("Select a hitter"),
                  choices = bat_list)
    )
  ),
  
  mainPanel()
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