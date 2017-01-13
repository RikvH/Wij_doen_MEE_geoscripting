
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
  
  # Checks whether input is numeric
  
  if (is.numeric(year)){
    
    # Checks whether input is an integer
    if (year == round(year)){
      
      # Check if the year falls within Gregorian calender  
      if(year >= 1582){
        checkleap(year)
        
      } else
        print(paste(year, "is out of the valid range"))
      
    } else
      # Throw a warning
      warning("Argument of type integer is expected")
    
  } else
    # Throw a warning
    warning("Argument of class numeric is expected")
}


