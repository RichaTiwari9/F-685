#St-07

# Inputs
ini_equity     <- 10000
margin         <- 0.50
div            <- 0.60
int_rate       <- 0.08
holding_period <- 0.50
ini_price      <- 50
prices         <- c(40, 50, 60)

#Part 1: Small functions 

# 1. Initial value of the investment
ini_value <- function(margin, ini_equity) {
  ini_equity / margin
}

# 2. Number of shares purchased
shares <- function(value, price) {
  value / price
}

# 3. Market value at each ending price (works with a vector of prices)
mkt_value <- function(price, shares) {
  price * shares
}

# 4. Total dividends received
total_dividend <- function(div, shares) {
  div * shares
}

# 5. Amount borrowed
debt <- function(value, equity) {
  value - equity
}

# 6. Interest expense over the holding period
interest_exp <- function(debt, int_rate, holding_period) {
  debt * int_rate * holding_period
}

# 7. Profit
profit <- function(value1, value0, dividend, interest) {
  value1 - value0 + dividend - interest
}

# 8. Holding-period return on original equity
roi <- function(profit, ini_equity) {
  profit / ini_equity
}

#Tests
ini_value(0.50, 10000)            
shares(20000, 50)                
mkt_value(c(40, 50, 60), 400)     
total_dividend(0.60, 400)        
debt(20000, 10000)               
interest_exp(10000, 0.08, 0.50)   
profit(24000, 20000, 240, 400)  
roi(3840, 10000)             

#Part 2: Return function
leverage_returns <- function(ini_equity, margin, div, int_rate,
                             holding_period, ini_price, prices) {
  value0   <- ini_value(margin, ini_equity)
  n_shares <- shares(value0, ini_price)
  value1   <- mkt_value(prices, n_shares)
  divs     <- total_dividend(div, n_shares)
  borrowed <- debt(value0, ini_equity)
  interest <- interest_exp(borrowed, int_rate, holding_period)
  prof     <- profit(value1, value0, divs, interest)
  ret      <- roi(prof, ini_equity)
  
  data.frame(price = prices, profit = prof, return = ret)
}

# Part 3: Compare margin and no borrowing
ret_50 <- leverage_returns(ini_equity, 0.50, div, int_rate,
                           holding_period, ini_price, prices)

ret_100 <- leverage_returns(ini_equity, 1, div, int_rate,
                            holding_period, ini_price, prices)

ret_50$unleveraged <- ret_100$return

print(ret_50)
