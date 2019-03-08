####################################################################
## Demonstration of buliding individual based models in R ##
## This file intended to be sourced by a script ##
####################################################################

## ------------------ main function to call simulation: --------------------- ## 
main <- function( parameterList = NULL ){
  
  # first: get parameter values
  # see README for expected format of parameter list, or look at 
  # getDefaultParamters() below
  if ( is.null(parameterList) ) {
    parameterList <- getDefaultParamters()
    cat('\nNo parameterList specified. Using defaults ... \n\n')
  }
  
  # second: initialize/preallocate necessary data structures/objects
  # ASSUME that they are created as GLOBAL variables that can used in any of the
  # functions called by main
  initializeDataStructures( parameterList )
  
  # iterate dynamics:
  for ( i in 1:parameterList$generations ) {
    # first comes migration:
    migration( parameterList$migRate )
    
    # second is random reproduction:
    reproduction()
    
    # third is data recording:
    if ( i %% parameterList$recordingFrequency == 0 ) {
      calculateSummaryMetrics()
      dataRecording()
    }
  }
  
  # return data or and/or write it to files
  # choose what you really need to return
  
}

## ---------------------------- Functions called by main() -------------------------- ##
## Listed below  in alphabetical order ##


## ---------- calculateSummaryMetrics() ----------------- ##
calculateSummaryMetrics <- function(){
  
}


## ---------- dataRecording() ----------------- ##
dataRecording <- function(){
  
}



## ---------- getDefaultParamters() ----------------- ##
getDefaultParameters <- function(){
  # number of generations to simulate:
  generations <- 10
  # total population size:
  popSize <- 200
  # number of patches/demes:
  numDemes <- 2
  # migration rate:
  migRate <- 0.05
  
  # return params as list:
  return( list(generations, popSize, numDemes, migRate) )
}


## ---------- initializeDataStructures() ----------------- ##
initializeDataStructures <- function( parameterList ){
  
}


## ---------- migration() ----------------- ##
migration <- function( migRate ){
  
}


## ---------- reproduction() ----------------- ##
reproduction <- function(){
  
}

