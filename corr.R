corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  source("complete.R")
  files <- list.files(directory, full.names = T)
  complete <- complete(directory)
  thresh <- complete$nobs >= threshold
  complete <- complete[thresh,]$id
  data = c()
  for (i in complete){
    file = read.csv(files[i])
    file = file[complete.cases(file),]
    data = c(data, cor(file$nitrate, file$sulfate))
  }
  data
}