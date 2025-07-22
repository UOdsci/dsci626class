#### R script to simulate data for power analysis
#### (to be run on UO Talapas cluster)


library(faux)

## 1. Set working directory on Talapas
setwd("/projects/nereus/csmall/foundstats/wheat_demo")


## 2. Define parameter estimates from original data
##    (see section 4. from 01_Initial_Analysis.R)

mean_grain <- 3.94864

mean_straw <- 6.5148

sd_grain <- 0.4582796
  
sd_straw <- 0.8983069

corr_r_l <- 0.6859911
  
corr_r_min <- 0.3
  
  


##################################################################
## 3. Perform simulations using the lower CI-value for corr. coef.
##    AND an alpha of 0.05 
##################################################################
set.seed(456)

# Construct a df with a pre-allocated column for power
power_df_low_05 <- data.frame(seq(from=50, to=500, by=50),
                       vector(length=length(seq(from=50, to=500, by=50))))

colnames(power_df_low_05) <- c("sample_size","power")


# Within the for loop, we iterate over Ns, simulating 1000 tests for each N

for(i in 1:length(power_df_low_05$sample_size)) {
  
  pvals <- replicate(n=1000, {
    sim_df <- rnorm_multi(n=power_df_low_05$sample_size[i],
                          mu=c(mean_straw, mean_grain),
                          sd=c(sd_straw, sd_grain),
                          r=corr_r_l)
    cor.test(x=sim_df[,1],
             y=sim_df[,2])$p.value
  })
                     
  #power calc.
  power_df_low_05[i,2] <- sum(pvals<0.05)/length(pvals)
}





##################################################################
## 4. Perform simulations using the lower CI-value for corr. coef.
##    AND a very conservative alpha of 0.001 
################################################################## 

set.seed(456)

# Construct a df with a pre-allocated column for power
power_df_low_001 <- data.frame(seq(from=50, to=500, by=50),
                              vector(length=length(seq(from=50, to=500, by=50))))

colnames(power_df_low_001) <- c("sample_size","power")


# Within the for loop, we iterate over Ns, simulating 1000 tests for each N

for(i in 1:length(power_df_low_001$sample_size)) {
  
  pvals <- replicate(n=1000, {
    sim_df <- rnorm_multi(n=power_df_low_001$sample_size[i],
                          mu=c(mean_straw, mean_grain),
                          sd=c(sd_straw, sd_grain),
                          r=corr_r_l)
    cor.test(x=sim_df[,1],
             y=sim_df[,2])$p.value
  })
  
  #power calc.
  power_df_low_001[i,2] <- sum(pvals<0.001)/length(pvals)
}





##################################################################
## 5. Perform simulations using a minimal, low corr. coef. (0.3)
##    AND an alpha of 0.05 
##################################################################
set.seed(456)

# Construct a df with a pre-allocated column for power
power_df_min_05 <- data.frame(seq(from=50, to=500, by=50),
                              vector(length=length(seq(from=50, to=500, by=50))))

colnames(power_df_min_05) <- c("sample_size","power")


# Within the for loop, we iterate over Ns, simulating 1000 tests for each N

for(i in 1:length(power_df_min_05$sample_size)) {
  
  pvals <- replicate(n=1000, {
    sim_df <- rnorm_multi(n=power_df_min_05$sample_size[i],
                          mu=c(mean_straw, mean_grain),
                          sd=c(sd_straw, sd_grain),
                          r=corr_r_min)
    cor.test(x=sim_df[,1],
             y=sim_df[,2])$p.value
  })
  
  #power calc.
  power_df_min_05[i,2] <- sum(pvals<0.05)/length(pvals)
}




##################################################################
## 6. Perform simulations using a minimal, low corr. coef. (0.3)
##    AND a very conservative alpha of 0.001 
##################################################################
set.seed(456)

# Construct a df with a pre-allocated column for power
power_df_min_001 <- data.frame(seq(from=50, to=500, by=50),
                              vector(length=length(seq(from=50, to=500, by=50))))

colnames(power_df_min_001) <- c("sample_size","power")


# Within the for loop, we iterate over Ns, simulating 1000 tests for each N

for(i in 1:length(power_df_min_001$sample_size)) {
  
  pvals <- replicate(n=1000, {
    sim_df <- rnorm_multi(n=power_df_min_001$sample_size[i],
                          mu=c(mean_straw, mean_grain),
                          sd=c(sd_straw, sd_grain),
                          r=corr_r_min)
    cor.test(x=sim_df[,1],
             y=sim_df[,2])$p.value
  })
  
  #power calc.
  power_df_min_001[i,2] <- sum(pvals<0.001)/length(pvals)
}


  
  
## 7. Export the simulation results as an .RData object

save(power_df_low_05,
     power_df_low_001,
     power_df_min_05,
     power_df_min_001,
     file="wheat_power_sims.RData")







