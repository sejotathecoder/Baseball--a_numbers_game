library(tidyverse)
library(plotly)
library(fmsb)
library(shiny)

# Bringing hitting statistics in
#processed_bats <- read.csv("data/processed_bats.csv")
#just_batters <- processed_bats[4:867,]
#bat_list <- setNames(as.numeric(just_batters$X), just_batters$Player)

# including pitching stats
pitching <- readRDS("data/pitching.rds")
pitching[349, 1] = "Roy Williams*"
pitching[330, 1] = "Tommy Johnson*"
pitching_2 <- pitching[, -1]
rownames(pitching_2) <- pitching[, 1]
just_pitching <- filter(pitching, Player != "Max" & Player != "Min" & Player != "Average")

home_page <- tabPanel("Home Plate",
                      mainPanel(
                        h2("Can we visualize Negro League statistics for the everyday reader?"),
                        img(src='jackie.png', align = "center"),
                        ### the rest of your code
                      ),
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",

)

pitching_radar_page <- tabPanel("Pitching Radar Charts",
  titlePanel("Negro League Pitchers radar chart"),
  sidebarLayout(
    sidebarPanel(
      selectInput("pitchers", label = h3("Select a pitcher"), 
                  choices = just_pitching$Player)
    ),
    mainPanel(
      plotOutput(outputId = "pitching_plot")
    )
  )
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
  output$pitching_plot <- renderPlot({
    radarchart(pitching_2[c("Max", "Min", "Average", input$pitchers), ],
             pfcol = c("#99999980",NA),
             pcol= c(NA,2), plty = 1, plwd = 2,
             title = input$pitchers)
})}
  
shinyApp(ui = ui, server = server)