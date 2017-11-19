My name is: Ali Ahi; date: 19.11.2017; 
This is the third exercise of the course, focused on logistic regression.

math <- read.table("C:/Data/IODS-project/student-mat.csv", sep=";", header=TRUE)

dim(math)
str(math)

por <- read.table("C:/Data/IODS-project/student-por.csv", sep=";", header=TRUE)

dim(por)
str(por)

library(dplyr)

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))

colnames(math_por)
glimpse(math_por)
