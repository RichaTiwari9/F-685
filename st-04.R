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

#2. Access values in a data frame 
#Access one numeric column using $. 

planes$number
planes$number[3]
planes$number+3
planes[3]
planes[ ,3]
planes[2, ]
planes[4, "inuse"]
planes[,"number"]


#3. Select rows and columns 

#Display the first three rows of your data frame.  
planes[1:3, ]
#Display only two columns of your choice.  
planes[, c("name", "inuse")]
#Display the first three rows of only those two columns.  
planes[1:3, c("name", "inuse")]
#Create a condition using one of these operators: 
  
  #==, >, <, >=, <= 
planes$inuse > 75
#  Display the TRUE/FALSE values created by your condition.  
planes[planes$inuse > 75, ]
#Use the condition to display only the rows where the condition is TRUE. 
