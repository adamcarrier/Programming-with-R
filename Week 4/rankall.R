rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  # convert character data to numeric, for later calculating min
  outcomedata[, 11] <- suppressWarnings(as.numeric(outcomedata[, 11])) # "heart attack"
  outcomedata[, 17] <- suppressWarnings(as.numeric(outcomedata[, 17])) # "heart failure"
  outcomedata[, 23] <- suppressWarnings(as.numeric(outcomedata[, 23])) # "pneumonia"
  
  # Create a list of valid outcomes
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  # Create a named list key for determining the sort method
  sorting <- list("best"=FALSE, "worst"=TRUE, "ranking"=FALSE)
  
  # Store the sort method
  sort <- num
  
  # Store the row number to output
  row <- 1 # default to first row
  
  ## Check that state and outcome are valid
  if (!(state %in% unique(outcomedata$State))) stop("invalid state")
  
  if (!(outcome %in% outcomes)) stop("invalid outcome")
  
  # Set the sort method key
  if (is.numeric(num)) {
    sort = "ranking"
    row = num
  } else {
    sort = num
  }
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  col <- c(11, 17, 23)[match(outcome, outcomes)] # get the column index that matches outcome
  
  # Going to need a split function
}