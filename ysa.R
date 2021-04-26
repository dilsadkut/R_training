#################
#Yapay sinir aglari

install.packages("MASS")
library(MASS)

install.packages("neuralnet")
library(neuralnet)

Boston.scaled = as.data.frame(scale(Boston))

?Boston

min.med = min(Boston$medv)
max.med = max(Boston$medv)

Boston.scaled$medv = scale(Boston$med, center = min.med, scale = max.med - min.med)

Boston.train.scaled = Boston.scaled[1:400,]
Boston.test.scaled = Boston.scaled[401:506,]

?model.matrix

Boston.nn = neuralnet(medv ~ crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat, data = Boston.train.scaled, hidden = c(5,3),linear.output = TRUE)

plot(Boston.nn)

