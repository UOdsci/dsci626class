#### Effect of a balanced design on the standard error for t
#### ("t" is a test statistic that quantifies the difference
####  between 2 means)

set.seed(432)
## balanced (n=20 for both groups, mean=8, sd=1)
group_1_bal <- rnorm(n=20, mean=8, sd=1)
group_2_bal <- rnorm(n=20, mean=8, sd=1)
t.test(group_1_bal,group_2_bal)$statistic
t.test(group_1_bal,group_2_bal)$stderr
t.test(group_1_bal,group_2_bal)$p.value

## unbalanced (n1=30; n2=10)
group_1_unbal <- rnorm(n=30, mean=8, sd=1)
group_2_unbal <- rnorm(n=10, mean=8, sd=1)
t.test(group_1_unbal,group_2_unbal)$statistic
t.test(group_1_unbal,group_2_unbal)$stderr
t.test(group_1_unbal,group_2_unbal)$p.value





#### Challenge: If you really want to convince yourself, simulate a whole series of
#### different balances for different combined Ns, and plot the t std. errs.
#### (or p-values), when there actually is a difference between groups.


## Conditions for simulation:
## 1. Combined sample sizes (x-axis): 10 to 200, by 10
## 2. 3 different balances: 1:1, ~1:2, ~1:4 (3 different lines on plot)
## 3. Group 1 mean = 10, Group 2 mean = 11, sd for both groups = 2

set.seed(36)

comb_Ns <- seq(10,200,10)

## 1:1 balance
bal_1_1_p <- vector(length=length(seq(10,200,10))) #pre-allocation
bal_1_1_se <- vector(length=length(seq(10,200,10)))

for(i in 1:length(seq(10,200,10))) {
  group_1 <- rnorm(n=comb_Ns[i]/2, mean=10, sd=2)
  group_2 <- rnorm(n=comb_Ns[i]/2, mean=11, sd=2)
  bal_1_1_p[i] <- t.test(group_1, group_2)$p.value
  bal_1_1_se[i] <- t.test(group_1, group_2)$stderr
}




## 1:2 balance
## (note: if round() is not used, rnorm() will always round down for n)
bal_1_2_p <- vector(length=length(seq(10,200,10)))
bal_1_2_se <- vector(length=length(seq(10,200,10)))

for(i in 1:length(seq(10,200,10))) {
  group_1 <- rnorm(n=round(comb_Ns[i]*(2/3)), mean=10, sd=2)
  group_2 <- rnorm(n=round(comb_Ns[i]*(1/3)), mean=11, sd=2)
  bal_1_2_p[i] <- t.test(group_1, group_2)$p.value
  bal_1_2_se[i] <- t.test(group_1, group_2)$stderr
}


## plot p-value vs. combined sample size relationship for balanced and unbalanced
plot(y=bal_1_1_p, x=comb_Ns, type='n', ylab="p-value",
     xlab="combined sample size")
points(y=bal_1_1_p, x=comb_Ns, col="blue")
points(y=bal_1_2_p, x=comb_Ns, col="red")
abline(h=0.05, lty=2)

## plot std. err. vs. combined sample size
plot(y=bal_1_1_se, x=comb_Ns, type='n', ylab="std. err",
     xlab="combined sample size")
points(y=bal_1_1_se, x=comb_Ns, col="blue")
points(y=bal_1_2_se, x=comb_Ns, col="red")
abline(h=0.05, lty=2)






