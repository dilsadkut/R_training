#----------------------
a=1:3
b=2:4
c=4:6

matrix=cbind(a,b,c)
colnames(matrix) = c("1.Sutun","2.Sutun","3.Sutun")
rownames(matrix) = c(1111,1112,1113)

matrix2 = matrix(c(1,2,3,4,5,6,7,8,9),nrow=1,ncol=9,byrow=TRUE, dimnames = list(c("row1"),c("c1","c2","c3","c4","c5","c6","c7","c8","c9")))

?matrix
matrix3 = matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3,byrow=TRUE,dimnames=list(c("row1","row2","row3"),c("c1","c2","c3")))

#-----------------------------------

matrix1= matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)

matrix2= matrix(c(4,5,7,2,3,4,8,7,1),nrow=3,ncol=3)

matrix3=matrix1+matrix2
matrix3

matrix1[3,3]
matrix1[1,3]
matrix2[1,3]
matrix3[1,3]
matrix2[1]
matrix2[1:4]
matrix2[4]

matrix4= matrix1*matrix2

matrix4[1,1]
matrix4[1,2]
