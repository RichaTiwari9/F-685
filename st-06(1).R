add_sales_tax <- function(price) {
  total <- price * 1.08
  return(total)
}

print(add_sales_tax(50))

tax_on_value <- add_sales_tax(20)

book_price <- 100
tax_on_variable <- add_sales_tax(book_price)

cart_prices <- c(10, 25, 40)
tax_on_vector <- add_sales_tax(cart_prices)

print(tax_on_value)
print(tax_on_variable)
print(tax_on_vector)