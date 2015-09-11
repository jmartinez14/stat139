###Stat 139 - HW1

####Problem 1. 
For each of the following surveys discuss in 2-3 sentences any possible sources of selection
bias, specifically, undercoverage or overcoverage. Finally, specify what type of sampling was used.

(a) Jill wanted to estimate the mean size of families in her community. She obtained a list of all
the people in her community and used a table of random digits to select a simple random sample
of individuals for her study. Jill then determined the family size for each individual selected in her
sample and calculated the overall mean family size.
(b) A congresswoman reported that letters to her office were running 3 to 1 in opposition to the
passage of stricter gun control laws. She concluded that the vast majority of her constituents opposed
stricter gun control laws.

Problem 1
a. idea: over coverage? She already had all the data so why didn’t she just use a mean? Other factor: not every individual is part of a family. Also, she can't declare the overall mean with just a sample. She just has a sample mean. Larger families have a higher probability of producing bigger results. (family of 40 has a higher probability of skewing the results) Sampling: This is a simple random sample. 
b. The congressional example is an example of undercoverage. There is a large sampling bias because not everyone who has opinions on gun control will write to their congressperson. There is a chance that opponents would be more likely to write letters. Sampling: None, census?

####Problem 2
You are interested in performing an experiment to compare the effectiveness of three
sunscreens. The experiment will be carried out at Cranes Beach in Ipswich Massachusetts. Rather
than obtaining your sample of people on a single day, you obtain three separate groups of people
on each of three days (Tuesday, Wednesday, and Thursday). On each day at precisely 11:00am, you
gather a random sample of 30 people at the beach, so that a total of 90 people are involved in the
study. Each study participant is randomly assigned to put on either. Coppertone, Banana Boat, or
a placebo (10 of each brand on each day). You measure the amount of skin redness three hours later
using a special instrument from your lab.
(a) Identify the study units, the treatment groups, the strata (sometimes called blocks in an experiment),
and the response variable in this experiment.
(b) What is the advantage to obtaining samples on three different days rather than one large sample
on a single day?
(c) What aspects of the experimental design allow you (potentially) to be able to conclude that using
one suntan lotion causes less redness than another? Do you believe this study has both internal and
external validity?
(d) How would you modify this study in order to reduce the variability in the response variable? Hint:
think how to subtract out a source of variability in the response.


a. **study units**: people (individuals) **treatment groups**: Experiment Group 1 (Coppertone receivers), Experiment Group 2 (Banana Boat recievers), Control group (placebo receivers) **strata**: Tuesday, Wednesday, Thursday

b. Obtaining samples on three different days is a form of stratified sampling, which takes into account the possibility that groups of people who come on different days may have different characteristics

c. A couple factors that lead to the potential to make causal inferences or inferences about the general population are that: the study units are picked at random as well, the division into treatment groups is random, the random sample is stratified, and the measurement, time of day, and location, are standardized. Because of this first factor, the study has both external and internal validity.

d. Have the same 30 people go to the beach three different days. Because from day to day, the people change as well as the level of sun. 

####Problem 3
The “ORingData.csv” data set on the course website contains information on O-ring
damage (a measure of the total number of incidents of O-ring erosion, heating, and blow-by) and
temperature at lift-off, in degrees Fahrenheit (F), for all 23 previous flights of the space shuttle
Challenger prior to its explosion on January 28, 1986. Some basic directions for using R follow this
problem.
(a) Calculate the following summary statistics for both the temp and oring damage variables: sample
mean, sample SD, min, median, max, 1st and 3rd quartiles. Also calculate the proportion of launches
that had any O-ring damage at all.
(b) Split the observations into two groups: the launches with no O-ring damage vs. launches with
some O-ring damage. Use summary statistics and graphics to explore whether there is evidence of
a difference in temperature on flights when there was no damage to the O-rings vs. flights for when
there was any damage at all. Comments on the results without performing a formal hypothesis test.
(c) Perform an appropriate hypothesis test to determine whether temperature at lift-off differs between
flights where there is no O-ring damage vs. flights where there is some O-ring damage. Be sure to
state the hypotheses, calculate the test statistic, draw or produce a plot of the reference distribution
for the test statistic, calculate the p-value based on this distribution, and state the conclusion of the
procedure (be sure to mention the scope of the inference). Note: we will be very lenient in grading
this problem.
(d) It is the morning of January 28, 1986, and the temperature at lift-off is predicted to be 26-29
degrees F. NASA would like your professional opinion on whether they should launch the rocket later
in the morning. Provide a one paragraph (3-5 sentences) summary of whether they should go ahead
with the launch.


a. The results of the descriptive statistics are listed below.
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


b. Ostensibly, the average temperatures for flights with no ORing damage were higher than those with ORing damage.
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

c. Performed Welch's two-sample t-test on the two groups. Since the resultant p-value was less than 0.05, we can reject the null hypothesis that the difference in these means is 0. Therefore, the conclusion of this t-test is that the difference between these two groups is statistically significant.
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

