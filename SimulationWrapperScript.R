# Example Script for running demonstration individual-based model (IBM)
# Assumption is that IBM_SourceFunctions.R is in the same directory as this script
rm(list = ls())
# set working directory to directory of script:
setwd("~/Building_IBMs_demo/")
source("IBM_SourceFunctions.R")

# call one instance of the simulation:
main( verbose = TRUE, debug = TRUE )


################################################################
## -------------- Conduct a parameter study ----------------- ##
## ---------------- this is a toy example ------------------- ##
################################################################
rm(list = ls())
# load functions into memory: 
setwd("~/Building_IBMs_demo/")
source("IBM_SourceFunctions.R")

# use existing function to generate parameter list:
parameterList <- getDefaultParameters()

# suppose we wanted to study the impact of population size:
popSizeValues <- seq(from = 100, to = 1000, by = 100)
replicatesOfEach <- 10
n <- length(popSizeValues)
repNum <- 0
for ( i in 1:n ) {
  parameterList$popSize <- popSizeValues[i]
  for ( j in 1:replicatesOfEach ) {
    repNum <- repNum + 1
    returnCode <- main(parameterList, runningReplicates = T, repID = repNum )
    if( returnCode > 0 ) {
      # there was a problem
      cat(paste("\nSimulation exited with error return code ", returnCode, ": ", sep = ""))
      cat(ERROR_CODE_LIST[returnCode, 1])
      cat("\n\t... Ceasing running of replicates ... \n\n")
      break
    }
  }
  if( returnCode > 0 ) {
    break
  }
}
