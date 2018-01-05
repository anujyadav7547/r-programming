names(hw1_data)

hw1_data[1:2,]
#How many observations (i.e. rows) are in this data frame?
nrow(hw1_data)

#Extract the last 2 rows of the data frame and print them to the console. 
#What does the output look like?
hw1_data[152:153,]

#What is the value of Ozone in the 47th row?
hw1_data[47,"Ozone"]

#How many missing values are in the Ozone column of this data frame?
sum(is.na(hw1_data[,"Ozone"])) #1

sum(is.na(hw1_data$Ozone)) #2

#What is the mean of the Ozone column in this dataset? 
#Exclude missing values (coded as NA) from this calculation.
mean(hw1_data$Ozone[!is.na(hw1_data$Ozone)])
                #Or
mean(hw1_data$Ozone, na.rm = TRUE)
                    
#Extract the subset of rows of the data frame where Ozone values are above 31 
#and Temp values are above 90. What is the mean of Solar.R in this subset?
mean(hw1_data$Solar.R[hw1_data$Ozone > 31 & hw1_data$Temp > 90], na.rm = TRUE)
                #Or
mean(hw1_data[which(hw1_data$Ozone >31 & hw1_data$Temp > 90),]$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
mean(hw1_data$Temp[hw1_data$Month == 6])
                #Or
mean(hw1_data[which(hw1_data$Month == 6),]$Temp)

#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(hw1_data$Ozone[hw1_data$Month == 5], na.rm = TRUE)
