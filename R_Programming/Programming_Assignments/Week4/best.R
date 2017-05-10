best <- function(state, outcome){
    input_data <- read.csv("/home/kyrierose/Desktop/R_Workspace/JHU_R_Programming_Assignments/outcome-of-care-measures.csv",header = T, colClasses = "character")
    
#To check valid state    
    if (state %in% input_data$State != TRUE)
        stop("invalid state")
#TO check valid outcome    
    x <- c("heart attack","heart failure","pneumonia")
    if (outcome %in% x != TRUE)
        stop("invalid outcome")
#To set the respective column
    col_index = 0
    if(outcome == "heart attack")
        col_index = 11
    else if( outcome == "heart failure")
        col_index = 17
    else if(outcome == "pneumonia")
        col_index =23
    #To convert into numeric data type 
    input_data[,11] = as.numeric(input_data[,11])
    input_data[,17] = as.numeric(input_data[,17])
    input_data[,23] = as.numeric(input_data[,23])
#To get data respective of states
    state_arr <- input_data[input_data[, 7]==state, ]
#To get array of outcomes
    outcome_arr <- state_arr[, col_index]
#To find minimun value in outcomes array    
    min <- min(outcome_arr, na.rm=T)
#To get index of all minimum values
    min_index <- which(outcome_arr == min)
#To get Hospital names corresponding min index values
    hospital_name <- state_arr[min_index, 2]
    
    print(hospital_name)
}