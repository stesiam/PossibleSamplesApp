# Import libraries

library(shiny)
library(bslib)

# Custom functions

possible_samples_srswor <- function(N,n){
  result = factorial(N)/(factorial(n) * factorial(N - n))
  return(result)
}

possible_samples_srswr <- function(N,n){
  result = N^n
  return(result)
}

possible_samples_systematic <- function(N,n){
  result = as.integer(N/n)
  return(result)
}

sep_big_num <- function(number){
  prettyNum(number, big.mark = ",", scientific = FALSE)
}