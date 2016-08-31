# Clase del 25/08/2016

#Crear Vectores conla función vector
x <- vector(mode="numeric", length=5L)
x

#Crear vectores con la función c
x <- c(0.5, 0.6)
x
class(x)

x <- c(TRUE, FALSE, T, F)
x
class(x)

x <- 10:0
x
class(x)

x <- c(1+2i,5,3+9i, -4-5i)
x
class(x)

x<- c("a", "b", "c", "d", e)
x
class(x)

#Mezcla de objetos en un vector
y <- c(1.7, "a") #Caracter
y
class(y)

y <- c(TRUE,2) #Numérico
y
class(y)

y <- c("a", TRUE) #Caracter
y
class(y)

y <- c(TRUE, 10L, 8.5, 1+1i, "a")
y
class(y)

#Orden de coacción/coerción implícita
#1 Character
#2 Complex
#3 Numeric
#4 Integer
#5 Logical

#Coerción explícita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <-c(1+2i,3+4i,8,0+3i,0)
as.logical(z)

z <- c("Programación", "Actuarial", "III")
as.numeric(z)
as.logical(z)
as.complex(z)


#LISTAS (Es como un vector, pero de vectores y cada uno tiene su propia clase)
x <- list(1, "a", TRUE, 1+4i)
x
class(x)

#MATRICES
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
# Cambio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2)
m
#Crear una matriz con datos
m <- matrix(1:6, 3, 2)
m

m <- matrix(1:6,3,3,TRUE)
m
class(m)
str(m)

dim(m) <-c(2,5)

x <- c(1,2,3)
y <-c("a", "b","c")
z <-c(x,y)
z

m1 <- rbind(m,x)
m1

m2 <- cbind(m,x)
m2

rbind(m1,y)
cbind(m2,y)

#Factores
x <- factor(c("si", "no", "si", "si", "no", "si", "no"))
x
table(x)
unclass(x)
x <- factor(c("si", "no", "si", "si", "no", "si", "no"), levels=c("si", "no"))

x <- factor(c("azul", "azul", "rojo", "azul", "amarillo", "verde", "azul"))
x
table(x)

#Valores faltantes
x <- c(1,2, Na, 10,3)
is.na(x)
is.nan(x)

x <- c(1,2, NaN, 10,3)
is.na(x)
is.nan(x)

#Data frames
x <- data.frame(Erick= 1:4, Lori =c(T,T,F,F))
row.names(x) <- c("Primero", "segundo", "tercero", "cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x) <-c("Yarely", "Karen")
x

#Los nombres no son exclusivos de los data frames
x <- 1:3
names(x) #NULL
names(x) <-c("Hugo", "Paco", "Luis")
x
 
x <- list(a=1:10, b=100:91, c=51:60)
x
names(x) <- c("Seq1", "SEQ2", "sEq3")
x

m<- matrix(1:4,2,2)
m
attributes(m)
dimnames(m)
dimnames(m) <- list(c("fil1", "fil2"), c("col1", "col2"))
m

m <- matrix(nrow=5, ncol=5)
dimnames(m) <- list(1:5, c("A", "B", "C", "D", "E"))
m

#Lectura de datos
getwd() 
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data <- read.csv("Datos_S&P.csv")  #Manda a llamar a read table
data <- read.table("Datos_S&P.csv", T, ",")
data


            