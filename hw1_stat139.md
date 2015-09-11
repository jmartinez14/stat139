###Stat 139 - HW1

####Problem 1. 
a. This is an example of overcoverage. She can't declare the overall mean with just a sample. She just has a sample mean. More importantly, members of larger families have a higher probability of being selected, and would therefore skew the results in the higher direction. Sampling: This is a simple random sample.

b. The congressional example is an example of undercoverage. There is a large sampling bias because not everyone who has opinions on gun control will write to their congressperson. There is a chance that opponents would be more likely to write letters. Sampling: None, this is a census style. 

####Problem 2
a. **study units**: people (individuals) 
**treatment groups**: Experiment Group 1 (Coppertone receivers), Experiment Group 2 (Banana Boat recievers), Control group (placebo receivers) 
**strata**: Tuesday, Wednesday, Thursday

b. Obtaining samples on three different days is a form of stratified sampling, which takes into account the possibility that groups of people who come on different days may have different characteristics

c. A couple factors that lead to the potential to make causal inferences or inferences about the general population are that: the study units are picked at random as well, the division into treatment groups is random, the random sample is stratified, and the measurement, time of day, and location, are standardized. Because of this first factor, the study has both external and internal validity.

d. Have the same 30 people go to the beach three different days. Because from day to day, the people change as well as the level of sun. 

####Problem 3
a\. The results of the descriptive statistics are listed below.
```R
summary(df)
# flight_id          temp        oring_damage   
# Min.   :  1.0   Min.   :53.00   Min.   : 0.000  
# 1st Qu.:  7.5   1st Qu.:67.00   1st Qu.: 0.000  
# Median :414.0   Median :70.00   Median : 0.000  
# Mean   :332.3   Mean   :69.17   Mean   : 1.435  
# 3rd Qu.:515.5   3rd Qu.:74.00   3rd Qu.: 3.000  
# Max.   :613.0   Max.   :81.00   Max.   :11.000

sds <- data.frame(temp=paste0("Std Dev: ", sd(df$temp)),
                  oring_damage=paste0("Std Dev: ", sd(df$oring_damage)))
# temp                        oring_damage
# 1 Std Dev: 6.93248069146604 Std Dev: 2.67694002643659

prop_null <- sum(!df$oring_damage==0.00)/sum(df$oring_damage==0.00)
# 0.4375
```

b\. Ostensibly, the average temperatures for flights with no ORing damage were higher than those with ORing damage.
```R
res_vec <- split(df, df$oring_damage==0.00)
no_damage <- res_vec[[2]]; damage <- res_vec[[1]]

summary(no_damage[,c("temp")]) 
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 66.00   67.00   70.00   71.56   75.25   81.00 
summary(damage[,c("temp")])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 53.00   57.50   63.00   63.71   70.00   75.00
```

c\. Performed Welch's two-sample t-test on the two groups. Since the resultant p-value was less than 0.05, we can reject the null hypothesis that the difference in these means is 0. Therefore, the conclusion of this t-test is that the difference between these two groups is statistically significant.
```R
# hypothesis: there is no statistical difference between the temperatures of launches with ORing
#             damage and those without ORing damage
# test statistic:
t_stat <- t.test(damage$temp, no_damage$temp)$statistic
# -2.366152
# p-value:
p_val <-  t.test(damage$temp, no_damage$temp)$p.value
# 0.04570515
```

d\. My professional opinion would be to delay the launch until the temperatures increased. Based on the results of the t-test, which suggested that ORing damage was more prevalent in launches with lower temperatures, temperatures lower than the "damage" mean of 63.71 are concerning. Even if the difference between mean temperatures in cases of some ORing damages vs. cases with no ORing damages is minimal, temperatures of 26-29 degrees are less than half of the "damage" mean. With any big launch, outlier conditions should be approached with extreme caution, so I would suggest delaying the launch. 

