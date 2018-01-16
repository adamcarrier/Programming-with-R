pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of the length 1 indicating
  ## the location of the CSV file
  
  ## 'pollutant' is a character vector of length 1 indicating 
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list 
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## download sample data here: https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
  
  # if current working directory, add cwd directory notation
  if( directory == "specdata") {
    directory <- ("./specdata/")
  }

  mean_polldata <- c() # global var to hold data frame
  specdatafiles <- as.character( list.files( directory ) )
  specdatapaths <- paste( directory, specdatafiles, sep = "")

  for(i in id) {
    curr_file <- read.csv( specdatapaths[i], header = T, sep = ",")
    head( curr_file )
    remove_na <- curr_file[ !is.na( curr_file[, pollutant] ), pollutant ]
    mean_polldata <- c( mean_polldata, remove_na )
  }
  
  return( mean( mean_polldata ) )
}