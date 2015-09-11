# Problem 3

setwd("/Users/jackiemartinez/junior_fall/stat139/")
df <- read.csv("ORingData.csv")

#part a
summary(df$temp)
df.desc <- summary(df[,c("temp", "oring_damage")])
# flight_id          temp        oring_damage   
# Min.   :  1.0   Min.   :53.00   Min.   : 0.000  
# 1st Qu.:  7.5   1st Qu.:67.00   1st Qu.: 0.000  
# Median :414.0   Median :70.00   Median : 0.000  
# Mean   :332.3   Mean   :69.17   Mean   : 1.435  
# 3rd Qu.:515.5   3rd Qu.:74.00   3rd Qu.: 3.000  
# Max.   :613.0   Max.   :81.00   Max.   :11.000
colnames(df.desc) <- c("temp", "oring_damage")
sds <- data.frame(temp=paste0("Std Dev: ", sd(df$temp)),
                  oring_damage=paste0("Std Dev: ", sd(df$oring_damage)))
# temp                        oring_damage
# 1 Std Dev: 6.93248069146604 Std Dev: 2.67694002643659
prop_null <- sum(!df$oring_damage==0.00)/sum(df$oring_damage==0.00)
# 0.4375

#part b
res_vec <- split(df, df$oring_damage==0.00)
no_damage <- res_vec[[2]]; damage <- res_vec[[1]]
summary(no_damage[,c("temp")]) 
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 66.00   67.00   70.00   71.56   75.25   81.00 
summary(damage[,c("temp")])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 53.00   57.50   63.00   63.71   70.00   75.00

#part c
#perform a t test on both groups
# hypothesis: there is no statistical difference between the temperatures of launches with ORing
#             damage and those without ORing damage
# test statistic:
t_stat <- t.test(damage$temp, no_damage$temp)$statistic
# -2.366152
# p-value:
p_val <-  t.test(damage$temp, no_damage$temp)$p.value
# 0.04570515


# if the p value is less than .05, then you can accept the alternative hypothesis that this didn't happen by random chance.

