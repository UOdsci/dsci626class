#### DSCI 626 - Understanding the mean-variance relationship
####            and randomized treatment assignment



#### Week 4 (Thursday) in-class code
#### Demonstrate the positive mean-variance relationship
set.seed(334)

# Random sample of 50 values from a normal dist. with mean 4.5 and std. dev. 1
sample_1 <- rnorm(n=50, mean=4.5, sd=1)
hist(sample_1)

var(sample_1) #1.428183

# Multiply all values in the vector by 100 to shift the mean
sample_2 <- sample_1*100
hist(sample_2)
mean(sample_2)

# Did anything happen to the variance?
var(sample_2) #


# Calculate the CVs

CV_sample1 <- (sd(sample_1)/mean(sample_1))*100
CV_sample1 #25.97591

CV_sample2 <- (sd(sample_2)/mean(sample_2))*100
CV_sample2 #25.97591






#### Week 5 (Tuesday) in-class code
#### Randomly assign treatment or control (balanced design) to 40 experimental units

# One approach
set.seed(345)

#40 ind
inds <- seq(1:40)

#Assign these randomly to "Trt" or "Con"

vec_assigns <- c(rep(0, 20), rep(1, 20))
vec_rand <- sample(vec_assigns)


ifelse(vec_rand==0, "Trt", "Con")

df_rand <- data.frame(inds,
                      ifelse(vec_rand==0, "Trt", "Con"))


#Could also just sample a character vector directly
df_rand <- data.frame(inds,
                      sample(c(rep("Trt", 20), rep("Con", 20))))


colnames(df_rand) <- c("individual", "treatment")




































