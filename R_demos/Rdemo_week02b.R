#### Practice R coding 2

## install packages
#install.packages("ape")

## loading packages
library(ape)


## list

vec_1 <- c(1,2,3)

vec_2 <- c("one","two")

vec_3 <- NA


list_1 <- list(vec_1, vec_2, vec_3)
list_1

list_1[[2]][2] #index 2nd value of 2nd list item

str(list_1) #"structure" function


## Data frames

head(iris)
class(iris)

iris$Species
class(iris$Species)
levels(iris$Species)


new_iris <- data.frame(iris$Sepal.Length,
                       iris$Species)


colnames(new_iris)
colnames(new_iris) <- c("Sep_Len","Spec") #rename columns

new_df <- data.frame(rnorm(20,0,1),
                     rnorm(20,500,10),
                     rpois(20,15))

colnames(new_df) <- c("norm1","norm2","pois1")
head(new_df)

## What happens if we try this with vectors of
## different length?

new_df <- data.frame(rnorm(50,0,1),
                     rnorm(20,500,10),
                     rpois(20,15))

## Plots
plot(iris$Sepal.Length, iris$Sepal.Width,
     xlab="sepal length", ylab="sepal width",
     cex=0.75, main="iris sepal width vs length",
     col=iris$Species)

plot(iris$Sepal.Length, iris$Sepal.Width,
     xlab="sepal length", ylab="sepal width",
     cex=0.75, main="iris sepal width vs length",
     col=ifelse(iris$Species=="setosa","blue",
                ifelse(iris$Species=="versicolor","red","green")))


boxplot(iris$Sepal.Length~iris$Species,
        col=c("blue","red","green"))











