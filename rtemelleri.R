vektor1=c(100, 40, 50, 67, 78, 95, 233, 345)

vektor2=c(55L,43L,56L,59L,6L,7L,19L,22L)

is.numeric(vektor1)
is.numeric(vektor2)
typeof(vektor1)
typeof(vektor2)
is.integer(vektor1)
is.integer(vektor2)
is.double(vektor2)
length(vektor1)
length(vektor2)

#Karakter

vektor3=c("R", "harika", "bir", "dil")
length(vektor3)

is.character(vektor3)

vektor4= c("merhaba","arkadaslar",4)
vektor4

length(vektor4)
typeof(vektor4)

#---- Index

vektor1[7]
vektor1[1]
vektor1[-7] #7.index dýþýnda hepsi

vektor1[1:3] #Ýlk üç deðer
1:3
c(1,2,3)
vektor1[c(1,2,3)]


#------Vektörleþtirme
?rnorm
mean(vektor1)
sd(vektor1)

vektor5<- c(0,1,0,0,3,0,1,2,0,1)
mean(vektor5)
sd(vektor5)

vektor6 = rnorm(100000, mean=0, sd=1)
vektor7 = rnorm(100000,mean=0, sd=1)

system.time(vektor6*vektor7)

v=rep(0,100000)
system.time(for(i in 1:100000){
  v[i]=vektor6[i] * vektor7[i]
})

v1=vektor6*vektor7
head(v1)
length(v1)

?cbind

v67 = cbind(vektor6,vektor7)  
v1= vektor6+vektor7
v67 = cbind(vektor6,vektor7,v1)

vektor1
vektor1.1 = vektor1[-c(6,7,8)]
vektor1+vektor1.1
vektor1.1

#---Fonksiyonlar---

fonksiyon1 = function(a,b){
  return (a+b)
}

fonksiyon1(10,15)

fonksiyon2= function(a,b){
  if(is.numeric(a) ==TRUE& is.numeric(b)==TRUE){
    return (a+b)
  }
  else if(is.character(a) == TRUE&is.character(b)==TRUE){
    return(paste(a,b,sep=" "))
  }else{
    print("Dogru kosullar saglanmadi.")
  }
}

 
fonksiyon2(10,15)
fonksiyon2("Merhaba","herkese")
fonksiyon2(10, "merhaba")

#----------------------------
cevap = c(T,T,F,T,T,T,T,F,T,T)

cevap2= c("Dogru","Dogru","Dogru","Yanlis","Dogru","Yanlis","Bos","Dogru","Dogru","Yanlis")

?factor

cevapFactor=factor(cevap2, levels=c("Dogru","Yanlis","Bos"))

cevap2

cevapFactor

v1=c(1,2,3,4,5)
summary(v1)
summary(cevap2)
summary(cevapFactor)

cevapFactor2 = factor(cevap2)
cevapFactor2
summary(cevapFactor2)

plot(cevapFactor)
plot(cevapFactor2)

#-------------------------

degisken = c(5,4)
is.double(degisken)

is.vector(degisken)

degisken = c(5,3,4,5,6)
degisken[1]

sayisal= c(2,3,5)
karakter=c("aa","bb","cc")
logical=c(T,F,T)

?list

liste=list(sayisal,karakter,logical)
liste

liste[1] #liste ici 1.index
liste[[1]] #vektördeki 1.index
liste[[2]]
liste[[3]]

sayisal = c(2,3,4,5,6,7)
karakter = c("aa","bb","cc")
logical = c(F,T)

liste2=list(sayisal,karakter,logical)
liste2

class(liste2[1])

class(liste[[1]])

#Paketler-------------------------

install.packages("ggplot2")

library(ggplot2)
ggplot2::
  
?geom_point

#----------------------------


