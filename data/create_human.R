# Ali Ahi
# This the exercise on Dimensionality and reduction techniques using human datase developed by the United Nations.
# The original data source can be found here: http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt

# Exercise 5: Dimensionality reduction techniques

# Fisrt, we read the data into R. 
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

library(stringr)
library(dplyr)

# Let us look at the structure of the data and the names of the variables:
str(human)
dim(human)
names(human)

# By looking the structure of the data, we can see that the variable GNI is read as factor in R not number:
str(human$GNI)

# We now mutate GNI from factor to number by replacing "," with "", and then use as.number function.

str_replace(human$GNI, pattern = ",", replace = "") %>% as.numeric(human$GNI)

# Let us now exclude unneeded variabes, keeing only the following columns in the code

keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

human <- select(human, one_of(keep))

# Now we remove all rows with missing values
complete.cases(human)
data.frame(human[-1], comp = complete.cases(human))

# filtering out all rows with NA values
human_ <- filter(human, complete.cases(human))

dim(human_)

# Removing the observation which relate to regions

# first looking at the last ten rows, as the regions names are there.
tail(human, 10)
# We can see that the last seven rows include the region names.

# now we creat object "last" by defining it as the last 7 rows.
last <- nrow(human) - 7

# Now we choose everythin until the last 7 observation
human_ <- human[1:last, ]

# Now we add countries as rownames
rownames(human_) <- human_$Country

human_ <- select(human, -Country)



