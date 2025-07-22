#### Basic, 2x2 factorial ANOVA in R

## Will use a modified version of the "mtcars" R dataset
## Looking at fuel economy as a response to engine configuration and trans.

## Modify mtcars df to simplify for the example
mtcars_simple <- mtcars
mtcars_simple$vs <- as.factor(ifelse(mtcars$vs==0, "V","straight"))
mtcars_simple$am <- as.factor(ifelse(mtcars$am==0, "auto","manual"))


mtcars_simple <- mtcars_simple[,c(1,8,9)]

head(mtcars_simple)


## Run the factorial ANOVA (two different configs to set up the same model)
cars_factorial <- aov(mpg ~ vs + am + vs:am, mtcars_simple) #long-hand formula
cars_factorial_alt <- aov(mpg ~ vs*am, mtcars_simple) #short-hand formula


anova(cars_factorial) # To get the ANOVA table


summary(lm(mpg ~ vs*am, mtcars_simple)) # lm to look at coefficients (effects)


## Can calculate all 4 factor-level-combination means
mtcars_simple$V_trans_comb <- interaction(mtcars_simple$vs,
                                          mtcars_simple$am)

tapply(mtcars_simple$mpg,
       mtcars_simple$V_trans_comb,
       FUN=mean)


## Make an interaction plot

interaction.plot(x.factor=mtcars_simple$vs, 
                 trace.factor=mtcars_simple$am, 
                 response=mtcars_simple$mpg, 
                 xlab="config", trace.label="transmission") 




## Challenge: I said that including error bars 
## (i.e. +/- std. err. of mean) for each group is useful for interpretation.

## Modify the above interaction plot to include those.
## Hint: The segments() function is one way to accomplish this!

