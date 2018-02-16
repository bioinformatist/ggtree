library(shiny)
library(treeio)

shinyServer(function(input, output) {
   
  output$preview.imported.data <- renderPrint({
    
    switch(input$example.data,
           BEAST = read.beast(system.file("extdata/BEAST", "beast_mcc.tree", package="treeio")),
           MrBayes = read.mrbayes(system.file("extdata/MrBayes", "Gq_nxs.tre", package="treeio")),
           PAMLB = read.paml_rst(system.file("extdata/PAML_Baseml", "rst", package="treeio")),
           HyPhy = read.hyphy.seq(system.file("extdata/HYPHY", "ancseq.nex", package="treeio")),
           r8s = read.r8s(system.file("extdata/r8s", "H3_r8s_output.log", package="treeio")),
           RAxML = read.raxml(system.file("extdata/RAxML", "RAxML_bipartitionsBranchLabels.H3", package="treeio")),
           NHX = read.nhx(system.file("extdata/NHX", "phyldog.nhx", package="treeio")),
           Phylip = read.phylip(system.file("extdata", "sample.phy", package="treeio")),
           jplace = read.jplace(system.file("extdata/EPA.jplace",  package="treeio")),
           jtree = {
             beast <- read.beast(system.file("extdata/BEAST", "beast_mcc.tree", package="treeio"))
             jtree_file <- tempfile(fileext = '.jtree')
             write.jtree(beast, file = jtree_file)
             read.jtree(file = jtree_file)
           }
           )
    
  })
  
  # output$preview.imported.data <- renderPrint({
  #   
  #   read.beast(input$evolutionary.analysis.result)
  #   
  # })
  
})
