#### Randomly drawing values from a Bernoulli probability distribution
#### with p = 0.5

#### (The Bernoulli dist. is a special case of the binomial dist.)

#### Say 0 is "heads" and 1 is "tails" in our coin flip example       
set.seed(344)
par(mfcol=c(2,3))

## Draw 1 single value (e.g. flip the coin once)    
samp_1flips <- rbinom(n=1, size=1, prob=0.5)#size=1 makes it Bernoulli     
barplot(height=c(sum(samp_1flips==0)/length(samp_1flips),
                 sum(samp_1flips!=0)/length(samp_1flips)), 
        names.arg=c("heads", "tails"),
        ylab="Proportion of heads or tails",
        ylim=c(0,1))

## Draw 8 values (e.g. flip the coin 8 times)
samp_8flips <- rbinom(n=8, size=1, prob=0.5)#size=1 makes it Bernoulli     
barplot(height=c(sum(samp_8flips==0)/length(samp_8flips),
                 sum(samp_8flips!=0)/length(samp_8flips)), 
        names.arg=c("heads", "tails"),
        ylab="Proportion of heads or tails",
        ylim=c(0,1))



## Draw 16 values (e.g. flip the coin 16 times)


## Draw 32 values (e.g. flip the coin 32 times)
samp_32flips <- rbinom(n=32, size=1, prob=0.5)#size=1 makes it Bernoulli     
barplot(height=c(sum(samp_32flips==0)/length(samp_32flips),
                 sum(samp_32flips!=0)/length(samp_32flips)), 
        names.arg=c("heads", "tails"),
        ylab="Proportion of heads or tails",
        ylim=c(0,1))


## Draw 400 values (e.g. flip the coin 400 times)


## Draw 1000 values (e.g. flip the coin 1000 times)
samp_1000flips <- rbinom(n=1000, size=1, prob=0.5)#size=1 makes it Bernoulli     
barplot(height=c(sum(samp_1000flips==0)/length(samp_1000flips),
                 sum(samp_1000flips!=0)/length(samp_1000flips)), 
        names.arg=c("heads", "tails"),
        ylab="Proportion of heads or tails",
        ylim=c(0,1))
