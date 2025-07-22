#### Basic correlation analysis
set.seed(15)

#### Two random samples of 50,
#### from norm. dist. with mean=65 and sd=5
x_var <- rnorm(n=50, mean=65, sd=5)
y_var <- rnorm(n=50, mean=65, sd=5)

#### Should not be any significant covariance (or correlation)
plot(x_var, y_var)
cor(x_var, y_var)


#### How might we introduce a positive corr./cov.?
x_var_poscor <- sort(x_var)
y_var_poscor <- sort(y_var)


plot(x_var_poscor, y_var_poscor)


#### How might we introduce a negative corr./cov.?
x_var_negcor <- sort(x_var, decreasing = TRUE)
y_var_negcor <- sort(x_var, decreasing = FALSE)
  
  
plot(x_var_negcor, y_var_negcor)



#### What about hypothesis tests? (H0s and HAs)

## two-sided
cor.test(x_var, y_var)
cor.test(x_var_negcor, y_var_negcor)


## one-sided (assuming positive relationship)
cor.test(x_var_negcor, y_var_negcor,
         alternative = "less")




#### Revisit the data set "Gacu_lipids2_data.tsv" from PS1.
#### Test for a positive correlation between TAGs and Mass.
lipids <- read.delim("../Graded_Assignments/PS_1/Gacu_lipids2_data.tsv",
                     header=TRUE)

head(lipids)

#### Also, try changing the scale (by 10 or 20x) for TAGs or Mass,
#### and calculate the correlation and covariance before and after.





