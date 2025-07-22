#### DSCI 626 - Understanding sampling error and parameter estimate uncertainty

#### Using simulation to find the minimum sample size that will let you
#### estimate the population mean with a minimum level of uncertainty

## Example scenario: Measuring protein mass in individual cells
## - Ultimately interested in comparing across cell lines
## - How many cells for a particular line do you need to measure to 
##   ensure that the estimated mean will be within 2 pg of the true mean?

## First, you have a general, rough idea about the 
## variation (sd) and mean in order to simulate a population
set.seed(13)
cell_pop_1 <- rnorm(n=1000000, mean=35, sd=5)
cell_pop_1_mean <- mean(cell_pop_1)

## For sample sizes from 2 to 200, by increments of 2,
## we want to take 100 samples at each sample size and then determine
## the proportion of samples at each size that have a mean within 2 pg
## of the true population mean (34.99715)

samp_sizes <- seq(from=2, to=200, by=2) # our vector of sample sizes
prop_within2pg <- vector(length=length(samp_sizes)) # pre-allocate a vector

for (i in 1:length(samp_sizes)) {
  #for every iteration (sample size) we store the matrix of 100 samples 
  rep_matrix <- replicate(n=100, 
                          expr=sample(cell_pop_1, size=samp_sizes[i]))
  
  #and we store a vector of (column-wise) means for the 100 samples
  rep_means <- apply(rep_matrix, MARGIN=2, FUN=mean)
  
  #finally we calculate the prop. of 100 samples for which the mean
  #is within 2 pg of the true population mean
  prop_within2pg[i] <- sum(rep_means <= cell_pop_1_mean+2&
                           rep_means >= cell_pop_1_mean-2)/100
}

## Plot the relationship between sample size and reliability of estimation
plot(prop_within2pg~samp_sizes, cex=0.75, lwd=2,
     xlab="sample size", 
     ylab="proportion of replicate means within 2 pg of true mean")
abline(h=0.95, lty=2, col="blue")

data.frame(samp_sizes,prop_within2pg)


#### Challenge:
#### The above simulation was for 1 particular scenario,
#### in which we assumed the population std. dev. was 5.

#### Run 6 simulations as above, with std. devs. of 1, 3, 5, 7, 9 and 11.
#### Make a panel of six plots, one for each assumed std. dev.
#### in the same plot space (2 cols, 3 rows).

#### How does the population variation (std. dev.) affect your needed
#### level of replication to get a mean estimate within 2 pg of the true
#### population parameter?











