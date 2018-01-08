rankall <- function(outcome, num="best"){

    outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome <- gsub(" ","\\.",outcome)
    outcomeFullName = paste("Hospital.30.Day.Death..Mortality..Rates.from.", outcome,sep = "")
    outcomeFullName <- which(tolower(names(outcomesFile))  %in% tolower(outcomeFullName))
    outcomesFile[,11:46] <-sapply(outcomesFile[,11:46], as.numeric )
    NewFile <- outcomesFile[c(2,7,outcomeFullName)]
    colnames(NewFile) <- c("Hospital", "State", outcome)
    NewFile <- NewFile[!is.na(NewFile[outcome]),]
    NewOutcomeFile <- NewFile[order(NewFile[outcome], decreasing = FALSE),]
    NewOutcomeFileByState <- split(NewOutcomeFile,NewOutcomeFile$State)
    write.csv(NewOutcomeFile,"asd.csv",row.names=FALSE)
    
    if(num == "worst"){
        RankedHospital<-lapply(NewOutcomeFileByState, function(x) x[nrow(x),])
    }else if(num == "best"){
        RankedHospital<-lapply(NewOutcomeFileByState, function(x) x[1,])
    }else{
        RankedHospital<-lapply(NewOutcomeFileByState, function(x) x[num,])
    }
    
    Final<- do.call(rbind,RankedHospital)
    Final$State <- row.names(Final)
    Final<- Final[,1:2]
    Final
    
}
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)



