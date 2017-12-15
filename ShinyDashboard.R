library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("dataset", HTML("Choose a Benchmarking Dataset<br/>(Site_Protocol_Samples.txt)"), multiple = TRUE, accept = "txt/csv"),
      sliderInput(inputId = "TSI_Pl",
                  label = HTML("Tissue-Selectivity for Placenta<br/>(default = 10)"),
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "TSI_Br",
                  label = HTML("Tissue-Selectivity for Brain<br/>(default = 10)"),
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "TSI_Lv",
                  label = HTML("Tissue-Selectivity for Liver<br/>(used for 1-to-1 subset)<br/>(default = 10)"),
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "BP_sim",
                  label = HTML("Set Absolute Log2 Ratio (Brain/Placenta)<br/>(used for 1-to-1 subset)<br/>(default = 0.075)"),
                  value = 0.075, min = 0, max = 0.2, step = 0.025),
      sliderInput(inputId = "BW",
                  label = HTML("Set Tolerance Bandwith<br/>(default = 2)"),
                  value = 2, min = 1, max = 10, step = 1),
      sliderInput(inputId = "log2FC",
                  label = HTML("Set Tolerance Fold-Change Limit<br/>(default = 1.5)"),
                  value = 1.5, min = 1, max = 4, step = 0.25),
      sliderInput(inputId = "Prop",
                  label = HTML("Set Minimum Tolerance Proportion<br/>(default = 0.95)"),
                  value = 0.95, min = 0.9, max = 1.0, step = 0.01)),
    mainPanel(plotOutput(outputId = "DB6plot"))
  )
)

server <- function(input, output) {
  output$DB6plot <- renderPlot({
    
    req(input$dataset)
    
    source("Supporting_files/DashboardView.R")
    
    ShinyDB6P(input$dataset,
              input$TSI_Br,
              input$TSI_Lv,
              input$TSI_Pl,
              input$BP_sim,
              input$BW,
              input$log2FC,
              input$Prop)
  }, height = 825, width = 600)
}

shinyApp(ui = ui, server = server)
