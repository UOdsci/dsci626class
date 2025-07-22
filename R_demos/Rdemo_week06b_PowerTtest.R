###### Basic simulation-based power analysis for a two-sample t-test


#### 1. Experiment with 2 groups: Mean mass for group 1 = 60 mg
####    (std. dev. = 5 mg)

#### 2. Want to have power to reject null for mean diff. of 2%
####    (alt. hyp. is group 1 individuals are heavier)

#### 3. Simulate 1000 data sets and plot Power (y-axis) vs N (x-axis)
####    (sample sizes in each group 5 to 150, by 5)
####    (assume alpha = 0.05)


## For x-axis: vector of sample sizes (for loop) - 5 to 150
## For y-axis: vector of power values from simulation

## Construct a df with a pre-allocated column for power
power_df <- data.frame(seq(from=5, to=150, by=5),
                       vector(length=length(seq(from=5, to=150, by=5))))

colnames(power_df) <- c("sample_size","power")


## Within the for loop, we iterate over Ns, simulating 1000 tests for each N
set.seed(342)

for(i in 1:length(power_df$sample_size)) {
    pvals <- replicate(n=1000,
                       t.test(rnorm(n=power_df[i,1], mean=60, sd=5),
                              rnorm(n=power_df[i,1], mean=58.8, sd=5),
                              alternative = "greater")$p.value)
  
    #power calc.
    power_df[i,2] <- sum(pvals<0.05)/length(pvals)
}


plot(x=power_df$sample_size, y=power_df$power, ylim=c(0,1),
     ylab="Power", xlab="Per-group sample size")

abline(h=0.8, lty="dashed")




## Okay, so even with Ns of 150 we don't get to a power of 0.8
## Let's repeat the simulations, but with group std. devs of 3.

## Also, include 3 additional power relationships to the plot,
## one for alpha=0.01, one for alpha=0.005, and one for alpha=0.001