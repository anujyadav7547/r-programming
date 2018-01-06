#Write a function that reads a directory full of files and reports the number of 
#completely observed cases in each data file. The function should return a data frame
#where the first column is the name of the file and the second column is the number 
#of complete casess

complete <-function(directory, id= 1:322){
  myFrame <- data.frame()
  
  for(i in id) {
    wFile <- read.csv(file.path(directory, paste(sprintf("%03d",i),".csv", sep = "")))
    #print(sum(complete.cases(wFile)))
    myFrame <- rbind(myFrame, c(i, sum(complete.cases(wFile))))
  }
  colnames(myFrame) <- c("ID", "nobs")
  myFrame
  
} 

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)


cc <- complete("specdata", 54)
print(cc$nobs)


set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
