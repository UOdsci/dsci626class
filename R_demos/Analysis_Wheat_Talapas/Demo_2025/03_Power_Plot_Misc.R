#### R script to plot/evaluate power simulation results, save
#### and explore other features of the orig. data


## 1. Read in the power simulation results (from Talapas),
##    and the original data set

load("wheat_power_sims.RData")


mhw_data <- read.delim("mhw.csv", sep=",")

head(mhw_data)
dim(mhw_data)



## 2. Plot the power simulation results

# Plot for the lower CI corr. value of 0.6859911
plot(x=power_df_low_05$sample_size, y=power_df_low_05$power, ylim=c(0,1),
     ylab="Power", xlab="Sample size (plot number)",
     main="Power simulations for r=0.6860")

points(x=power_df_low_001$sample_size, y=power_df_low_001$power,
       ylim=c(0,1),
       col="blue")

abline(h=0.8, lty="dashed")

points(x=c(350,350), y=c(0.2,0.3),
       col=c("blue","black"))

text(x=c(350,350), y=c(0.2,0.3),
     labels=c("alpha=0.001", "alpha=0.05"),
     pos=c(4,4), cex=0.75)



# Plot for the minimal corr. value of 0.3
plot(x=power_df_min_05$sample_size, y=power_df_min_05$power, ylim=c(0,1),
     ylab="Power", xlab="Sample size (plot number)",
     main="Power simulations for r=0.3")

points(x=power_df_min_001$sample_size, y=power_df_min_001$power,
       ylim=c(0,1),
       col="blue")

abline(h=0.8, lty="dashed")

points(x=c(350,350), y=c(0.2,0.3),
       col=c("blue","black"))

text(x=c(350,350), y=c(0.2,0.3),
     labels=c("alpha=0.001", "alpha=0.05"),
     pos=c(4,4), cex=0.75)




## 3. On your own: explore other features of the original data
##    (e.g., is there spatial variation in yield?)



