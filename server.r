server <- function(input, output){
  
  output$obp_slg_chart <- renderPlotly({
    all_ops_plot_2048 <- ggplot(data = all_1920_48_qb, aes(OBP, SLG, col = PA, label = Player)) + 
      geom_point(aes(size = PA)) + labs(x = "On-base percentage", y = "Slugging percentage", 
                                        title = "1920 to 1948 Negro League batters, > 100 PA") 
    all_ops_plotly_2048 <- ggplotly(all_ops_plot_2048)
    all_ops_plotly_2048
  })
  
  output$hr_summary <- renderPlot({
    ggplot(hr, aes(x = reorder(Player, HR), y = HR)) + geom_bar(stat = "identity", width = 0.5, color = "cadetblue", 
                                                                fill = "chocolate1") + theme_gray() + 
      coord_flip() + labs(y = "Home Runs", x = "Players")
  })
  
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
