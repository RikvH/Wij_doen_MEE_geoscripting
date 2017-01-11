
# Wij doen MEE
# Dillen Bruil and Rik van Heumen
# 11-1-2017

######################################
# Function to check whether a year
# is a leap year or not, not including
# constraints
######################################

checkleap <- function(year){
  # Function to check leap year or not
  # year = the year you want to check (numeric)
  if((year %% 4 != 0)){
    FALSE
  } else if((year %% 100 != 0)){
    TRUE
  } else if((year %% 400 != 0)){
    FALSE
  } else
    TRUE
}
