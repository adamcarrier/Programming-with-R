best <- function(state, outcome) {
  ## Read outcome data
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # convert character data to numeric, for later calculating min
  outcomedata[, 11] <- suppressWarnings(as.numeric(outcomedata[, 11])) # "heart attack"
  outcomedata[, 17] <- suppressWarnings(as.numeric(outcomedata[, 17])) # "heart failure"
  outcomedata[, 23] <- suppressWarnings(as.numeric(outcomedata[, 23])) # "pneumonia"
  
  # Create a list of valid outcomes
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  ## Check that state and outcome are valid
  if (!(state %in% unique(outcomedata$State))) stop("invalid state")
  
  if (!(outcome %in% outcomes)) stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death rate
  col <- c(11, 17, 23)[match(outcome, outcomes)] # get the column index that matches outcome
  bestrowindex <- which.min(outcomedata[outcomedata$State == state, col]) # get the min row index as taken from the subsetted state data, not all rows
  statedata <- subset(outcomedata, outcomedata$State == state ) # get subsetted state data rows
  statedata[bestrowindex,2] # output column #2 "Hospital.Name" using index found using which.min
}