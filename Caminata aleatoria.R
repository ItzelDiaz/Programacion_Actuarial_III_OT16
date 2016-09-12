SalArriba <- 0
SalAbajo <- 0
for(i in 1:100){
  z<-5
  caminata <- vector("numeric")
while(z>=3 && z<=10){
  print(z)
  caminata <- c(caminata,z)
  moneda<-rbinom(1,1,0.5)
  if(moneda==1){ #Caminata aleatoria
    z <- z+1
  }else{
    z <- z-1
  }
}
  if (z==11){
    SalArriba <- SalArriba + 1
  } else {if(z==2){
    SalAbajo <- SalAbajo + 1
  }
  }
}
print(SalArriba)
print(SalAbajo)





