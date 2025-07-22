#### DSCI 626 - Understanding sampling distributions
#### (Using the replicate() function to simulate the sampling process)


set.seed(65)

#First, make a hypothetical "population" and visualize the distribution

pois_pop <- rpois(n=100000, lambda=8)
length(pois_pop)
mean(pois_pop)
var(pois_pop)


#Use the replicate() function to take 500 samples of size 100
pois_samps <- replicate(n=500, expr=sample(pois_pop, size=100,
                                           replace=FALSE))

dim(pois_samps)
class(pois_samps)
head(pois_samps)


#Calculate the 500 different sample means using ?
pois_means <- colMeans(pois_samps)
#pois_means <- apply(pois_samps, MARGIN=2, FUN=mean)


#Look at distribution of sample means and summarize it
hist(pois_means)
mean(pois_means)

#sd(pois_means)/sqrt(500)

#NOTE: In class I said that we needed to divide by sqrt(500) to get the
#      "standard error of the mean," but that's not quite right.

sd(pois_means) # is technically the std. error of the mean, 
               # but we usually only have one sample.

# Our approximation for the standard error of the mean from one sample could be:
sd(pois_samps[,1])/sqrt(100) #0.287692


#### As an exercise: Calc. a bootstrap (500) standard error of the mean from one sample
####                 of the pois_samps samples (e.g. the first sample)

pois_samps[,1]


pois_bt <- replicate(n=500, expr=sample(pois_samps[,1], size=100,
                                        replace=TRUE))

hist(colMeans(pois_bt))
mean(colMeans(pois_bt))
sd(colMeans(pois_bt)) #0.2757311



