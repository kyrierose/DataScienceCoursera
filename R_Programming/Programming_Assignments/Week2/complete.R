complete <- function(directory, id = 1:332){
    library(readr)
    count_total <- c()[length(id)]
    for (index in id) { 
        # TO GET CORRECT FILENAME
        if (index < 10){
            final_loc = sprintf("%s/00%d.csv",directory,index)
            xid = read.csv(final_loc)
        }else if(index >= 10 & index < 100){
            final_loc = sprintf("%s/0%d.csv",directory,index)
            xid = read.csv(final_loc)
        }else{ 
            final_loc = sprintf("%s/00%d.csv",directory,index)
            xid = read.csv(final_loc)
        }
        # TO GET NUMBER OF COMPLETE CASES
        x = !is.na(xid["sulfate"]) & !is.na(xid["nitrate"])
        count <- sum(x[x==TRUE])
        count_total <- c(count_total,count)
    }
    df = data.frame(id,count_total)
    colnames(df) <- c("id","nobs")
    print(df)
}
