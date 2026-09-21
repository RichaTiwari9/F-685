#1. Create Variables

stock_price <- 150
shares <- 40
stock_value <- stock_price * shares

stock_price
shares
stock_value

#2. changing a variable

stock_price <- 175

stock_price
stock_value

#update the stock value

stock_value <- stock_price * shares

stock_value
#rerunning the calculatioon stored the new value assigned to stock_price

#4. nums and chars

price_text <- "175"

price_text * shares

#Rthrows an error here as "" is meant to store a string and looking at the number inside quotation its confused:(
as.numeric(price_text) * shares  
#as.numeric will convert the text back into a num so it works