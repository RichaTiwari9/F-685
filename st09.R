#st-09
#
# 1. the data frame with Security A
securities <- data.frame(price = 82, ending_value = 90)

# 2. Security B with rbind()
securities <- rbind(securities, data.frame(price = 450, ending_value = 455))

# 3.rows name
row.names(securities) <- c("security_a", "security_b")

# 4. Print
print(securities)

# 5.Inspecting the structure
str(securities)

#part b

#6. Write a function named dollarreturn() that takes a security as its argument and calculates: 
#Dollar return = ending value - price 

dollarreturn <- function(security) {
  security$ending_value - security$price
}
# 7. HPR using dollarreturn()
hpr <- function(security) {
  dollarreturn(security) / security$price
}

# 8. HPR for each security
hpr_a <- hpr(securities["security_a", ])
hpr_b <- hpr(securities["security_b", ])
hpr_a
hpr_b #or hpr(securities)

# 9. Which is higher?
#hpr_a is > hpr_b ;Security A has the higher HPR.


#Part 3

# 10. Shares of A needed to match B's ending value

shares <- securities["security_b", "ending_value"] / securities["security_a", "ending_value"]
shares

# 11. Cost today of the A strategy
price_a_strategy <- shares * securities["security_a", "price"]
price_a_strategy

# 12. Ending value of the A strategy
ending_a_strategy <- shares * securities["security_a", "ending_value"]
ending_a_strategy

# 13. Verify it matches Security B
all.equal(ending_a_strategy, securities["security_b", "ending_value"])


#Part4:

price_b <- securities["security_b", "price"]


# 14. Which is cheaper today?
price_a_strategy < price_b #came to be true

# 16. Profit today: short B, buy the A strategy
arbitrage_profit_today <- price_b - price_a_strategy
arbitrage_profit_today


# 17. Net cash flow at the end
net_cash_flow_end <- ending_a_strategy - securities["security_b", "ending_value"]
net_cash_flow_end

#18. This is an arbitrage because we collect $35.44 today and owe nothing 
#net in the future. The long position in A exactly covers the obligation on the 
#short in B, so there’s no risk and no investment of your own money required.

#19. The Law of One Price says two assets with identical future cash flows and 
#the same risk must have the same price today. Here the same $455 payoff 
#costs $414.56 one way and $450 the other. Traders would rush to buy A and 
#short B, which pushes A’s price up and B’s price down until the cost of the
#two strategies is equal and the free profit disappears.