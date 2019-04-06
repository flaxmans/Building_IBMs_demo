# Building Individual-Based Models Demonstration

This repository is meant to serve as a starting point for a demonstration/workshop on building individual-based models.  The example code is constructed in R since this is a common language used by biologists in the intended audience.

## Files in this repository

* IBM_SourceFunctions.R: a file of functions that run the simulation.
* SimulationScript.R: a script that calls the functions in the previous file to create one instance of a simulation run.  
* ReproBlank.R: a pseudo-coded example of one function

## Notes for users
* SimulationScript.R contains the line `setwd("~/Building_IBMs_demo/")`.  Users should re-write this to make sense for their own path.  
* IBM_SourceFunctions.R is meant to be a mostly empty shell of a program; a blank slate from which one could start to build the model described below.  However, it is executable; it just doesn't do anything beyond intializing parameter values at this point.  Again, this is because this repository is for demonstration purposes.  
* ReproBlank.R is a pseudo-coded example that could be used to build algorithms for random reproduction.  It is given as a separate file to aid focus on its specific goals without worrying too much about what the rest of the code might do.


## The general setup: an example of building a model of neutral evolution
Suppose we wanted to build a population genetic model of two populations (demes) connected by migration.  For the sake of simplicity, we will ignore selection, and assume that the evolutionary dynamics are governed by stochastic processes: migration, drift, and recombination.  

**To make this an IBM, for each individual we need:**
* a genotype
* a location

**To simulate dynamics, we need algorithms that probabilistically implement:**
* migration
* reproduction
* recombination during gamete formation (part of reproduction)




