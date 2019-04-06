####################################################################
## --- Demonstration of buliding individual based models in R --- ##
## ------- This file intended to be sourced by a script --------- ##
##  Note that many functions are empty here; it's a blank canvas  ##
####################################################################


## ------------------ main function to call simulation: -------------------- ##
main <- function( parameterList = NULL, verbose = FALSE, debug = FALSE, 
                  runningReplicates = F, repID = NULL ){
  
  # first: initial checks on inputs
  returnCode <- checkInputsAndSetUpErrorCodes( parameterList, verbose, debug, runningReplicates, repID )
  if ( returnCode > 0 ) {
    return( returnCode )
  }
  
  # next: get parameter values
  # see README for expected format of parameter list, or look at 
  # getDefaultParamters() below
  if ( is.null(parameterList) ) {
    if ( VERBOSE ) {
      cat('\nNo parameterList specified. Using defaults ... \n\n')
    }
    parameterList <- getDefaultParameters()
  }
  
  # next: initialize/preallocate necessary data structures/objects
  # ASSUME that they are created as GLOBAL variables that can used in any of the
  # functions called by main
  initializeDataStructures( parameterList )
  
  # next: iterate dynamics:
  for ( i in 1:parameterList$generations ) {
    # first comes migration:
    migration( parameterList$migRate )
    
    # second is random reproduction:
    reproduction()
    
    # third is data recording:
    if ( i %% parameterList$recordingFrequency == 0 ) {
      calculateSummaryMetrics()
      dataRecording( parameterList, runningReplicates, runID )
    }
  }

  # next: return data or and/or write it to files
  # choose what you really need to return
  writeFinalDataToFiles( parameterList, runningReplicates, repID ) 
  if ( VERBOSE ) {
    cat( "\nSimulation finished with no fatal errors.\n" )
  }
  return( 0 ) # a standard way of returning a code for "no fatal errors"
}

###############################################################################
## ---------------------- Functions called by main() ----------------------- ##
## ------------------- Listed below in alphabetical order -------------------##
###############################################################################


## ---------- calculateSummaryMetrics() ----------------- ##
calculateSummaryMetrics <- function(){
  
}


## ------- checkInputsAndSetUpErrorCodes() -------------- ##
checkInputsAndSetUpErrorCodes <- function( parameterList, verbose, debug, runningReplicates, repID ){
  
  VERBOSE <<- verbose  # logical for prints to screen about status 
  DEBUG <<- debug # logical for specific prints and to screen and tests useful for debugging
  
  # error codes should be globals:
  NUM_ERROR_CODES <<- 1
  ERROR_CODE_LIST <<- data.frame("Error_Name" = rep("", NUM_ERROR_CODES),
                                 "Error_Value" = rep(1, NUM_ERROR_CODES),
                                 stringsAsFactors = F)
  ERROR_CODE_MISSING_SPEC <<- 1 # insufficient user specification
  ERROR_CODE_LIST[1,] <<- list("ERROR_CODE_MISSING_SPEC", 1)
  if( DEBUG & VERBOSE ) {
    cat("\nList of possible error codes:\n")
    show(ERROR_CODE_LIST)
  }

  if( runningReplicates ) {
    if ( is.null( repID ) ) {
      cat("\nError in inputs to main(): runningReplicates = TRUE, but repID is NULL\n")
      return( ERROR_CODE_MISSING_SPEC )
    }
  }
  return( 0 )
}

## ---------- dataRecording() ----------------- ##
dataRecording <- function( parameterList, runningReplicates, runID ){
  
}



## ---------- getDefaultParamters() ----------------- ##
getDefaultParameters <- function(){
  # number of generations to simulate:
  generations <- 10
  # total population size:
  popSize <- 200
  # number of patches/demes:
  numDemes <- 10
  # migration rate:
  migRate <- 0.05
  # period of data recording (integer >= 1):
  recordingFrequency <- 1
  
  
  parameterList <- list("generations" = generations, "popSize" = popSize, 
                        "numDemes" = numDemes, "migRate" = migRate,
                        "recordingFrequency" = recordingFrequency)
  if( exists("DEBUG") ) {
    if ( DEBUG ) {
      cat("\nParameter list:\n")
      show(as.data.frame(parameterList))
    }
  }
  
  # return params as list:
  return( parameterList )
}


## ---------- initializeDataStructures() ----------------- ##
initializeDataStructures <- function( parameterList ){
  
}


## ---------- migration() ----------------- ##
migration <- function( migRate ){
  
}


## ---------- reproduction() ----------------- ##
reproduction <- function(){
  # figure out how many offspring we are making in total
  # assume constant population size:
  
  # suppose each individual has a diploid genotype with a number NUM_LOCI 
  # being the total number of loci.  Let's pre-allocate an object to 
  # store the offspring genotypes
  
  # loop over patches
  
  # in each patch, do the following:
  # let numOffspring be the number of offspring
  
  # choose numOffspring pairs of parents, by sampling with replacement:
  
  # check that the two parents of each pair are NOT the same
  # individual:
  
  # put the two gametes together in an array of offspring genotypes
  # sperm haplotype:
  
  # egg haplotype:
  
  # when reproduction is complete, replace the parents with the offspring:
}


## ---------- writeFinalDataToFiles() ----------------- ##
writeFinalDataToFiles <- function( parameterList, runningReplicates, repID ){
  
}

