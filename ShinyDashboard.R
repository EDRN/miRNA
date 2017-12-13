library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("dataset", "Choose a Benchmarking Dataset (Site_Protocol_Samples.txt)", multiple = TRUE, accept = "txt/csv"),
      sliderInput(inputId = "TSI_Pl",
                  label = "Tissue-Selectivity for Placenta",
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "TSI_Br",
                  label = "Tissue-Selectivity for Brain",
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "TSI_Lv",
                  label = "Tissue-Selectivity for Liver (1-to-1)",
                  value = 10, min = 1, max = 10, step = 1),
      sliderInput(inputId = "BP_sim",
                  label = "Set Absolute Log2 Ratio (Brain/Placenta) for 1-to-1",
                  value = 0.075, min = 0, max = 0.2, step = 0.025),
      sliderInput(inputId = "BW",
                  label = "Set Tolerance Bandwith",
                  value = 2, min = 1, max = 10, step = 1),
      sliderInput(inputId = "log2FC",
                  label = "Set Tolerance Fold-Change Limit",
                  value = 1.5, min = 1, max = 4, step = 0.25),
      sliderInput(inputId = "Prop",
                  label = "Set Minimum Tolerance Proportion",
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
