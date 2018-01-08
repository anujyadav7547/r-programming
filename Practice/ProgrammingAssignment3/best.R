
## Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  ##readFile()
  setwd("E:/Tutorial/r-programming/Practice/ProgrammingAssignment3")
  outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  if(sum((outcomesFile$State == state)) == 0 ) stop("Invalid State")
  
  outcome <- gsub(" ","\\.",outcome)
  outcomeFullName = paste("Hospital.30.Day.Death..Mortality..Rates.from.", outcome,sep = "")
  
  if(!tolower(outcomeFullName) %in% tolower(names(outcomesFile))) stop("Invalid Outcome")

  outcomeFullName <- which( tolower(names(outcomesFile))  %in% tolower(outcomeFullName))

  
  outcomesFile[,outcomeFullName] <- as.numeric(outcomesFile[,outcomeFullName])
  outcomeByState <- outcomesFile[outcomesFile$State == state,]
  minOutcome <-min(outcomeByState[outcomeFullName], na.rm= TRUE)
  minOutcome <- as.numeric(minOutcome)
  
  min(outcomeByState$Hospital.Name[outcomeByState[outcomeFullName] ==minOutcome & !is.na(outcomeByState[outcomeFullName])])
  
}

best("avs", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
best("CA", "Hospital.30.Day.Readmission.Rates.from.Heart.Attack"    )

best("TX", "Heart Attack")
best("TX", "Heart Failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


