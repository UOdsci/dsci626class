#### Basic OLS analysis
#### Can use the "mtcars" data set as an example:
#### Does car weight influence fuel economy?

head(mtcars)


plot(mtcars$mpg ~ mtcars$wt)


## Set up the linear model
mileage_ols <- lm(mtcars$mpg ~ mtcars$wt)
summary(mileage_ols)

## Assumptions for OLS met?

#histograms to assess bivariate normality
hist(mtcars$mpg, breaks=15)
boxplot(mtcars$mpg)

hist(mtcars$wt)
boxplot(mtcars$wt)


#residual plot (residuals vs. predicted ys)

str(mileage_ols)

plot(mileage_ols$fitted.values, mileage_ols$residuals, 
     xlab="predicted y", ylab="residuals")



## Print out the parameter estimates and the results of our hypothesis test
summary(mileage_ols)

#Do we reject the null hypothesis of no effect (0 slope)
#of car weight on gasoline mileage?


## Can add the OLS line to the scatter plot using abline()
plot(mtcars$mpg ~ mtcars$wt)
abline(mileage_ols)
abline(b=-5.3445, a=37.2851)


#### OLS challenge: Using R's dataset co2, plot and
#### fit an OLS model for July CO2 levels (the y-variable),
#### as a function of year (the x-variable).


as.vector(co2)

# indexing doesn't work (class "ts")
co2[,7]


head(co2)


x <- 1959:1997
y <- co2[seq(7,length(co2),12)]


co2_lm <- lm(y~x)
summary(co2_lm)

plot(x=x, y=y, xlab="year", ylab="CO2 (ppm)")
abline(co2_lm)


## residual plot (looks V-shaped)
## (the relationship between x and y is actually curvilinear with exponential change)
plot(x=co2_lm$fitted.values, y=co2_lm$residuals)





