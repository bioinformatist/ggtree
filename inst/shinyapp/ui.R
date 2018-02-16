library(shiny)

shinyUI(fluidPage(
  titlePanel(title=div(img(src="ggtree.png", width = 103.6, height = 120), "ggtree Shiny App")),
  navlistPanel(tabPanel("Data Import",
                        sidebarLayout(sidebarPanel(
                          wellPanel(selectInput('example.data', "Choose Example Data", c('BEAST output' = 'BEAST',
                                                                                         'MrBayes output' = 'MrBayes',
                                                                                         'PAML BASEML output' = 'PAMLB',
                                                                                         'HyPhy output' = 'HyPhy',
                                                                                         'r8s output' = 'r8s',
                                                                                         'output of RAxML bootstraping analysis' = 'RAxML',
                                                                                         'NHX tree' = 'NHX',
                                                                                         'Phylip tree' = 'Phylip',
                                                                                         'EPA and pplacer output' = 'jplace',
                                                                                         'jtree format' = 'jtree'
                          )),
                          tags$hr(),
                          fileInput('evolutionary.analysis.result', 'or Choose File', accept = 'text/plain'),
                          radioButtons('upload.type', 'Uploaded File Type', choiceNames = list(img(src = 'cropped-Beast2-logo.jpg', width = 154.4, height = 29.6), 'MrBayes'), choiceValues = list('BEAST', 'MrBayes')),
                          submitButton("Upload & Update Preview"))),
                          mainPanel(h4("Imported Data Preview"),
                                    verbatimTextOutput('preview.imported.data'))
                        )),
              tabPanel("Visualization", sidebarLayout(sidebarPanel('heiheihei'), mainPanel('xixi'))),
              tabPanel("tab 3", "contents"))
))
