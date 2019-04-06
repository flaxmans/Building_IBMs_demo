# Example Script for running demonstration individual-based model (IBM)
# Assumption is that IBM_SourceFunctions.R is in the same directory as this script

# set working directory to directory of script:
setwd("~/Building_IBMs_demo/")
source("IBM_SourceFunctions.R")

# call the simulation:
main( verbose = TRUE, debug = TRUE )


################################################################
## -------------- Conduct a parameter study ----------------- ##
################################################################
parameterList <- getDefaultParameters()

popSizeValues <- seq(from = 100, to = 1000, by = 100)
n <- length(popSizeValues)
for ( i in 1:n ) {
  parameterList$popSize <- popSizeValues[i]
  main(parameterList)
}
