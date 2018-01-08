setwd("E:/Tutorial/r-programming/Practice/ProgrammingAssignment3")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

## Plot the 30-day mortality rates for heart attack
outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <-
  as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
hist(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
