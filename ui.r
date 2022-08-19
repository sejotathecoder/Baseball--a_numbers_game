
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
                      plotlyOutput(outputId = "obp_slg_chart")
)

hitting_radar_page <- tabPanel("Hitting Radar Charts",
                               titlePanel("Negro League Hitters: Radar Chart"),
                               sidebarLayout(
                                 sidebarPanel(selectInput("hitter_select", label = h3("Select a hitter"),
                                                          choices = bat_list)
                                 ),
                                 
                                 mainPanel(
                                   tabsetPanel(
                                      tabPanel("Radar Chart", plotOutput(outputId = "hitting_plot")),
                                      tabPanel("Table", tableOutput(outputId = "hitting_table"))
                                   ),
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
                                    tabsetPanel(
                                      tabPanel("Radar Chart", plotOutput(outputId = "pitching_plot")),
                                      tabPanel("Table", tableOutput(outputId = "pitching_table"))
                                    ),
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
                               ),
                               mainPanel(
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

end_page <- tabPanel("conclusion",
                     mainPanel(
                       h1("A summary of our project and insights of our data - based conclusions"), align = "center",
                       
                       end_summary <- print(" Shohei Ohtahni, Aaron Judge, Mike Trout, and other Major Leaguers such as Derek Jeter
                                            have become household names in todays world. These are players that we know to love
                                            and sometimes even hate; but what about players like Satchel Paige, Josh Gibson, or
                                            Bullet 'Joe' Rogan? These Negro Leaue players were prodigys of their time; facing overwhelming
                                            odds, they continued to stand out in their profession and display their talent time and time
                                            again. This was the initial inspiration for Colin and I. We wanted to bring these outstanding
                                            Negro Leaguers to the fore front of baseball achievemet using modern day statistics.
                                            Creating visuals and analyzing & wrangling real world data in order for the reader to understand the
                                            history of the game and its players was the priority of this project. 
                                            
                                              We learned many things over the course of making this shiny application. One of the main
                                            takeaways was understanding that the data we are using is very messy, unorganized, and
                                            contains many missing points. Learning to manipulate this data was hard and very frustuarting
                                            at times but gave us the neccesary experience dealing with real world data. 
                                            
                                              Another important lesson we both learned was that the game of baseball was different back then.
                                            These players were superstars, but proving that was the difficult part. Some ball players
                                            during the World War 2 era didn't get many at bats, mound outings (pitching experience),
                                            or opportunities that many athletes have today to showcase their abilities; these discrepancies
                                            were even more prevalent for the Negro Leaguers. Again, finding ways to display what we needed to
                                            for highliting these players was hard. When we finally solved a way to mutate data frames,
                                            or plot charts in the appropriate manner, we learned that completing this project was possible,
                                            it ust required many man hours and lots of creative thinking.
                                            
                                              Finally, we wanted to give the reader a better understanding of the game and how our
                                            visuals worked. This proved to be quite difficult when describing baseball statistics or 
                                            even plotting data points because we always had to think from the perspective of a reader
                                            with no prior baseball knowledge. Highliting these players achievements while translating
                                            their statistics into English was a learning curve for both of us but was neccesary
                                            for the goal we were trying to accomplish.
                                            
                                              We created four interactive visualizations with respect to our goals of ranking these players
                                            and being as transperent as possible with our data. The initial plot on the 'Home Plate' page
                                            was our way of allowing the reader to review the data for themselves, accessing multiple stats
                                            for all players in our data set. The next two visuals are radar charts for a more in-depth
                                            look at each players abilities. Lastly, we crated an interactive bar chart that represents
                                            the encompassing theme of our project; eliminating any bias with the players and ranking them
                                            soley based on their statistical achievements. In every visual, you will see that players such as
                                            Satchel Paige and Turkey Stearnes stand out just like modern day baseball
                                            superstars. The final table that demonstrates insight for our project can be found on the 
                                            'Leaderboard' page, where multiple calculated statistical comparisons are viewable and filterable
                                            at the readers discrection. We want whoever is viewing our work to feel in control of the data
                                            and make their own conclusion based on the charts, and descriptins that we have provided.
                                            These players were amazing during their prime, Colin Putcher and Cj Piccio just made that known.
                                            " )
                     ),
                     
                     verbatimTextOutput(outputId = "end_summary"),
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
                 end_page
)