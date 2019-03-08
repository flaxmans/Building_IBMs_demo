# Building Individual-Based Models Demonstration

This repository is meant to serve as a starting point for a demonstration/workshop on building individual-based models.  The example code is constructed in R since this is a common language used by biologists in the intended audience.

## Files in this repository

* IBM_SourceFunctions.R: a file of functions that run the simulation.
* SimulationScript.R: a script meant to be run that makes use of the functions in the previous file and uses them to create one instance of a simulation run.

## Notes for users
* SimulationScript.R contains the line `setwd("~/Building_IBMs_demo/")`.  Users should re-write this to make sense for their own path.

## The general setup: a model of neutral evolution
Suppose we wanted to build a population genetic model of two populations (demes) connected by migration.  For the sake of simplicity, we will ignore selection, and assume that the evolutionary dynamics are governed by stochastic processes: migration, drift, and recombination.  

**To make this an IBM, for each individual we need:**
* a genotype
* a location

**To simulate dynamics, we need algorithms for:**
* migration
* reproduction
* recombination during gamete formation (part of reproduction)




