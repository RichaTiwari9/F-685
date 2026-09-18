#Data Frame 


#1. Create a data frame 

#Create three vectors with at least 5 values each:  
#Two numeric vectors.  
#One character vector.  

airlines <- c("united airlines", "american airlines", "delta airlines", "alaska airlines", "spirit airlines")
tail_no <- c(101, 102, 103, 104, 105)
working <- c(88, 72, 95, 60, 79)

planes <- data.frame(
  name = airlines,
  number = tail_no,
  inuse = working
)
print(planes)