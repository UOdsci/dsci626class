#### R script to evaluate the Mercer and Hall wheat dataset

## 1. Read in the data
mhw_data <- read.delim("mhw.csv", sep=",")

head(mhw_data)
dim(mhw_data)


## 2. Some basic plots

# Histograms
hist(mhw_data$grain)
hist(mhw_data$straw)

# Scatterplot of grain vs. straw yields
plot(mhw_data$grain ~ mhw_data$straw,
     cex=0.5, ylab="grain yield (lbs)",
     xlab="straw yield (lbs)")


## 3. Perform OLS to test the null hypothesis of slope == 0

# Define the linear model
ols_model <- lm(mhw_data$grain ~ mhw_data$straw)

# Residuals plot
plot(ols_model$residuals, ols_model$fitted.values, 
     xlab="predicted y", ylab="residuals")


# Hypothesis tests
summary(ols_model)
cor.test(x=mhw_data$straw,
         y=mhw_data$grain)


## 4. Get relevant parameter estimates for power simulations 

# Mean yields for grain and straw
mean(mhw_data$grain)
mean(mhw_data$straw)

# Standard deviations for grain and straw
sd(mhw_data$grain)
sd(mhw_data$straw)

# Correlation coefficient (95% confidence interval)
cor.test(x=mhw_data$straw, y=mhw_data$grain)$conf.int
#0.6859911 , 0.7683046



