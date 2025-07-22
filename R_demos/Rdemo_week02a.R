#### Practice R coding


## Operations and assignment

3+3
4+1


value1 <- 3+3

value1


## Vectors
vec_1 <- c(1, 5, 7.5, 7)#using "c"
vec_2 <- 0:10#using ":"
vec_3 <- c("one","two","three") #a vector of class "character"

class(vec_1)
class(vec_3)

## Indexing of vectors
vec_1[1]

vec_1[1:3] #index a sequence with ":"

vec_1[c(1,3)] #index multiple, non-consec. values with "c"


## Vectorized operations
vec_1+1 #adds 1 to each element in the vector



## Some useful functions that use a vector as the main parameter
sum(vec_1)
mean(vec_1)
median(vec_1)
var(vec_1)
length(vec_1)
max(vec_1)
range(vec_1)
summary(vec_1)

range(vec_1)[2] #index the 2nd element in the 
               #output of range(), which is the 
               #maximum value in vec_1




