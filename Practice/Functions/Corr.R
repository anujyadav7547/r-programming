#Write a function that takes a directory of data files and a threshold for complete cases 
#and calculates the correlation between sulfate and nitrate for monitor locations where the
#number of completely observed cases (on all variables) is greater than the threshold. 
#The function should return a vector of correlations for the monitors that meet the 
#threshold requirement. If no monitors meet the threshold requirement, then the 
#function should return a numeric vector of length 0.

corr <-function(directory, threshold=0){
  
  myVector <- vector()
  for(i in 1:322) {
    wFile <- read.csv(file.path(directory, paste(sprintf("%03d",i),".csv", sep = "")))
    
    if (sum(complete.cases(wFile)) > threshold){
      myVector <- c(myVector, cor(wFile$sulfate, wFile$nitrate, use = "complete.obs"))   
    }
    
  }
  
  myVector
  
} 


cr <- corr("specdata", 150)
head(cr)
summary(cr)


cr <- corr("specdata", 400)
head(cr)
summary(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))