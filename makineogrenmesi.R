##########################
#mpg
#diamonds

yakit= ggplot2::mpg
elmas =ggplot2::diamonds

####################################

#Tahmin Edilecek Deger = Etki Miktari*Etki Eden Deger + Kesisim

#Tahmin Edilen Ev Fiyati = Etki Miktari*Ev Buyuklugu + Kesisim

###############################

ev= data.frame(
  EvBuyuklugu = c(80,83,76,60,90,100,120,200,45,140,140,180,190,
                  190,200,220,250,160,200,190,300,270,245,100,120),
  Fiyat = c(150000,153000,140000,120000,150000,160000,
            160000,160000,200000,150000,170000,180000,175000,
            180000,200000,230000,260000,150000,200000,195000,280000,255000,
            230000,110000,130000)
            )
?ggplot
ggplot(data = ev)+geom_point(mapping = aes(x=EvBuyuklugu, y=Fiyat)) +coord_cartesian(ylim = c(70000,250000))

###########################
#Basit dogrusal regresyon
?lm

regresyon.sonuc=lm(formula= Fiyat ~., data=ev) 
summary(regresyon.sonuc)

ggplot(data = ev)+geom_point(mapping = aes(x=EvBuyuklugu, y=Fiyat))+
  coord_cartesian(ylim=c(70000,500000))+
  geom_smooth(mapping = aes(x=EvBuyuklugu, y=Fiyat),method = "lm", formula = y~x, se= FALSE)

plot(x=ev$EvBuyuklugu,y=ev$Fiyat)
abline(lm(formula = Fiyat ~., data = ev),col="red")

#################################

?predict()

yeni.ev = data.frame(
  EvBuyuklugu = c(90,111,123,234)
)

sonuc=predict(regresyon.sonuc, yeni.ev)

sonuc


yeni.ev$Tahmin=sonuc


###############################
#Karar agaci
install.packages("tree")
library(tree)

?tree()

karar.agaci=tree(Degerlendirme ~ ., data = car)

karar.agaci

plot(karar.agaci)
text(karar.agaci, cex=0.6)
?text

############################

?predict

sonuc= predict(karar.agaci, yeni.arac)

###############
#k en yakin komsu

boy=c(160,163,168,175,180,190,165,170,185,184,191,168,178,163,176)
kilo=c(50,52,70,59,80,85,51,63,79,70,72,57,60,70,90)
z=c("K","K","E","K","E","E","K","E","E","K","K","E","K","E","E")
cinsiyet=as.factor(z)

veri = data.frame(boy=boy,kilo=kilo,cinsiyet=cinsiyet)

library(ggplot2)

ggplot(veri) + geom_point(aes(x=boy,y=kilo,color=cinsiyet))

#k - nearest neighbor KNN
install.packages("class")
library(class)
sonuc=knn(cbind(boy,kilo),k=5,c(187,75),cinsiyet)
sonuc
?knn

############################

sonuc = knn(cbind(boy,kilo),c(180,65),cinsiyet)


sonuc = knn(train.X, test.X, train.Y, k=5)

#train.X Boy-Kilo
#train.Y Cinsiyet
#test.X Bilinmeyen veri

#############################
#knn ile sigorta satis tahmini

install.packages("ISLR")
library(ISLR)
?Caravan

dim(Caravan)

karavan = Caravan

summary(Caravan$Purchase)

348/5822

karavan2 = scale(karavan[,-86])

sqrt(var(Caravan[,2]))
mean(Caravan[,2])

test=1:1000
train.X = karavan2[-test,]
test.X = karavan2[test,]
train.Y = karavan$Purchase[-test]
test.Y = karavan$Purchase[test]
library(class)
tahmin = knn(train.X,test.X,train.Y, k=5)

mean(test.Y != tahmin)

mean(test.Y != "No")

table(tahmin, test.Y)

4/ (59)

#------------------------