
# Exercise 4: Data wrangling for the next exercise


hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
dim(hd)
summary(hd)

str(gii)
dim(gii)
summary(gii)

colnames(hd)[1:8] <- c("HDI.rank", "country", "HDI.index", "life_expect", "exp_edu", "mean_edu", "GNI_capita", "GNI-HDI")

colnames(gii)[1:10] <- c("GII.rank", "country", "GII_index", "mortal_ratio", "birth_rate", "rep_parlem", "edu2F", "edu2M", "laborF", "laborM") 


library(dplyr)

gii <- mutate(gii, edu2_ratio = (edu2F/edu2M))

gii <- mutate(gii, labor_ratio = (laborF/laborM))

library(ggplot2)

join_by <- c("country")

human <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))
  
colnames(human)

glimpse(human)

write.csv(human, "c:/Data/IODS-project/human.csv")
