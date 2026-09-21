#3.lists

x <- c(10, 20, 30, 40)
y <- c(1, 2, 3, 4)

my_list <- list(first = x, second = y)
my_list

#2. accessing objs in list
my_list$first
my_list$first[1]    
my_list$first + 2

my_list["first"]
my_list[["first"]]
my_list[["first"]] + 2  

#3. adding obj to the list
my_list$sum <- my_list$first + my_list$second
my_list$sum

my_list$words <- c("apple", "banana", "cherry")
my_list$words

#4. list inside a list
my_list$inner <- list(a = c(100, 200), b = c(7, 8, 9))
my_list$inner
my_list$inner$a 
my_list[["inner"]][["a"]]