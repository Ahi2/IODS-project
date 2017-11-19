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

colnames(math_por)

alc <- select(math_por, one_of("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

notjoined_columns

for(column_name in notjoined_columns) {
  two_columns <-  select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else {
    alc[column_name] <- (first_column)
  }
}

glimpse(alc)

library(ggplot2)

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)



  