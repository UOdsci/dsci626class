#### A 4-category goodness of fit (Chi-squared test) in R

## We have a dihybrid (two-trait) cross, and we are looking at segregation
## of corn kernel phenotypes in the F2 generation

## 4 phenotypic categories:
## Purple_smooth
## Purple_wrinkled
## Yellow_smooth
## Yellow_wrinkled

## (Mendelian expectation is 9:3:3:1 ratio)

kernel_counts <- c(1023, 341, 200, 36)

#organize counts into data frame with category labels:
kernel_type <- gl(n=4, k=1, length=4,
                  labels=c("purp_smooth","purp_wrink",
                           "yellow_smooth","yellow_wrink"))

kernel_data <- data.frame(kernel_type, kernel_counts)


#format as table
kernel_table <- xtabs(kernel_counts ~ kernel_type, data=kernel_data)


#run the chi-square test for goodness of fit
chi_result <- chisq.test(kernel_table, p=c(9/16, 3/16 , 3/16, 1/16), 
                         correct=F)

chi_result



#what about our assumption about expected counts?
chi_result$expected





#### Small exercise, using R's "Titanic" dataset:
#### Using the adult surviving passenger numbers, test whether
#### the relative proportions of females across classes
#### deviate from a 57:14:75:192 expected ratio (based on the male data)

str(Titanic) # array dimension are Class, Sex, Age, and Survived

## To subset Dim3 Age (Adult), and Dim4 Survived (Yes): 
Titanic[,,2,2]

Titanic[,,2,2][,2] # vector of Female counts from subset
