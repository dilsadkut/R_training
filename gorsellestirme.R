###############
install.packages("ggplot2")
library(ggplot2)

#ggplot2 icinde mpg veri setini kullaniyoruz
ggplot2::mpg

#mpg veri setini bir degiskene atiyoruz.
veri=mpg

#mpg veri seti hakkinda bilgilendirme
?mpg
#plot fonksiyonu hakkinda bilgilendirme
?plot

plot(x=veri$displ,y=veri$hwy)

plot(x=veri$displ,y=veri$hwy,col="red")

plot(x=veri$displ,y=veri$hwy,
     col="red",xlab="Motor Hacmi",
     ylab="Galon Basina Mil", main="Motor Hacmi ve Yakit Tuketim Iliskisi",type="p")

##############################

ggplot(data = veri) + geom_function(x = ?,y = ?)

ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= hwy))

ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= cty))

######################################

install.packages("devtools")
library(devtools)
install_github("kassambara/easyGgplot2")
library(easyGgplot2)

install.packages("gridExtra")
library(gridExtra)


par()

################
#coklu grafik
g1=ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= hwy))
g1
g2=ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= cty))
g2
easyGgplot2::ggplot2.multiplot(g1,g2)

#################
#coklu grafik
par(mfrow=c(2,1))
plot(veri$displ,veri$hwy,
     col="red",xlab="Motor Hacmi",
     ylab="Galon Basina Mil", main="Motor Hacmi ve Yakit Tuketimi",type="p")
plot(veri$displ,veri$cty,
     col="red",xlab="Motor Hacmi",
     ylab="Galon Basina Mil", main="Motor Hacmi ve Yakit Tuketimi",type="p")

#################################
yakit=veri
yakit$class2 = as.factor(yakit$class)

yakit$class= as.factor(yakit$class)
str(yakit)

g1

ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= hwy, color=class))

remove.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2)

g1=ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= hwy, color=class))+ggtitle("Otoban Tuketimi")
g2=ggplot(data = veri) + geom_point(mapping = aes(x= displ , y= cty, color=class))+ggtitle("Sehirici Tuketimi")

g1
g2

ggplot2.multiplot(g1,g2)



##############################

ggplot(data=yakit) +geom_point(mapping=aes(x=displ, y=hwy, size=class))
ggplot(data=yakit) +geom_point(mapping=aes(x=displ, y=hwy, alpha=class))

ggplot(data=yakit) +geom_point(mapping=aes(x=displ, y=hwy, shape=class,color=class))+ggtitle("Otoban ve Yakit Performansi")

#####################

ggplot(data=yakit) +geom_point(mapping=aes(x=displ, y=hwy))+facet_wrap(~class, nrow=2)

##########################

elmas=ggplot2::diamonds
?diamonds

X= c("Fair","Good","Very Good","Premium","Ideal")

siraliX= factor(X, levels=c("Fair","Good","Very Good","Premium","Ideal"), ordered=TRUE)
siraliX
is.ordered(siraliX)

########

ggplot(data=elmas) +geom_bar(mapping= aes(x=cut))

?geom_bar

ggplot(data=elmas) +geom_bar(mapping=aes(x=clarity))

##################

ggplot(data=elmas) +geom_bar(mapping= aes(x=cut,color=cut)) +theme(legend.position = "none")

ggplot(data=elmas) +geom_bar(mapping= aes(x=cut,fill=cut)) +theme(legend.position = "none")

ggplot(data=elmas) +geom_bar(mapping= aes(x=cut,fill=clarity))

ggplot(data=elmas) +geom_bar(mapping= aes(x=cut,color=clarity))

?diamonds

ggplot(data=elmas) + geom_bar(mapping = aes(x=cut, fill=clarity),position = "stack")
ggplot(data=elmas) + geom_bar(mapping = aes(x=cut, fill=clarity),position = "fill")

##########################

?geom_bar

elmas= diamonds[1:3,]
?diamonds

#y ekseninin kendi sayisal degerleri
ggplot(data=elmas) + geom_bar(mapping = aes(x=cut,y=carat),stat="identity")

#################