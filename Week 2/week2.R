## Week 2 Programming Assignment

## download sample data here: https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip

## PART 1 ###############################

## Load part 1
source("pollutantmean.R")

cat("\n\npollutantmean-demo.html testing...\n\n")

print(pollutantmean("specdata", "sulfate", 1:10))
print("## [1] 4.064128")

print(pollutantmean("specdata", "nitrate", 70:72))
print("## [1] 1.706047")

print(pollutantmean("specdata", "nitrate", 23))
print("## [1] 1.280833")

## PART 2 ###############################

## Load part 2
source("complete.R")

cat("\n\ncomplete-demo.html testing...\n\n")

print(complete("specdata", 1))
writeLines("
##   id nobs
## 1  1  117
")

print(complete("specdata", c(2, 4, 8, 10, 12)))
writeLines("
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
")

print(complete("specdata", 30:25))
writeLines("
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
")

print(complete("specdata", 3))
writeLines("
##   id nobs
## 1  3  243
")

## PART 3 ###############################

## Load part 3
source("corr.R")

cat("\n\ncorr-demo.html testing...\n\n")

##source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
print(head(cr))
print("## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814")

print(summary(cr))
writeLines("
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
")

cr <- corr("specdata", 400)
print(head(cr))
print("## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860")

print(summary(cr))
writeLines("
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313
")

cr <- corr("specdata", 5000)
print(summary(cr))
writeLines("
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
")

print(length(cr))
print("## [1] 0")

cr <- corr("specdata")
print(summary(cr))
writeLines("
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
")

print(length(cr))
print("## [1] 323")
cat("\n\n***End of testing***\n\n")