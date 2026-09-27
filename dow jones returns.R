#Dow Jones Returns 

#retreive and inspect the data
res <- dbSendQuery(wrds, "SELECT date, dji FROM djones.djdaily") 

dow <- dbFetch(res) 

dbClearResult(res)

head(dow)


#2. create the beginning value data
# Index from observation 1 to one observation before the end of the data
i <- 1:(length(dow$dji) - 1)
# Earlier (beginning) Dow Jones values: every value except the last one
lag <- dow$dji[i]

# Confirm lag starts with the first observation in the original data
head(lag)
head(dow$dji)

#3.
k <- 2:length(dow$dji)

# (these are the ending values for each daily return)
dow <- dow[k, ]

# Confirm dow and lag have the same number of observations
length(dow$dji)
length(lag)

#4. daily returns
dow$ret <- dow$dji / lag - 1
dow <- na.omit(dow)

#5. inspect the return data

summary(dow$ret)
#dow[dow$ret == min(dow$ret), ]
#dow[dow$ret == max(dow$ret), ]

#6, the unusual obs

# Logical condition: TRUE for any row where the return is infinite
dow$ret == Inf

# Use the condition in the rows position to display the problem observation
dow[dow$ret == Inf, ]

#7. examining surrounding dates
check_dates <- as.Date(c("2008-04-01", "2008-04-02", "2008-04-03"))

# Keep only rows whose date appears in check_dates
dow[dow$date %in% check_dates, ]

#8. ermoving incorrect obs.

bad_dates <- as.Date(c("2008-04-01", "2008-04-02"))

# ! flipping TRUE/FALSE, so this keeps every row EXCEPT the bad dates
ret <- dow[!(dow$date %in% bad_dates), ]

#9. final
summary(ret$ret)
