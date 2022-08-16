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
                        h1("Can we visualize Negro League statistics for the everyday reader?"),
                        imageOutput("jackie"),
                        ### the rest of your code
                      ),
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",
  titlePanel("Negro League Hitters: Radar Chart"),
  sidebarLayout(
    sidebarPanel(selectInput("hitter_select", label = h3("Select a hitter"),
                              choices = bat_list)
    ),
                                 
    mainPanel(
      plotOutput(outputId = "hitting_plot"),
      hit_summary <- print("This radar chart is pretty straightforward. There are 4 variables shown,
                           each calculated with the raw statistic being divided by plate appearances
                           (completed at bats - regardeless of outcome). The variables represent the average number of
                           singles, doubles, triples, and home runs the selected hitter achieved in their career.
                           The gray area, behind the blue-lined shape, symbolizes the Negro League average of each calculated stat."),
      verbatimTextOutput(outputId = "hit_summary")
    )
  )
)

pitching_radar_page <- tabPanel("Pitching Radar Charts",
  titlePanel("Negro League Pitchers: Radar Chart"),
  sidebarLayout(
    sidebarPanel(
      selectInput("pitchers", label = h3("Select a pitcher"), 
                  choices = just_pitching$Player)
    ),
    mainPanel(
      plotOutput(outputId = "pitching_plot"),
      pitch_summary <- print("This radar chart shows three statistics (SO/9, BB/9, and HR/9). SO/9 represents the average number
                             of strikeouts the selected pitcher has per 9 innings (the higher the better). The BB/9 statistic
                             shows the average number of walks a pitcher will have per 9 innings (the lower the better), and the
                             HR/9 stat represents, on average, how many home runs this pitcher will give up per 9 innings
                             (the lower the better). The gray area, behind the red-lined triangle, symbolizes the Negro League average
                             of each calculated stat"),
      verbatimTextOutput(outputId = "pitch_summary")
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