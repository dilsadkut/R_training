##################################
x=1:10
y=c("a","b","c","d","e","f","g","h","i","j")
z=c(T,F,T,F,T,F,T,F,T,T)

#cbind matrix'e çevirir

t=cbind(x,y,z)

class(t)

t

dfT =  data.frame(t)

t[,1]
t[1,1]
t[1,]
t[,2]


dfT$y
dfT$x
dfT$z

dfT$y[1]
y[1]
dfT$Y[1,1]
dfT[1,1]

############################

str(dfT)

dfT$z = as.logical(dfT$z)
dfT$y = as.character(dfT$y)
dfT$x = as.numeric(dfT$x)

str(dfT)

dfTx2= as.numeric(dfT$X)

dfT$x= as.numeric(as.character(dfT$x))

str(dfT)

##################################

sarap = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv",sep=";")

?read.csv

class(sarap)

str(sarap)

plot(sarap)

?cor

cor(sarap$alcohol,sarap$quality)
cor(sarap$quality,sarap$pH)
cor(sarap$pH,sarap$quality)

cor(sarap$quality,sarap$fixed.acidity)

##################################

sarap[1,1]
sarap[1,]
df=sarap[1:3,]
1:3
df=sarap[, 1:3]

df2= sarap[,c(8,11,12)]

1:3
c(1,2,3)
c(8,11,12)

plot(df2)

cor(df2$density,df2$alcohol)

##################################

#sutun bazli dongu
sapply()

mean(sarap$fixed.acidity)
mean(sarap$volatile.acidity)

?sapply

sapply(sarap, function(x) {mean(x)})

df3=sapply(sarap, function(x) {x/10})

sapply(sarap, function(x) {median(x)})

#################################
NULL

class(NULL)

################################

getwd()
setwd("/Users/lenovo/Documents")
ev=readcsv("ev.csv")

###################################
##Odev: Data Frame

data= read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")

str(data)
class(data)
plot(data)

sapply(data, function(x) {mean(x)})
sapply(data, function(x) {median(x)})

##############################
