
# Wij doen MEE
# Dillen Bruil and Rik van Heumen
# 11-1-2017

######################################
# Function to calculate whether a year
# is a leap year or not, dealing with
# constraints
######################################


is.leap <- function(year){
  
  # Function defining and handling constraints
  if (is.numeric(year)){
    # Checks whether input is numeric
    if(year >= 1582){
      # Check if the year falls within Gregorian calender  
      checkleap(year)
    } else
      print(paste(year, "is out of the valid range"))
  } else
    # Throw a warning
    warning("argument of class numeric is expected")
}


