rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    df <- read.csv("/home/kyrierose/Desktop/R_Workspace/JHU_R_Programming_Assignments/outcome-of-care-measures.csv",header = T, colClasses = "character")
    
#To check valid state    
    if (state %in% df$State != TRUE)
        stop("invalid state")
#TO check valid outcome    
    x <- c("heart attack","heart failure","pneumonia")
    if (outcome %in% x != TRUE)
        stop("invalid outcome")

    df[, 11] <- as.numeric(df[, 11]) # heart attack
    df[, 17] <- as.numeric(df[, 17]) # heart failure
    df[, 23] <- as.numeric(df[, 23]) # pneumonia    
    
#To set the respective column
    col_index = 0
    if(outcome == "heart attack")
        col_index = 11
    else if( outcome == "heart failure")
        col_index = 17
    else if(outcome == "pneumonia")
        col_index =23
    
    number_gen(df, col_index, state, num)
}

number_gen <- function(df, col_num, state, num) {
    state_df <- df[df[, 7]==state, ]
    # get "attack", "failure" and "pneumonia" vector
    array_col <- state_df[, col_num]
    len <- dim(state_df[!is.na(array_col), ])[1]
    if (num == "worst") {
        rank <- rank_ind(state_df, array_col, len)
    } else if (num > len) {
        rank <- NA
    } else {
        rank <- rank_ind(state_df, array_col, num)
    }
    result <- rank
    return(result)
}

rank_ind <- function(state_df, array_col, num) {
    result <- state_df[, 2][order(array_col, state_df[, 2])[num]]
    return(result)
}
