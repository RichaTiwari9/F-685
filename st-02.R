#VECTORS
#1. create and append

x <- c(3, 7, 1, 9)     
x <- c(x, 5)
#but what if i want to add a no. at a specific place
x                   

#2. access change and select values
#note: R indexes starting at 1, not 0.
x[2]         
x[3] <- 4   
x[1:3]        
x[-2]          
x <- x[-2]     #permanently deleted 2values

#3. operations on vectors
y <- c(2, 8, 6, 4)     #  numeric vector with 4 values

x[1:3] + y[1:3]        
x[1:3] * y[1:3]        
y + 2           

#4.using vector to select values 
#index vectors
i <- c(1, 3, 4)        
x[i]