"Hello World"

#integer
int1=5L
typeof(int1)
int1
#Double
dbl1=5.1
typeof(dbl1)
#Karakter
karakter4= "R cok guzeldir"
karakter1= "R"
karakter2= "Cok"
karakter3= "Guzeldir"

karakter4
#Logical / Mantiksal
TRUE, FALSE

lgcl1 = T 
lgcl2 = F
lgcl1
lgcl2
lgcl1+lgcl2

###############

int1 = 5L
int2 = 7L
5*7
int1+int2
int1*int2
typeof(int1+int2)
typeof(int1*int2)


dbl1= 5.1
dbl2= 10.6

dbl1+dbl2
typeof(dbl1+dbl2)
typeof(dbl1*dbl2)


typeof(karakter2)

paste(karakter1,karakter2)
paste(karakter1,karakter2,karakter3)

TRUE+FALSE
TRUE+TRUE
FALSE+FALSE

dbl2*FALSE

A= 10<=10
A

"R" < "Programlama"

##########################

#OR, AND

(10!=10) | (10==10) # | R dilinde OR anlamina gelir

### AND

(10==10) & (10==10) # & R dilinde AND anlamina gelir


#while

A=1
while(A<=4){
  print("A 4'ten kucuk veya esit")
  A=A+1
  print(A)
}

B=0

while(B<12){
  B=B+1
  print("B degeri 1 artti")
  print(B)
}

#for
for(i in 1:10){
  print("Merhaba R")
}

for(j in 11:20){
  print("Merhaba R")
}

#if
x=4
if(x==3){
  print("x 3'e esittir.")
  
}else if(x>5){
  print("x 5'ten buyuktur.")
}else if(x==5){
  print("x 5'e esittir")
}else{
  print("x 3'e ve 5'e esit degil ve 5'ten buyuk degildir")
}

if(x==1){
  print("x 1'e esittir")
}else{
  print("x 1'e esit degildir")
}

#degisken atama sekilleri
a = 10
b <- 11

# Programlama Ödevi-1

sayi= 1
while(sayi<3){
  if(sayi<3){
    print(sayi)
    print("sayi degeri 3 ten kucuk")
    
   
  }
  else{
    print(sayi)
    print("sayi degeri 3 ten buyuk")
  }
  sayi=sayi+1
}


for(i in 1:10){
  if(i>=10){
    print("Dongu sonlandi")
  }
  else{
    print("Sayi 1 arttiriliyor")
    print(i)
  }
}
  






