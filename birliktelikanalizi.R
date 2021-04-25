
install.packages("arules")
library(arules)
library(dplyr)

set.seed(15)

df <- data.frame(orderID = sample(c(1:1000),5000,replace =TRUE ),
                 product = sample(c('NULL','a','b','c','d','e','f','g','h'),
                                  5000, replace=TRUE,
                 prob = c(0.15,0.65,0.3,0.15,0.1,0.1,0.2,0.1,0.15)))


df$orderID <- as.factor(df$orderID)

df <- df[df$product!="NULL",]

df2 <- df %>% group_by(orderID) %>% mutate(product = paste0(product,collapse = ";"))

df2 <- df2[!base::duplicated(df2$orderID),]

str(df2)

summary(df2)

df2[df2$orderID == "426"]

#max ile en buyuk deger
#nchar ile karakter uzunlugu
max(nchar(df2$product))

arules::subset()

?subset

?as

Subcategories <- arules::subset(df$product,df$product!='NULL')

Transactions <- arules::subset(df$orderID, df$product!='NULL')

Transactions_by_Subcategories <- split(Subcategories, Transactions)

?split

basket <- as(Transactions_by_Subcategories,'transactions')

rules <- apriori(basket, parameter = list(support=0.000003, confidence = 0.01))

rules_df <- data.frame(lhs = labels(lhs(rules)), rhs = labels(rhs(rules)), rules@quality)

rules_df$lhs <- gsub("[{}]", "", rules_df$lhs)
rules_df$rhs <- gsub("[{}]", "", rules_df$rhs)

rules_df <- rules_df[order(rules_df$confidence,decreasing = T),]

?apriori

##########################################
# gercek veri ile birliktelik kurallari analizi

groceries <- read.transactions("http://www.sci.csueastbay.edu/~esuess/classes/Statistics_6620/Presentations/ml13/groceries.csv", sep = ",")

summary(groceries)

inspect(groceries[1:10])

?itemFrequencyPlot


itemFrequencyPlot(groceries, support = 0.05)

itemFrequencyPlot(groceries, topN = 15)


?apriori

rules <- apriori(groceries, parameter = list(support = 0.006, confidence = 0.25))

inspect(rules[1:3])

rules_df <- data.frame(lhs = labels(lhs(rules)), rhs = labels(rhs(rules)), rules@quality)

rules_df$lhs <- gsub("[{}]", "", rules_df$lhs)

rules_df$rhs <- gsub("[{}]", "", rules_df$rhs)

rules_df <- rules_df[order(rules_df$confidence, decreasing = T), ]

berryrules <- subset(rules, items %in% "berries")

inspect(berryrules)

rules_df <- rules_df[order(rules_df$lift, decreasing = T), ]

rules_df <- rules_df[order(rules_df$count, decreasing = T), ]

#####################################
