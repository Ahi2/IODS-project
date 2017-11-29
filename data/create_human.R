
# Exercise 4: Data wrangling for the next exercise

# Reading the "Human development" and "Gender inequality" datasets into R. 

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Exploring the datasets: looking at the structure and dimensions of the data. 

str(hd)
dim(hd)
summary(hd)

# Human development (HD) datasets has 195 observations (i.e., rows, each of which is a country) and 8 variables.

str(gii)
dim(gii)
summary(gii)

# Gender inequality (gii) datasets has 195 observations (i.e., rows, each of which is a country) and 12 variables.


# Now, let us rename the variables to make them shorter and easier to read.

colnames(hd)[1:8] <- c("HDI.rank", "country", "HDI.index", "life_expect", "exp_edu", "mean_edu", "GNI_capita", "GNI-HDI")

colnames(gii)[1:10] <- c("GII.rank", "country", "GII_index", "mortal_ratio", "birth_rate", "rep_parlem", "edu2F", "edu2M", "laborF", "laborM") 

# We now create two new variables: the ratio of Female and Male populations and the ratio of labour force participation of females and males in each country.

library(dplyr)

gii <- mutate(gii, edu2_ratio = (edu2F/edu2M))

gii <- mutate(gii, labor_ratio = (laborF/laborM))

#Join together the two datasets using the variable Country as the identifier, and call the new dataset as "human".

library(ggplot2)

join_by <- c("country")

human <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))

# looking at the colnames
colnames(human)
glimpse(human)

# Saving the dataset
write.csv(human, "c:/Data/IODS-project/human.csv")

# Looking at the strucutre and dimensions of the dataset
str(human)
dim(human)

# please ignore the following, as it belongs to the next week exercise :) 

#human <- mutate(human, GNI_capita = as.numeric(human$GNI_capita))

#human$GNI_capita
#sub(".","",human$GNI_capita, fixed = T)
#human$GNI_capita <-sub(".","",human$GNI_capita, fixed = T)
#human$GNI_capita <- as.numeric(human$GNI_capita)
#str(human$GNI_capita)

#str(human)
#dim(human)

