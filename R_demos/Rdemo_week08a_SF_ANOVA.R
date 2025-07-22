#### Basic, single-factor ANOVA in R

## Can first use lm() to look at factor level effects and the ANOVA
## hypothesis test

head(iris)
boxplot(iris$Petal.Length ~ iris$Species)


iris_petal_lm <- lm(Petal.Length ~ Species, iris)

summary(iris_petal_lm)

#factor levels
levels(iris$Species)

#species means
tapply(iris$Petal.Length, iris$Species, mean)

#no intercept?
iris_petal_lm_noint <- lm(Petal.Length ~ 0 + Species, iris)

summary(iris_petal_lm_noint)




## Can use aov() and anova() functions to show the ANOVA table

iris_petal_aov <- aov(Petal.Length ~ Species, iris)

anova(iris_petal_aov)



## Finally, do Tukey's post-hoc comparisons
library(multcomp)

summary(glht(iris_petal_aov, linfct=mcp(Species = "Tukey")))



#### For more practice - using R's mtcars data set,
#### run an ANOVA to test for an effect of cylinder number on mpg



