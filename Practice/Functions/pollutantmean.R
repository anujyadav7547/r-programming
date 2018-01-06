#mean of the pollutant across different monitors
pollutantmean <-function(directory, pollutant, id= 1:322){
          Sums <- 0
          Counts <- 0
          for(i in id) {
              wFile <- read.csv(file.path(directory, paste(sprintf("%03d",i),".csv", sep = "")))
              Sums<- Sums + sum(wFile[[pollutant]], na.rm = TRUE)   
              Counts <- Counts + sum(!is.na(wFile[pollutant]))   
          }
          Sums/Counts
} 

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", c(2, 4, 8, 10, 12))
pollutantmean("specdata", "nitrate")




