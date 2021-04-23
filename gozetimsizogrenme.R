set.seed(2)
x <- matrix(rnorm(50*2),ncol=2)

x[1:25,1] = x[1:25,1]+3
x[1:25,2] = x[1:25,2]-4

?kmeans

sonuc = kmeans(x,2,nstart = 20)

sonuc$cluster

plot(x, col=(sonuc$cluster+1), main="K-Means Clustering", xlab="",ylab="",pch=20,cex=2)

sonuc3 = kmeans(x,3,nstart = 20)

plot(x, col=(sonuc3$cluster+1), main="K-Means Clustering", xlab="",ylab="",pch=20,cex=2)

#grup bazli noktalarin uzaklik kareleri toplami
sonuc$tot.withinss

sonuc3$tot.withinss

sonuc4 = kmeans(x,4,nstart = 1)

plot(x, col=(sonuc4$cluster+1), main="K-Means Clustering", xlab="",ylab="",pch=20,cex=2)

sonuc4$tot.withinss
