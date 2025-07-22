#####################################################################################
## R demonstration of CLT and approximate normal distribution; DSCI 626 S2025
#####################################################################################

## Simulated genetic architecture for a quantitative trait (mallard bill length)
## Can we get a trait that *looks* normally distributed from only 5 genes?
set.seed(75)


## Can use rbinom() to get us random single-locus genotypes for 500 individuals.
## We want how many "successes" result from 2 trials (2 alleles per diploid genotype).
## Remember, with 2 trials we can get 0, 1 or 2 "successes."

locus_1 <- rbinom(n=500, size=2, prob=0.5)#a vector of diploid genotypes

## Genetic contributions to phenotype
## Add 1 cm for "AA," 1.5 cm for "Aa," and 2 cm for "aa."
contributions_1 <- ifelse(locus_1==2, 0+1,
                          ifelse(locus_1==1, 0+1.5, 0+2))

locus_2 <- rbinom(n=500, size=2, prob=0.5)#a vector of diploid genotypes
contributions_2 <- ifelse(locus_2==2, 0+1,
                          ifelse(locus_2==1, 0+1.5, 0+2))

locus_3 <- rbinom(n=500, size=2, prob=0.5)#a vector of diploid genotypes
contributions_3 <- ifelse(locus_3==2, 0+1,
                          ifelse(locus_3==1, 0+1.5, 0+2))

locus_4 <- rbinom(n=500, size=2, prob=0.5)#a vector of diploid genotypes
contributions_4 <- ifelse(locus_4==2, 0+1,
                          ifelse(locus_4==1, 0+1.5, 0+2))

locus_5 <- rbinom(n=500, size=2, prob=0.5)#a vector of diploid genotypes
contributions_5 <- ifelse(locus_5==2, 0+1,
                          ifelse(locus_5==1, 0+1.5, 0+2))


contribs <- data.frame(contributions_1, contributions_2,
                       contributions_3, contributions_4,
                       contributions_5)


phenotype_values <- rowSums(contribs)
phenotype_values_2 <- apply(contribs, MARGIN = 1, FUN=sum)


## Finally, let's plot the values
hist(phenotype_values)






#### NOTE: Technically the above trait variable is not strictly continuous,
####       based on way we set up the simulation, but you get the idea.








