# Import libraries

library(shiny)
library(badger)

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

possible_samples_strata <- function(k,N1,n1,N2,n2,N3,n3,N4,n4){
  if(k==1){
    result = possible_samples_srswor(N1,n1)
  }
  else if(k==2){
    result = possible_samples_srswor(N1,n1) * possible_samples_srswor(N2,n2)
  }
  else if(k==3){
    result = possible_samples_srswor(N1,n1) * possible_samples_srswor(N2,n2) * possible_samples_srswor(N3,n3)
  }
  else{
    result = possible_samples_srswor(N1,n1) * possible_samples_srswor(N2,n2) * possible_samples_srswor(N3,n3) *possible_samples_srswor(N4,n4)
  }
  return(result)
}
