#### Thinking about "practical" vs. "statistical" significance
#### Let's show the influence of sample size on the p-value for a t-test
#### when the effect size is extremely small (~1% difference)

set.seed(22)

mass_dietA_smallNs <- rnorm(10, 20, 2)
mass_dietB_smallNs <- rnorm(10, 20.2, 2)

## Do the distributions "look" different?
#hist(mass_dietA_smallNs, breaks=10)
#hist(mass_dietB_smallNs, breaks=10)
  

df_smallNs <- data.frame(c(mass_dietA_smallNs,
                           mass_dietB_smallNs),
                         c(rep("A",10),rep("B",10)))# construct a data frame for analysis

colnames(df_smallNs) <- c("mass","diet")

boxplot(df_smallNs$mass~df_smallNs$diet)

tapply(df_smallNs$mass, INDEX=df_smallNs$diet, FUN=mean)



## Repeat the process, but with a very large N (10000)
mass_dietA_largeNs <- rnorm(10000, 20, 2)
mass_dietB_largeNs <- rnorm(10000, 20.2, 2)

## Do the distributions "look" different?
hist(mass_dietA_largeNs, breaks=50)
hist(mass_dietB_largeNs, breaks=50)


df_largeNs <- data.frame(c(mass_dietA_largeNs,
                           mass_dietB_largeNs),
                         c(rep("A",10000),rep("B",10000)))# construct a data frame for analysis

colnames(df_largeNs) <- c("mass","diet")

boxplot(df_largeNs$mass~df_largeNs$diet)

tapply(df_largeNs$mass, INDEX=df_largeNs$diet, FUN=mean)






## What if we run formal hypothesis tests?

t.test(mass_dietA_smallNs, mass_dietB_smallNs) # p=.59

t.test(mass_dietA_largeNs, mass_dietB_largeNs) # p=6.726e-14

## we can always store our test result as an object for later use
t_result <- t.test(mass_dietA_largeNs, mass_dietB_largeNs)

str(t_result)
t_result$statistic
t_result$p.value




















