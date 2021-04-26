###################

data <- data.frame(YAS = c('GENC', 'GENC', 'ORTA YASLI','65 YASUSTU' , '65 YAS USTU', '65 YAS USTU','ORTA YASLI', 'GENC',
                           'GENC','65 YAS USTU','GENC','ORTA YASLI','ORTA YASLI','65 YAS USTU'),
                   GELIR = c('YUKSEK', 'YUKSEK', 'YUKSEK',
                             'ORTA', 'DUSUK', 'DUSUK', 'DUSUK', 'ORTA', 'DUSUK', 'ORTA',
                             'ORTA', 'ORTA', 'YUKSEK', 'ORTA'),
                   KREDI_SKORU = c('ORTALAMA', 'YUKSEK',
                                   'ORTALAMA', 'ORTALAMA', 'ORTALAMA','YUKSEK', 'YUKSEK',
                                   'ORTALAMA', 'ORTALAMA', 'ORTALAMA', 'YUKSEK', 'YUKSEK',
                                   'ORTALAMA', 'YUKSEK'),
                   BILGISAYAR_ALDI = c('HAYIR', 'HAYIR', 'EVET',
                                       'EVET', 'EVET', 'HAYIR', 'EVET', 'HAYIR', 'EVET', 'EVET',
                                       'EVET', 'EVET', 'EVET', 'HAYIR'))


# yasi genc, geliri ortalama, kredi skoru ortalama olan birisinin bilgisayar alma ihtimali nedir?
#P(H|X)
#P(H)

P_Bilg_Alir <- sum(data$BILGISAYAR_ALDI == "EVET") /
  length(data$BILGISAYAR_ALDI)
P_Bilg_Almaz <- sum(data$BILGISAYAR_ALDI == "HAYIR") /
  length(data$BILGISAYAR_ALDI)

# yasi genc olan birisinin bilgisayar alma ihtimali
# bilgisayar almis ve GENC olan kisilerin toplam bilgisayar alan kisilere orani

PGENC_E <- sum(data$BILGISAYAR_ALDI == "EVET" & data$YAS ==
                 "GENC") / sum(data$BILGISAYAR_ALDI == "EVET")
PGENC_H <- sum(data$BILGISAYAR_ALDI == "HAYIR" & data$YAS ==
                 "GENC") / sum(data$BILGISAYAR_ALDI == "HAYIR")

# bilgisayar almis ve geliri ORTA kisilerin toplam bilgisayar alan kisilere orani

PGELIR_E <- sum(data$BILGISAYAR_ALDI == "EVET" & data$GELIR ==
                  "ORTA") / sum(data$BILGISAYAR_ALDI == "EVET")
PGELIR_H <- sum(data$BILGISAYAR_ALDI == "HAYIR" & data$GELIR ==
                  "ORTA") / sum(data$BILGISAYAR_ALDI == "HAYIR")

# bilgisayar almis ve kredi skoru ORTALAMA kisilerin toplam bilgisayar alan kisilere orani

PKREDI_E <- sum(data$BILGISAYAR_ALDI == "EVET" &
                  data$KREDI_SKORU == "ORTALAMA") / sum(data$BILGISAYAR_ALDI ==
                                                          "EVET")
PKREDI_H <- sum(data$BILGISAYAR_ALDI == "HAYIR" &
                  data$KREDI_SKORU == "ORTALAMA") / sum(data$BILGISAYAR_ALDI ==
                                                          "HAYIR")

# P(X|BILGISAYAR ALDI = "EVET") P(X|H)
PXE <- PGENC_E * PGELIR_E * PKREDI_E

# P(X|BILGISAYAR ALDI = "HAYIR")
PXH <- PGENC_H * PGELIR_H * PKREDI_H

# hangisi ihtimali maximize ediyor?
PXE * P_Bilg_Alir
PXH * P_Bilg_Almaz
BU_KISI_BILG_ALIR <- PXE * P_Bilg_Alir / (PXE * P_Bilg_Alir + PXH * P_Bilg_Almaz)
BU_KISI_BILG_ALMAZ <- PXH * P_Bilg_Almaz / (PXE * P_Bilg_Alir + PXH *
                                              P_Bilg_Almaz)
BU_KISI_BILG_ALIR
BU_KISI_BILG_ALMAZ

#P(H|X)

#########################################
#Adult veri seti ile calisma

getwd()
setwd("/Users/lenovo/Desktop")

data= read.csv("adult.csv")

##################

str(data)

apply(data, 2, function(x) sum(is.na(x)))
apply(data, 2, function(x) sum(x == "?"))

#################################


library(ggplot2)
ggplot(data) + geom_bar(aes(x = income, fill = sex))
ggplot(data) + geom_bar(aes(x = income, fill = race))


sum(data$race == "White" & data$income == ">50K") /
  sum(data$income == ">50K")
sum(data$race == "White" & data$income == "<=50K") /
  sum(data$income == "<=50K")
sum(data$race == "Black" & data$income == ">50K") /
  sum(data$income == ">50K")
sum(data$race == "Black" & data$income == "<=50K") /
  sum(data$income == "<=50K")
sum(data$race == "Other" & data$income == ">50K") /
  sum(data$income == ">50K")
sum(data$race == "Other" & data$income == "<=50K") /
  sum(data$income == "<=50K")

str(data)

length(unique(data$hours.per.week))

ggplot(data) + geom_boxplot(aes(x = income, y = hours.per.week))

#################################



data$workclass <- ifelse(data$workclass == "?", "Unknown",
                         data$workclass)

str(data)

data$native.country <- ifelse(data$native.country == "?",
                              "Unknown", data$native.country)
str(data)

data$occupation <- ifelse(data$occupation == "?", "Unknown",
                          data$occupation)
str(data)

#####################################

ggplot(data) + geom_bar(aes(x = income, fill = occupation))


sum(data$occupation == "Unknown" & data$income == ">50K") /
  sum(data$income == ">50K")

sum(data$occupation == "Unknown" & data$income == "<=50K") /
  sum(data$income == "<=50K")

ggplot(data) + geom_bar(aes(x = income, fill = workclass))

sum(data$workclass == "Unknown" & data$income == ">50K") /
  sum(data$income == ">50K")

sum(data$workclass == "Unknown" & data$income == "<=50K") /
  sum(data$income == "<=50K")

ggplot(data) + geom_bar(aes(x = income, fill = native.country))

sum(data$native.country == "Unknown" & data$income == ">50K") /
  sum(data$income == ">50K")

sum(data$native.country == "Unknown" & data$income == "<=50K") /
  sum(data$income == "<=50K")

# Naive Bayes

install.packages("e1071")
library(e1071)

set.seed(123)

rows <-
  sample(1:length(data$age),round(0.75*length(data$age),digits=0))

train<-data[rows, ]
test<-data[-rows, ]

e1071::naiveBayes()
?naiveBayes

########################

model <- naiveBayes(income~., data = train)
model

pred <- predict(model, test[,-15])
length(pred)

sum(is.na(pred))

table(test$income, pred)

#Toplam dogruluk orani
(5716 + 997) / (5716 + 997 + 407 + 1020)

#50.000'den kucuk gelire sahip kisi
5716 / (5716 + 407)

#50.000'den buyuk gelire sahip kisi
997 / (997 + 1020)

#################################