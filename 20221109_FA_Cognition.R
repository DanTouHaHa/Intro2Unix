setwd("C:/Users/侯文捷/Desktop/LZL")
library(readxl)
allparticipants_FA <- read_excel("allparticipants_FA.xlsx")
View(allparticipants_FA)
library(lmerTest)
library(tidyverse)
library(effects)
library(effectsize)
library(simr)
library(emmeans)
library(blme)
library(lm.beta)
#section all subjects----
allparticipants_FA <- as.data.frame(allparticipants_FA)
##### N5 
result_allSub_FA_N5 <- c()
for (i in 43:54){
  fit <- lm(N5 ~ allparticipants_FA[,i] +
                Age + EDUTotal + BS5 + Gender +
                JDiabetes  + JHLP + JCVD, data = allparticipants_FA)
  result_allSub_FA_N5 <- rbind(result_allSub_FA_N5,
                                c(colnames(allparticipants_FA)[i], coef(summary(fit))[2,c(1,3,4)])) 
}
result_allSub_FA_N5 <- as.data.frame(result_allSub_FA_N5)
colnames(result_allSub_FA_N5)[4] = 'pvalue'
result_allSub_FA_N5$P.Adj <- p.adjust(result_allSub_FA_N5$pvalue, method = 'fdr', n = length(result_allSub_FA_N5$pvalue))
write.csv(result_allSub_FA_N5, file = "C:/Users/侯文捷/Desktop/LZL/result_allSub_FA_N5.csv")


##### TMTB
result_allSub_FA_TMTB <- c()
for (i in 43:54){
  fit <- lm(TMT.B ~ allparticipants_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allparticipants_FA)
  result_allSub_FA_TMTB  <- rbind(result_allSub_FA_TMTB ,
                               c(colnames(allparticipants_FA)[i], coef(summary(fit))[2,c(1,2,4)])) 
}
result_allSub_FA_TMTB  <- as.data.frame(result_allSub_FA_TMTB )
colnames(result_allSub_FA_TMTB )[4] = 'pvalue'
result_allSub_FA_TMTB $P.Adj <- p.adjust(result_allSub_FA_TMTB $pvalue, method = 'fdr', n = length(result_allSub_FA_TMTB $pvalue))


##### TMTA
result_allSub_FA_TMTA <- c()
for (i in 43:54){
  fit <- lm(TMT.A ~ allparticipants_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allparticipants_FA)
  result_allSub_FA_TMTA  <- rbind(result_allSub_FA_TMTA ,
                                  c(colnames(allparticipants_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allSub_FA_TMTA  <- as.data.frame(result_allSub_FA_TMTA )
colnames(result_allSub_FA_TMTA )[4] = 'pvalue'
result_allSub_FA_TMTA $P.Adj <- p.adjust(result_allSub_FA_TMTA $pvalue, method = 'fdr', n = length(result_allSub_FA_TMTA $pvalue))


#section group1 ----
del1 <- which(allparticipants_FA$GROUP == "2")
del2 <- which(allparticipants_FA$GROUP == "3")
del3 <- union(del1,del2)
allGroup1_FA <- allparticipants_FA[-del3,]
##### N5 
result_allGroup1_FA_N5 <- c()
for (i in 43:54){
  fit <- lm(N5 ~ allGroup1_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup1_FA)
  result_allGroup1_FA_N5 <- rbind(result_allGroup1_FA_N5,
                               c(colnames(allGroup1_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup1_FA_N5 <- as.data.frame(result_allGroup1_FA_N5)
colnames(result_allGroup1_FA_N5)[4] = 'pvalue'
result_allGroup1_FA_N5$P.Adj <- p.adjust(result_allGroup1_FA_N5$pvalue, method = 'fdr', n = length(result_allGroup1_FA_N5$pvalue))


##### TMTB
result_allGroup1_FA_TMTB <- c()
for (i in 43:54){
  fit <- lm(TMT.B ~ allGroup1_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup1_FA)
  result_allGroup1_FA_TMTB  <- rbind(result_allGroup1_FA_TMTB,
                                  c(colnames(allGroup1_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup1_FA_TMTB  <- as.data.frame(result_allGroup1_FA_TMTB)
colnames(result_allGroup1_FA_TMTB )[4] = 'pvalue'
result_allGroup1_FA_TMTB$P.Adj <- p.adjust(result_allGroup1_FA_TMTB $pvalue, method = 'fdr', n = length(result_allGroup1_FA_TMTB$pvalue))


##### TMTA
result_allGroup1_FA_TMTA <- c()
for (i in 43:54){
  fit <- lm(TMT.A ~ allGroup1_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup1_FA)
  result_allGroup1_FA_TMTA <- rbind(result_allGroup1_FA_TMTA ,
                                  c(colnames(allGroup1_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup1_FA_TMTA  <- as.data.frame(result_allGroup1_FA_TMTA)
colnames(result_allGroup1_FA_TMTA )[4] = 'pvalue'
result_allGroup1_FA_TMTA$P.Adj <- p.adjust(result_allGroup1_FA_TMTA $pvalue, method = 'fdr', n = length(result_allGroup1_FA_TMTA$pvalue))



#section group2 ----
del4 <- which(allparticipants_FA$GROUP == "1")
del5 <- which(allparticipants_FA$GROUP == "3")
del6 <- union(del4,del5)
allGroup2_FA <- allparticipants_FA[-del6,]
###### N5
result_allGroup2_FA_N5 <- c()
for (i in 43:54){
  fit <- lm(N5 ~ allGroup2_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup2_FA)
  result_allGroup2_FA_N5 <- rbind(result_allGroup2_FA_N5,
                                  c(colnames(allGroup2_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup2_FA_N5 <- as.data.frame(result_allGroup2_FA_N5)
colnames(result_allGroup2_FA_N5)[4] = 'pvalue'
result_allGroup2_FA_N5$P.Adj <- p.adjust(result_allGroup2_FA_N5$pvalue, method = 'fdr', n = length(result_allGroup2_FA_N5$pvalue))

##### TMTB
result_allGroup2_FA_TMTB <- c()
for (i in 43:54){
  fit <- lm(TMT.B ~ allGroup2_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup2_FA)
  result_allGroup2_FA_TMTB  <- rbind(result_allGroup2_FA_TMTB,
                                     c(colnames(allGroup2_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup2_FA_TMTB  <- as.data.frame(result_allGroup2_FA_TMTB)
colnames(result_allGroup2_FA_TMTB )[4] = 'pvalue'
result_allGroup2_FA_TMTB$P.Adj <- p.adjust(result_allGroup2_FA_TMTB $pvalue, method = 'fdr', n = length(result_allGroup2_FA_TMTB$pvalue))


##### TMTA
result_allGroup2_FA_TMTA <- c()
for (i in 43:54){
  fit <- lm(TMT.A ~ allGroup2_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup2_FA)
  result_allGroup2_FA_TMTA <- rbind(result_allGroup2_FA_TMTA ,
                                    c(colnames(allGroup2_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup2_FA_TMTA  <- as.data.frame(result_allGroup2_FA_TMTA)
colnames(result_allGroup2_FA_TMTA)[4] = 'pvalue'
result_allGroup2_FA_TMTA$P.Adj <- p.adjust(result_allGroup2_FA_TMTA$pvalue, method = 'fdr', n = length(result_allGroup2_FA_TMTA$pvalue))


#section group3 ----
del7 <- which(allparticipants_FA$GROUP == "1")
del8 <- which(allparticipants_FA$GROUP == "2")
del9 <- union(del7,del8)
allGroup3_FA <- allparticipants_FA[-del9,]
###### N5
result_allGroup3_FA_N5 <- c()
for (i in 43:54){
  fit <- lm(N5 ~ allGroup3_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup3_FA)
  result_allGroup3_FA_N5 <- rbind(result_allGroup3_FA_N5,
                                  c(colnames(allGroup3_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup3_FA_N5 <- as.data.frame(result_allGroup3_FA_N5)
colnames(result_allGroup3_FA_N5)[4] = 'pvalue'
result_allGroup3_FA_N5$P.Adj <- p.adjust(result_allGroup3_FA_N5$pvalue, method = 'fdr', n = length(result_allGroup3_FA_N5$pvalue))

##### TMTB
result_allGroup3_FA_TMTB <- c()
for (i in 43:54){
  fit <- lm(TMT.B ~ allGroup3_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup3_FA)
  result_allGroup3_FA_TMTB  <- rbind(result_allGroup3_FA_TMTB,
                                     c(colnames(allGroup3_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup3_FA_TMTB  <- as.data.frame(result_allGroup3_FA_TMTB)
colnames(result_allGroup3_FA_TMTB )[4] = 'pvalue'
result_allGroup3_FA_TMTB$P.Adj <- p.adjust(result_allGroup3_FA_TMTB$pvalue, method = 'fdr', n = length(result_allGroup3_FA_TMTB$pvalue))


##### TMTA
result_allGroup3_FA_TMTA <- c()
for (i in 43:54){
  fit <- lm(TMT.A ~ allGroup3_FA[,i] +
              Age + EDUTotal + BS5 + Gender +
              JDiabetes  + JHLP + JCVD, data = allGroup3_FA)
  result_allGroup3_FA_TMTA <- rbind(result_allGroup3_FA_TMTA ,
                                    c(colnames(allGroup3_FA)[i], coef(summary(fit))[2,c(1,2,4)])) #将目标变量(2代表ADHD症状)的β, t, p存储
}
result_allGroup3_FA_TMTA  <- as.data.frame(result_allGroup3_FA_TMTA)
colnames(result_allGroup3_FA_TMTA)[4] = 'pvalue'
result_allGroup3_FA_TMTA$P.Adj <- p.adjust(result_allGroup3_FA_TMTA$pvalue, method = 'fdr', n = length(result_allGroup3_FA_TMTA$pvalue))

save.image("20221109_LZL_FA_Cognition.RData")