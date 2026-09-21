#5. Functions
#creating objs

# Named numeric vector
vertiport_demand <- c(NYC = 1240, Dallas = 680, Miami = 515)

# Character vector
vlm_models <- c("CLIP", "BLIP", "Qwen")

# Logical vector
model_evaluated <- c(TRUE, TRUE, FALSE)

# Factor (ordered categories, different internal structure than a char vector)
demand_tier <- factor(c("high", "medium", "medium"),
                      levels = c("low", "medium", "high"))

# Data frame
model_scores <- data.frame(
  model     = vlm_models,
  accuracy  = c(0.71, 0.66, 0.74),
  evaluated = model_evaluated
)

# List holding a mix of the above
project_notes <- list(
  cities   = names(vertiport_demand),
  n_models = length(vlm_models),
  scores   = model_scores
)

names(vertiport_demand)[2] <- "Dallas_Tx"


#2. examine the env and obj structure

ls()

str(vertiport_demand)
str(model_scores)
str(vlm_models)
str(demand_tier)


#3. Work with names and length

names(model_scores)
names(model_scores)[2] <- "accurate"
names(model_scores)


length(vertiport_demand)   
length(vlm_models)       
length(demand_tier) 
length(model_scores)     
length(project_notes)

#4. combining and display

# Combine text with a single stored value
msg1 <- paste("This project evaluates", length(vlm_models), "vision-language models.")

# Combine several values into one readable line
msg2 <- paste("Top demand city:", names(vertiport_demand)[1],
              "with", vertiport_demand[1], "estimated trips.")

print(msg1)

print(msg2)

#5. remove selected objs

rm(model_evaluated)
ls()
temp_a <- 1
temp_b <- 2
temp_c <- 3

my_objects <- ls()
my_objects

rm(list = grep("^temp_", ls(), value = TRUE))

ls()  

#6. clear the env
rm(list = ls())

ls()
