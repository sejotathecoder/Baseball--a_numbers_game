
home_page <- tabPanel("Home Plate",
                      fluidPage(
                        fluidRow(
                          titlePanel("How can we understand the accomplishments of the Negro Leaguers?"),
                          h4(em("By CJ Piccio and Collin Pucher"), style = "color:black"),
                          column(4,
                            img(src = "jackie.png")
                          ),
                          column(7, offset = 1, style = "background: rgba(255, 255, 255, 0.5)",
                            p("We both come from a background with an appreciation for the game of baseball, 
                              and in particular, the Negro Leagues. Stories like Satchel Paige telling his 
                              outfielders to sit down as he would strike batters out or Josh Gibson's fabled 
                              home run in Pittsburgh that never came down help to illuminate the legend and 
                              superhuman talents of the leagues, but spotty statistical records have long 
                              kept the leagues just legend for many who weren't fortunate enough to see them 
                              in real life. ", style = "color:black; opacity: 1"),
                            p("Following decades of research and lobbying by organizations like the Seamheads 
                              Negro League Database, in December 2020 Major League Baseball officially designated 
                              six Negro Leagues from 1920 to 1948 as having \"Major League\" status, elevating them 
                              to the same status as the American and National Leagues of the same time period. 
                              Most importantly from a data science perspective, this also meant that going forward 
                              Negro League statistics and records from the time period would be included with 
                              MLB statistics and not relegated to their own category. Following this decision, 
                              in June 2021 leading online baseball almanac Baseball Reference updated its 
                              database to include Negro League statistics, making them more accessible and more 
                              comparable to non-Negro League statistics.", style = "color:black; opacity: 1"),
                            p("Negro Leagues Baseball Museum co-founder Larry Lester told the New York Times that 
                              “The beauty of these stats is that they now humanize these folk heroes, and they’re 
                              no longer mythical figures like Paul Bunyan or the steel-driving John Henry. These 
                              stats legitimize their accomplishments.” Following this line of thinking, with this 
                              project, we would like to use these statistics to further humanize and appreciate 
                              the greatness of these players.", style = "color:black; opacity: 1")
                          )
                        ),
                        br(),
                        fluidRow(
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("minPA", "Minimum PA",
                                          min = 100, max = 5405,
                                          value = 500),
                              style = "background: rgba(255, 255, 255, 0.5)"
                            ),
                            mainPanel(
                              style = "background: rgba(255, 255, 255, 0.5)",
                              plotlyOutput(outputId = "obp_slg_chart")
                            )
                          )
                        ),
                        br(),
                        fluidRow(
                          style = "background: rgba(255, 255, 255, 0.5)",
                          p("One of the greatest baseball managers of all time, Earl Weaver of the Baltimore Orioles, 
                          famously said \"your most precious possessions on offense are your 27 outs.\" On-base percentage 
                          (OBP) is a useful statistic because it measures a hitter's ability to avoid an out. It is superior 
                          to earlier statistics like batting average because it factors in a batter's ability to draw walks."),

                          p("OBP was made famous by Michael Lewis's 2003 book Moneyball (later adapted into a movie), which 
                          chronicled the 2002 Oakland Athletics and their data-driven quest to build a competitive roster with 
                          a much lower payroll than other MLB teams. In a memorable scene from the movie, Brad Pitt, playing 
                          general manager Billy Beane, describes why he pursues certain players to the older, less data-driven 
                          scouts who don't understand. Over their objections to superficial factors like weight or off-field 
                          issues, Beane simply states, \"He gets on-base.\""),

                          p("Here is an interactive visual of OBP on the X-axis and slugging percentage (SLG) (essentially a 
                          measure of power) on the Y-axis for Negro Leaguers from 1920 to 1948 with at least 100 plate appearances.")
                        )
                      )
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",
                               titlePanel("Negro League Hitters: Radar Chart"),
                               sidebarLayout(
                                 
                                 sidebarPanel(
                                   style = "background: rgba(255, 255, 255, 0.5)",
                                   selectInput("hitter_select", label = h3("Select a hitter"),
                                                          choices = bat_list)
                                 ),
                                 
                                 mainPanel(
                                   style = "background: rgba(255, 255, 255, 0.5)",
                                   tabsetPanel(
                                      tabPanel("Radar Chart", plotOutput(outputId = "hitting_plot")),
                                      tabPanel("Table", tableOutput(outputId = "hitting_table"))
                                   ),
                                   p(em("Suggested players to view: Josh Gibson, Oscar Charleston, Bullet Rogan, 
                                        Turkey Stearnes, Willard Brown, Mule Suttles")),
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
                                    style = "background: rgba(255, 255, 255, 0.5)",
                                    selectInput("pitchers", label = h3("Select a pitcher"), 
                                                choices = just_pitching$Player, selected = "Satchel Paige")
                                  ),
                                  mainPanel(
                                    style = "background: rgba(255, 255, 255, 0.5)",
                                    tabsetPanel(
                                      tabPanel("Radar Chart", plotOutput(outputId = "pitching_plot")),
                                      tabPanel("Table", tableOutput(outputId = "pitching_table"))
                                    ),
                                    p(em("Suggested players to view: Satchel Paige, Bill Foster, Bullet Rogan, 
                                         Ray Brown, Hilton Smith")),
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
                                 sliderInput("minHR", "Minimum HR",
                                             min = 30, max = 180,
                                             value = 70),
                                 hr(),
                                 style = "background: rgba(255, 255, 255, 0.5)",
                               ),
                               mainPanel(
                                style = "background: rgba(255, 255, 255, 0.5)",
                                plotOutput(outputId = "hr_summary"),
                                br(),
                                hr_summary <- print("The interactive horizontal bar chart above shows the Negro Leaguers with the
                                                   most home runs. This bar chart can be filtered up to the users discrection with
                                                   the slider on the left side of the page. This bar chart was organized so that the
                                                   player with the most home runs was at the top and designed such that the bar colors
                                                   would be appealing for the reader.")
                              )
  )
)

end_page <- tabPanel("Conclusion",
                     fluidPage(
                       style = "background: rgba(255, 255, 255, 0.5)",
                       titlePanel("A summary of our project and insights of our data-based conclusions"),
                       
                       p("With today’s baseball stars like Shohei Ohtani, Aaron Judge, Julio Rodriguez, 
                       Mike Trout, and others, one does not need to look far to understand their 
                       greatness. One can watch their games on television, their highlights on 
                       YouTube, or even dive deeper into their statistics on Baseball Reference or 
                       Baseball Savant. For the Negro Leaguers, much of that does not exist. The 
                       legends and stories have lived on, but very little video exists. Although 
                       they are incomplete, we are fortunate enough to now have some of the 
                       statistics from the Negro Leaguers, and we are able to bring their 
                       accomplishments from folk heroics to human achievement, to paraphrase 
                       Negro Leagues Baseball Museum co-founder Larry Lester."),
                       
                       p("One man whose accomplishments immediately jump out is two-way star Bullet 
                       Rogan. Rogan’s legend was so great that many referred to Babe Ruth as “the 
                       white Bullet Rogan”. As a hitter, Rogan tallied 2,376 plate appearances (PA) 
                       in our dataset, with an on-base percentage of .413, higher than Hall of Famers 
                       like Cool Papa Bell and Willie Wells. As a pitcher, Rogan had 5.5 strikeouts per 
                       nine innings (K/9), the same as Hall of Famer Bill Foster. Rogan even showed more 
                       control than Foster, with only 2.4 walks per nine innings (BB/9) to Foster’s 2.9. 
                       No other player showcased as much power on both the mound and at the plate, making 
                       Rogan a rarity throughout baseball history."),
                         
                       p("Our dataset also allows one to better appreciate a player like Turkey Stearnes, 
                       the leader in home runs with over 170. This was not merely a product of volume, as 
                       his home runs per plate appearance (HR/PA) of 0.04, placing him in the top five of 
                       all players in the data set. His volume is still impressive though, as with 4,291 
                       plate appearances, only Cool Papa Bell and Willie Wells had more."),
                         
                       p("Lastly, it is also interesting to examine the brief Negro League careers of 
                       some players who played at the tail-end of our dataset’s period of 1920 to 1948. 
                       Jackie Robinson only logged 137 plate appearances in our dataset, but he showed 
                       glimpses of the Hall of Famer he would become with the Brooklyn Dodgers, with an 
                       impressive on-base percentage of .449. His 0.09 doubles per plate appearance were 
                       more than double the average hitter in the dataset."),
                         
                       p("We have just laid out a few here, but there are many more insights one can 
                       glean from the tools we have created. Our intention was to create tools that 
                       could allow one to better grasp the accomplishments of the Negro Leaguers, and we 
                       hope we have done that.")
                       )
)

about <- tabPanel("About",
                  fluidPage(
                    style = "background: rgba(255, 255, 255, 0.5)",
                    titlePanel("About"),
                    
                    p("The data we are using is from Baseball Reference, though it was compiled by 
                              Seamheads from newspapers and other primary sources of the time. It is important 
                              to note that the data set is not complete by any means, as box scores and record 
                              keeping were not as comprehensive in the Negro Leagues as they were for the 
                              American and National Leagues. In addition, the Negro Leagues played many 
                              exhibition, barnstorming, and other types of games that are not included in the 
                              data set. For this reason, our analysis leans toward per-game or per-plate 
                              appearance stats more than total numbers."),
                    p("Our data includes all Negro League pitchers and position players from 1920 to 
                              1948 (the period they have been designated major leagues by MLB) in the Baseball 
                              Reference database, with the aforementioned caveats. Our data set includes all 
                              hitters with at least 100 plate appearances (PA), and all pitchers who appeared 
                              in at least 10 games. The data set only includes the career stats each player 
                              put up while in the Negro Leagues (for instance, Jackie Robinson's statistics 
                              with the Dodgers are not included in the set). "),
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
                 leaderboard_page,
                 end_page,
                 about
)