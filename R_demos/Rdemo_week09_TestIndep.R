#### A G-test of independence for a 2x2 contingency table in R

## We sampled two dog breeds (Siberian huskies and Border collies), and
## we are considering whether eye color is independent of dog breed

## Construct a table from an extended data frame
dog_df <- data.frame(c(rep("husky",529), rep("collie",414)),
                     c(rep("blue",342), rep("brown",187), 
                       rep("blue",90), rep("brown",324)))


colnames(dog_df) <- c("breed","eyecolor")

dog_table <- table(dog_df)


## Do we meet our min. expected count assumption?
## (this is the same as for chi-square goodness-of-fit tests)
chisq.test(dog_table, correct=F)$exp


## Run the hypothesis test using the GTest() function from DescTools package
library(DescTools)

GTest(dog_table)


## What about an odds ratio for this test?!
dog_OR <- ((dog_table[1,1]+0.5)*(dog_table[2,2]+0.5)) /
  ((dog_table[1,2]+0.5)*(dog_table[2,1]+0.5))

dog_OR

1/0.1526773 # ~6.5 times more likely to get blue-eyed huskies

## Finally, we can visualize the cell proportions in what's called a
## "mosaic plot"

library(vcd)

strucplot(dog_table, shade=T, 
          gp = gpar(fill = c(rep("lightblue",2),
                             rep("saddlebrown",2))))



## In-class exercise: Is dog vs. cat preference independent
## of experience living with a dog?
## Construct a table from an extended data frame
pref_df <- data.frame(c(rep("dog",700), rep("cat",300)),
                     c(rep("yes",500), rep("no",200), 
                       rep("yes",200), rep("no",100)))


colnames(pref_df) <- c("pref","lived")

pref_table <- table(pref_df)


## Do we meet our min. expected count assumption?
## (this is the same as for chi-square goodness-of-fit tests)
chisq.test(pref_table, correct=F)$exp


## Run the hypothesis test using the GTest() function from DescTools package

GTest(pref_table)


## What about an odds ratio for this test?!
pref_OR <- ((pref_table[1,1]+0.5)*(pref_table[2,2]+0.5)) /
  ((pref_table[1,2]+0.5)*(pref_table[2,1]+0.5))

pref_OR # ~1.25

## Finally, we can visualize the cell proportions in what's called a
## "mosaic plot"

library(vcd)

strucplot(pref_table, shade=T, 
          gp = gpar(fill = c(rep("mediumslateblue",2),
                             rep("lightcoral",2))))







