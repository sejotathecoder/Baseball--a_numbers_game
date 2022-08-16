library(tidyverse)
library(plotly)
library(fmsb)
library(shiny)

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

home_page <- tabPanel("Home Plate",
                      mainPanel(
                        h2("Can we visualize Negro League statistics for the everyday reader?"),
                        img(src='jackie.png', align = "center"),
                        ### the rest of your code
                      ),
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",
  sidebarLayout(
    sidebarPanel(selectInput("hitter_select", label = h3("Select a hitter"),
                              choices = bat_list)
    ),
                                 
    mainPanel(
      plotOutput(outputId = "hitting_plot")
    )
  )
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
  output$hitting_plot <- renderPlot({
    radarchart(hitting_2[c("Max", "Min", "Average", input$hitter_select), ],
               pfcol = c("#99999980", NA),
               pcol = c(NA, 4), plty = 1,
               plwd = 2,
               title = input$hitter_select)
  })
  
  output$pitching_plot <- renderPlot({
    radarchart(pitching_2[c("Max", "Min", "Average", input$pitchers), ],
             pfcol = c("#99999980",NA),
             pcol= c(NA,2), plty = 1, plwd = 2,
             title = input$pitchers)
  })
}
  
shinyApp(ui = ui, server = server)