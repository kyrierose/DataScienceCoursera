pollutantmean <- function(directory, pollutant, id=1:332){
    library(readr)
    count <- 0 
    sum <- 0
    for (index in id) { 
        # TO GET CORRECT FILENAME
        if (index < 10){
            final_loc = sprintf("%s/00%d.csv",directory,index)
            xid = read.csv(final_loc)
        }else if(index >= 10 & index < 100){
            final_loc = sprintf("%s/0%d.csv",directory,index)
            xid = read.csv(final_loc)
        }else{ 
            final_loc = sprintf("%s/%d.csv",directory,index)
            xid = read.csv(final_loc)
        }
        # TO GET MEANS OF RESPECTIVE COLUMNS
        x = xid[pollutant]
        count = count + colSums(!is.na(x))
        sum = sum + colSums(x, na.rm = T)
    }
    #To return mean
    sum/count
}
