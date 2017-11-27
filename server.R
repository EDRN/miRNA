library(shiny)
setwd("/data/shiny-server/srv/shiny-server/miRNA")
server <- function(input, output) {
  output$DB6plot <- renderPlot({
    
    source("/data/shiny-server/srv/shiny-server/miRNA/DBforShiny.R")
    
    ShinyDB6P(input$site,
              input$protocol,
              input$sample,
              input$TSI_Br,
              input$TSI_Lv,
              input$TSI_Pl,
              input$BP_sim,
              input$BW,
              input$log2FC,
              input$Prop)
  }, height = 825, width = 600)
}

