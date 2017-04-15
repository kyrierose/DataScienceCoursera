# R Programming (JHU) Coursera
## Week 1 Quiz : As of April 15th,2017

Question 1
----------
R was developed by statisticians working at
### Answer 
The University of Auckland

Question 2
----------
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition? Select all that apply.
### Answer
The freedom to restrict access to the source code for the software.</br>
The freedom to sell the software for any price.</br>
The freedom to prevent users from using the software for undesirable purposes.

Question 3
----------
In R the following are all atomic data types EXCEPT: (Select all that apply)
### Answer
List</br>
Matrix</br>
Array</br>
Table</br>
Data Frame

Question 4
----------
If I execute the expression x <- 4L in R, what is the class of the object x as determined by the class() function?
### Answer
Integer

Question 5
----------
What is the class of the object defined by x <- c(4, TRUE)?
### Answer
Numeric

Question 6
----------
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?
### Answer
A matrix with 2 columns and 3 rows

Question 7
----------
A key property of vectors in R is that
### Answer
Elements of a vector all must be of the same class

Question 8
----------
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply.
### Answer
A character vector containing the letter "a".</br>
A character vector of length 1.

Question 9
----------
Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
### Answer
A numeric vector with elements 3, 4, 5, 6.

Question 10
----------
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this? Select all that apply.
### Answer
x[x >= 11] <- 4</br>
x[x > 10] <- 4

Question 11
-----------
In the dataset provided for this Quiz, what are the column names of the dataset?

### Answer
Ozone, Solar.R, Wind, Temp, Month, Day

```R
# install package if doesnt exist 
install.packages("data.table")
library("data.table")

# Reading in data
data <- fread('hw1_data.csv')

# Column names of the dataset 
names(data)

```

Question 12
-----------
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

### Answer
	  Ozone Solar.R Wind Temp Month Day
	1    41     190  7.4   67     5   1
	2    36     118  8.0   72     5   2

```R
# First two rows 
data[1:2,]
```

Question 13
-----------
How many observations (i.e. rows) are in this data frame?

### Answer
153

```R
nrows(data)
```

Question 14
-----------
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

### Answer

	   Ozone Solar.R Wind Temp Month Day
	152    18     131  8.0   76     9  29
	153    20     223 11.5   68     9  30

```R
tail(data, 2)
```

Question 15
-----------
What is the value of Ozone in the 47th row?

### Answer
21

```R
quiz_data[47, 1]
```

Question 16
-----------
How many missing values are in the Ozone column of this data frame?

### Answer
37

```R
# Going back to data.frame because dont it hasnt been taught yet in this specialization
data = read.csv('hw1_data.csv')
sub = subset(data, is.na(Ozone))
nrow(sub)

```

Question 17
-----------
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

### Answer
42.1

### Explanation
The 'mean' function can be used to calculate the mean.

```R
data = read.csv('hw1_data.csv')
mean(data[,1], na.rm =T)
```

Question 18
-----------
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

### Answer
212.8

```R
data= read.csv('hw1_data.csv')
sub = subset(data, Ozone > 31 & Temp > 90, select = Solar.R)
apply(sub, 2, mean)
```

Question 19
-----------
What is the mean of "Temp" when "Month" is equal to 6?

### Answer
79.1

### Explanation

```R
data = read.csv('hw1_data.csv')
sub = subset(data, Month == 6, select = Temp)
mean(sub[,1],na.rm =T)
```

Question 20
-----------
What was the maximum ozone value in the month of May (i.e. Month = 5)?

### Answer
115

### Explantion

```R
data = read.csv('hw1_data.csv')
sub = subset(data, Month == 5 , select = Ozone)
max(sub[,1], na.rm = T)
```
