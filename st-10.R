#st - 10

# Assumption is that Security A and Security B have the same risk.

# Part 1: Create the Securities Data
securities <- data.frame(
  price    = c(90.00, NA),
  period_1 = c(100.80, 0.00),
  period_2 = c(0.00, 112.896)
)
row.names(securities) <- c("security_a", "security_b")
print(securities)

# Part 2: Construct the Rollover Strategy
# 1. Select Security A and make its price negative (a purchase)
security_a_cf <- securities["security_a", ]
security_a_cf$price <- -security_a_cf$price

# 2. Holding period return: Period 1 cash flow / price - 1
#    Use the absolute value
return_a <- security_a_cf$period_1 / abs(security_a_cf$price) - 1
return_a   #came to be .12

# 3. Period 1 cash flow
period_1_cf <- security_a_cf[1, "period_1"]

# 4. Reinvest the Period 1 cash flow in Security A at the same return

security_a_cf["period_1_cf", ] <- c(0, -period_1_cf, period_1_cf *(1+ return_a))

# 5. Total cash flow in each period
period_totals <- numeric(ncol(security_a_cf))
for (i in seq_along(security_a_cf)) {
  period_totals[i] <- round(sum(security_a_cf[, i]), 6)
}

# 6. Adding totals row and print
security_a_cf["totals", ] <- period_totals
print(security_a_cf)


# 7. Explanation
# The Period 1 total is zero because the $100.80 received from Security A
# is immediately reinvested in Security A, so the inflow and outflow cancel and is null.
# The strategy pays 100.80 * 1.12 = $112.896 in Period 2, which is exactly
# Security B's Period 2 cash flow. The rollover replicates Security B and
# costs $90 today.


# Part 3: Construct the Arbitrage
# 1. Security B at a market price of $89 (purchase = negative)
security_b_cf <- securities["security_b", ]
security_b_cf$price <- -89
  
# 2. Comparing costs
rollover_cost   <- abs(security_a_cf["totals", "price"])  
security_b_cost <- abs(security_b_cf$price)               
if (security_b_cost < rollover_cost) {
  cat("Security B is cheaper: buy B, short the rollover strategy") #anw
} else {
  cat("Rollover is cheaper: buy the rollover strategy, short B")
}


#3 and #4. Construct the arbitrage cash-flow table: 
  
arbitrage_cf <- rbind( 
-security_a_cf[-3, ],
security_b_cf)  
  

# 5. Net cash flow in each period
profit <- numeric(ncol(arbitrage_cf))  
for (i in seq_along(arbitrage_cf)) {
  profit[i] <- round(sum(arbitrage_cf[, i]), 6)
}
arbitrage_cf["profits", ] <- profit


# 7. Print the completed table
print(arbitrage_cf)
#we collect $1 today and every future period nets to zero. That’s a riskless
#profit with no net investment, which is the definition of arbitrage.

# 8. Explanation
# Shorting the rollover brings in $90 today and buying Security B costs $89,
# so the position nets +$1 today. In Period 1 the short position owes $100.80
# on Security A, which is covered by the $100.80 from the reinvestment amt.
# In Period 2 the $112.896 owed on the short reinvestment is paid exactly by
# Security B's $112.896. Future net cash flows are zero in every state, so
# this is a riskless $1 profit with no net investment, hence an arbitrage.


# Part 4: Determine the Correct Price of SecurityB
# 1. P = CF_t / (1 + r)^t with r = return_a and t = 2
price_b <- securities["security_b", "period_2"] / (1 + return_a)^2
price_b   #90 anw

# 2. Storing and printing
securities["security_b", "price"] <- price_b
print(securities)

#price period_1 period_2
#security_a    90    100.8    0.000
#security_b    90      0.0  112.896

# 3. Explanation
# Acc to the Law of One Price, two assets with identical cash flows and risk
# must sell for the same price. Security B and the rollover strategy both pay
# $112.896 in Period 2, so B should cost $90. At $89, traders would buy B and
# short the rollover to lock in $1 risk free. That buying pressure pushes B's
# price up (and selling pressure pushes A's down) until the gap closes and
# the arbitrage disappears.