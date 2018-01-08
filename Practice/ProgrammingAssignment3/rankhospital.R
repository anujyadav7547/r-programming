#Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num="best") {
  setwd("E:/Tutorial/r-programming/Practice/ProgrammingAssignment3")
  outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome <- gsub(" ","\\.",outcome)
  outcomeFullName = paste("Hospital.30.Day.Death..Mortality..Rates.from.", outcome,sep = "")
  if(sum((outcomesFile$State == state)) == 0 ) stop("Invalid State")
  if(!tolower(outcomeFullName) %in% tolower(names(outcomesFile))) stop("Invalid Outcome")
  
  outcomeFullName <- which(tolower(names(outcomesFile))  %in% tolower(outcomeFullName))
  outcomesFile[,outcomeFullName] <- as.numeric(outcomesFile[,outcomeFullName])
  outcomeByState <- outcomesFile[outcomesFile$State == state,]
  if (num == "best"){
    SortedOutcome <- outcomeByState[order(outcomeByState[outcomeFullName], decreasing = FALSE),]
    outcomeNum <- SortedOutcome[1,outcomeFullName]
    HospitalName <-SortedOutcome$Hospital.Name[min(which(SortedOutcome[outcomeFullName] ==outcomeNum))]
  }else if(num=="worst") {
    SortedOutcome <- outcomeByState[order(outcomeByState[outcomeFullName], decreasing = TRUE),]
    outcomeNum <- SortedOutcome[1,outcomeFullName]
    HospitalName <-SortedOutcome$Hospital.Name[min(which(SortedOutcome[outcomeFullName] ==outcomeNum))]
  }else{
    SortedOutcome <- outcomeByState[order(outcomeByState[outcomeFullName], decreasing = FALSE),]
    outcomeNum <- SortedOutcome[num,outcomeFullName]
    HospitalName <-SortedOutcome$Hospital.Name[min(which(SortedOutcome[outcomeFullName] ==outcomeNum))]
  }
  HospitalName
}
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


