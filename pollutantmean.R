pollutantmean <- function(directory = "/home/allan/Documents/R workspace/specdata/", pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files, default: "/home/allan/Documents/R workspace/spacedata/"
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)

    y <- NULL    

    for(i in id) {
        fileName <- get_fileName(directory, i)
        x <- read.csv(fileName)
        y <- c(y, x[[pollutant]])
    }

    return(mean(y, na.rm = TRUE))
}

get_fileName <- function(directory, n) {
    if (n < 10) {
        return(paste(directory, "00", n, ".csv", sep=""))
    } else if (n > 9 & n <100) {
        return(paste(directory, "0", n, ".csv", sep=""))
    } else {
        return(paste(directory, n, ".csv", sep=""))
    }
}
