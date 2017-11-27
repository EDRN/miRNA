library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("site", "Choose a Site:",
                  c("Lab008 (using NGS)"="Lab008",
                    "Lab007 (using NGS)"="Lab007",
                    "Lab006 (using NGS)"="Lab006",
                    "Lab005 (using HYB)"="Lab005",
                    "Lab004 (using PCR)"="Lab004"
                    )),
      selectInput("protocol", "Choose a Protocol:",
                  c("NGS004 (Lab008 only)"="NGS004",
                    "NGS003 (Lab007 only)"="NGS003",
                    "NGS002 (Lab006 2nd platform)"="NGS002",
                    "NGS001 (Lab006 1st platform)"="NGS001",
                    "HYB001 (Lab005 only)"="HYB001",
                    "PCR004 (Lab004 only)"="PCR004"
                    )),
      selectInput("sample", "Choose a Sample:",
                  c("NIST05 (except NGS001)"="NIST05",
                    "NIST04 (all protoocols)"="NIST04",
                    "NIST03 (all protoocols)"="NIST03"
                    )),
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

