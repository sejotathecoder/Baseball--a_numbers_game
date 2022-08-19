
home_page <- tabPanel("Home Plate",
                      mainPanel(
                        h1("Can we visualize Negro League statistics for the everyday reader?"),
                        img(src = "jackie.png"), align = "center",
                        br(),
                        data_summary_one <- print("The data we are using is from Baseball Reference, though it was compiled by Seamheads from
                      newspapers and other primary sources of the time. It is important to note that the data set is not complete by any
                      means, as box scores and record keeping were not as comprehensive in the Negro Leagues as they were for the
                      American and National Leagues. In addition, the Negro Leagues played many exhibition, barnstorming, and other
                      types of games that are not included in the data set. For this reason, our analysis leans toward per-game or
                      per-plate appearance stats more than total numbers."),
                        
                        br(),
                        
                        data_summary_two <- print("Our data includes all Negro League pitchers and position players from 1920 to 1948
                      (the period they have been designated major leagues by MLB) in the Baseball 
                      Reference database, with the aforementioned caveats. Our data set includes 
                      all hitters with at least 100 plate appearances (PA), and all pitchers who 
                      appeared in at least 10 games. The data set only includes the career stats 
                      each player put up while in the Negro Leagues (for instance, Jackie Robinson's 
                      statistics with the Dodgers are not included in the set)."),
                        
                        br(),
                        
                        summary <- print("This project is an attempt to highlight the Negro League players, giving them the appreciation
                                         they deserve based on their extraordinary careers.")
                      ),
                      
                      verbatimTextOutput(outputId = "data_summary_one"),
                      br(),
                      verbatimTextOutput(outputId = "data_summary_two"),
                      br(),
                      verbatimTextOutput(outputId = "summary"),
                      br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
                      br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
                      sliderInput("minPA", "Minimum PA",
                                  min = 100, max = 5405,
                                  value = 500),
                      plotlyOutput(outputId = "obp_slg_chart"),
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
                           each calculated with the raw statistic being divided by plate appearances. The variables 
                           represent the singles, doubles, triples, and home runs per plate appearance the selected 
                           hitter achieved in their career. The gray area, behind the blue-lined shape, symbolizes 
                           the Negro League average of each calculated stat."),
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
                             titlePanel("An overview of the datasets through player ranking"),
                             sidebarLayout(
                               sidebarPanel(
                                 selectInput("select_stat", label = h3("Choose a statistic to graph!"), 
                                             choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                                             selected = 1),
                                 
                                 hr(),
                                 fluidRow(column(3, verbatimTextOutput("value")))
                               )
                             ),
                             mainPanel(
                               plotOutput(outputId = "hr_summary"),
                               br(),
                               hr_summary <- print("The horizontal bar chart above shows the Negro Leaguers with the most home runs.
                                                   This bar chart is filtered to players that have hit over 70 home runs in their
                                                   career so the data would be viewable, as many players hit at least some home runs
                                                   during their career. This bar chart was organized so that the player with the most
                                                   home runs was at the top and designed such that the bar colors would be appealing
                                                   for the reader.")
                             )
)

ui <- navbarPage("Visualizing the Negro Leagues",
                 tags$head(
                   tags$link(rel = "stylesheet", type = "text/css", href = "project-style.css")
                 ),
                 setBackgroundImage(
                   src = "hinchliffe.jpg"
                 ),
                 home_page,
                 hitting_radar_page,
                 pitching_radar_page,
                 leaderboard_page
)